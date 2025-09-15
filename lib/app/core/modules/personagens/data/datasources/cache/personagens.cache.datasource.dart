import '../../dto/reposta_paginada.dto.dart';

abstract interface class PersonagensCacheDatasource {
  Future<RespostaPaginadaPersonagemDTO?> obter(int pagina);
  Future<void> salvar(int pagina, Map<String, dynamic> dados);
}
