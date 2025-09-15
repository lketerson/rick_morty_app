import 'dart:convert';

import '../../../../../../shared/cache/cache.dart';
import '../../../../../../shared/extensions/extensions.dart';
import '../../dto/reposta_paginada.dto.dart';
import 'personagens.cache.datasource.dart';

const _chave = 'personagens';

class ImplPersonagensCacheDatasource implements PersonagensCacheDatasource {
  final Cache _cache;

  ImplPersonagensCacheDatasource({required Cache cache}) : _cache = cache;
  @override
  Future<RespostaPaginadaPersonagemDTO?> obter(int pagina) async {
    final dados = await _cache.obter('$_chave-$pagina');
    if (dados.isNotNullOrEmpty) {
      final map = jsonDecode(dados!);
      return RespostaPaginadaPersonagemDTO.fromMap(map);
    }
    return null;
  }

  @override
  Future<void> salvar(int pagina, Map<String, dynamic> dados) {
    return _cache.salvar('$_chave-$pagina', jsonEncode(dados));
  }
}
