import '../../domain/entities/localizacao.entity.dart';
import '../../domain/entities/origem.entity.dart';
import '../../domain/entities/personagem.entity.dart';
import 'localizacao.dto.dart';
import 'origem.dto.dart';

class PersonagemDTO {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final OrigemDTO origin;
  final LocalizacaoDTO location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  const PersonagemDTO({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'origin': origin.toMap(),
      'location': location.toMap(),
      'image': image,
      'episode': episode,
      'url': url,
      'created': created,
    };
  }

  factory PersonagemDTO.fromMap(Map<String, dynamic> map) {
    return PersonagemDTO(
      id: map['id'] as int,
      name: map['name'] as String,
      status: map['status'] as String,
      species: map['species'] as String,
      type: map['type'] as String,
      gender: map['gender'] as String,
      origin: OrigemDTO.fromMap(map['origin'] as Map<String, dynamic>),
      location: LocalizacaoDTO.fromMap(map['location'] as Map<String, dynamic>),
      image: map['image'] as String,
      episode: List<String>.from(
        (map['episode'] as List<dynamic>).map((e) => e.toString()),
      ),
      url: map['url'] as String,
      created: map['created'] as String,
    );
  }

  /// Converts this DTO into the domain [Personagem] entity.
  Personagem toEntity() {
    final selfUri = Uri.tryParse(url) ?? Uri();
    final imageUri = Uri.tryParse(image) ?? Uri();
    final episodesUris = episode.map((e) => Uri.tryParse(e) ?? Uri()).toList();
    final createdAt = _parseDate(created) ?? DateTime.now();

    // Convert nested DTOs to entities. For location DTO we already provide
    // only name/url, so its toEntity() will fill reasonable defaults.
    final Origem originEntity = origin.toEntity();
    final Localizacao locationEntity = location.toEntity();

    return Personagem(
      id: id,
      name: name,
      status: status,
      species: species,
      type: type,
      gender: gender,
      origin: originEntity,
      location: locationEntity,
      image: imageUri,
      episodes: episodesUris,
      self: selfUri,
      createdAt: createdAt,
    );
  }

  DateTime? _parseDate(String input) {
    try {
      return DateTime.parse(input);
    } catch (_) {
      return null;
    }
  }
}
