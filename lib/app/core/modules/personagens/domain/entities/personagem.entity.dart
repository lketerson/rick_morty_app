import 'localizacao.entity.dart';
import 'origem.entity.dart';

class Personagem {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Origem origin;
  final Localizacao location;
  final Uri image;
  final List<Uri> episodes;
  final Uri self;
  final DateTime createdAt;

  const Personagem({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episodes,
    required this.self,
    required this.createdAt,
  });
}
