import '../../domain/entities/origem.entity.dart';

class OrigemDTO {
  final String name;
  final String url;

  const OrigemDTO({required this.name, required this.url});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'url': url};
  }

  factory OrigemDTO.fromMap(Map<String, dynamic> map) {
    return OrigemDTO(name: map['name'] as String, url: map['url'] as String);
  }

  Origem toEntity() {
    return Origem(name: name);
  }
}
