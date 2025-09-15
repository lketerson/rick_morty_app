import '../../../../../../shared/client/cliente.http.dart';
import '../../dto/reposta_paginada.dto.dart';
import 'personagens.http.datasource.dart';

class ImplPersonagensHttpDatasource implements PersonagensHttpDatasource {
  final ClienteHttp _cliente;

  ImplPersonagensHttpDatasource({required ClienteHttp cliente})
    : _cliente = cliente;

  @override
  Future<RespostaPaginadaPersonagemDTO> obter(int pagina) async {
    final resposta = await _cliente.obter(
      'character/',
      parametrosQuery: {'page': pagina},
    );
    return RespostaPaginadaPersonagemDTO.fromMap(resposta.data);
  }
}
