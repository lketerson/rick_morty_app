import '../../data/dto/reposta_paginada.dto.dart';
import '../repositories/personagens.repository.dart';

class ObterPaginaPersonagensUseCase {
  final PersonagensRepository repository;

  ObterPaginaPersonagensUseCase({required this.repository});
  Future<RespostaPaginadaPersonagemDTO> call(int pagina) async {
    final resposta = await repository.obterPagina(pagina);
    return resposta;
  }
}
