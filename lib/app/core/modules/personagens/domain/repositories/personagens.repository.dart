import '../../data/dto/reposta_paginada.dto.dart';

abstract interface class PersonagensRepository {
  Future<RespostaPaginadaPersonagemDTO> obterPagina(int pagina);
}
