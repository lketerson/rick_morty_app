import 'dart:convert';

import '../../../../../shared/dto/informacoes_request.dto.dart';
import 'personagem.dto.dart';

class RespostaPaginadaPersonagemDTO {
  final InformacoesRequestDTO informacoes;
  final List<PersonagemDTO> resultado;

  const RespostaPaginadaPersonagemDTO({
    required this.informacoes,
    required this.resultado,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'info': informacoes.toMap(),
      'results': resultado.map((x) => x.toMap()).toList(),
    };
  }

  factory RespostaPaginadaPersonagemDTO.fromMap(Map<String, dynamic> map) {
    return RespostaPaginadaPersonagemDTO(
      informacoes: InformacoesRequestDTO.fromMap(
        map['info'] as Map<String, dynamic>,
      ),
      resultado: List<PersonagemDTO>.from(
        (map['results'] as List<dynamic>).map<PersonagemDTO>(
          (x) => PersonagemDTO.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory RespostaPaginadaPersonagemDTO.fromJson(String source) =>
      RespostaPaginadaPersonagemDTO.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
