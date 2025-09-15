import '../../domain/repositories/personagens.repository.dart';
import '../datasources/cache/personagens.cache.datasource.dart';
import '../datasources/http/personagens.http.datasource.dart';
import '../dto/reposta_paginada.dto.dart';

class ImplPersonagensRepository implements PersonagensRepository {
  final PersonagensCacheDatasource _cache;
  final PersonagensHttpDatasource _http;

  ImplPersonagensRepository({
    required PersonagensCacheDatasource cache,
    required PersonagensHttpDatasource http,
  }) : _cache = cache,
       _http = http;

  @override
  Future<RespostaPaginadaPersonagemDTO> obterPagina(int pagina) async {
    try {
      final resposta = await _http.obter(pagina);
      await _cache.salvar(pagina, resposta.toMap());
      return resposta;
    } catch (e) {
      final cacheResposta = await _cache.obter(pagina);
      if (cacheResposta != null) return cacheResposta;
      rethrow;
    }
  }
}
