import '../../domain/entities/localizacao.entity.dart';

class LocalizacaoDTO {
  final String name;
  final String url;

  const LocalizacaoDTO({required this.name, required this.url});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'url': url};
  }

  factory LocalizacaoDTO.fromMap(Map<String, dynamic> map) {
    return LocalizacaoDTO(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  Localizacao toEntity() {
    return Localizacao(name: name);
  }
}
