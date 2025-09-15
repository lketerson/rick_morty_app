import '../../dto/reposta_paginada.dto.dart';

abstract interface class PersonagensHttpDatasource {
  Future<RespostaPaginadaPersonagemDTO> obter(int pagina);
}
