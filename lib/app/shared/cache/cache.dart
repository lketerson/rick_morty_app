import 'package:shared_preferences/shared_preferences.dart';

import '../extensions/extensions.dart';
import 'exception/cache.exception.dart';

/// Classe responsável por encapsular a lógica de acesso ao armazenamento local
/// utilizando o pacote `shared_preferences`.
///
/// Permite salvar, obter e deletar dados do armazenamento local de forma assíncrona.
/// Em caso de falha, lança uma [CacheException] contendo a mensagem de erro e o stacktrace.
class Cache {
  /// Salva um valor no armazenamento local associado a uma chave.
  ///
  /// Recebe uma [chave] (chave) do tipo `String` e um [valor] (valor) do tipo `String` para serem armazenados.
  /// Retorna o próprio [valor] em caso de sucesso.
  /// Em caso de falha, lança uma [CacheException].
  ///
  /// Exemplo:
  /// ```dart
  /// final valor = await Cache().salvar('minha_chave', 'meu_valor');
  /// print('Valor salvo: $valor');
  /// ```
  Future<String> salvar(String chave, String valor) async {
    try {
      final cache = await SharedPreferences.getInstance();
      await cache.setString(chave, valor);
      return valor;
    } catch (e, s) {
      throw CacheException(mensagem: e.toString(), stackTrace: s);
    }
  }

  /// Obtém um valor do armazenamento local associado a uma chave.
  ///
  /// Recebe uma [chave] (chave) do tipo `String` para buscar o valor correspondente.
  /// Retorna o valor armazenado caso seja encontrado.
  /// Se a chave não existir, lança uma [CacheException] com a mensagem "Chave não encontrada".
  /// Em caso de erro ao acessar o SharedPreferences, também lança uma [CacheException].
  ///
  /// Exemplo:
  /// ```dart
  /// try {
  ///   final valor = await Cache().obter('minha_chave');
  ///   print('Valor obtido: $valor');
  /// } catch (e) {
  ///   print('Erro: $e');
  /// }
  /// ```
  Future<String?> obter(String chave) async {
    try {
      final cache = await SharedPreferences.getInstance();
      final value = cache.getString(chave);
      if (value.isNullOrEmpty) {
        return null;
      }
      return value;
    } catch (e, s) {
      throw CacheException(mensagem: e.toString(), stackTrace: s);
    }
  }

  /// Deleta um valor do armazenamento local associado a uma chave.
  ///
  /// Recebe uma [chave] (chave) do tipo `String` para remover o valor correspondente.
  /// Retorna `true` em caso de sucesso.
  /// Em caso de falha, lança uma [CacheException].
  ///
  /// Exemplo:
  /// ```dart
  /// final sucesso = await Cache().deletar('minha_chave');
  /// print(sucesso ? 'Valor deletado' : 'Não foi possível deletar');
  /// ```
  Future<bool> deletar(String chave) async {
    try {
      final cache = await SharedPreferences.getInstance();
      await cache.remove(chave);
      return true;
    } catch (e, s) {
      throw CacheException(mensagem: e.toString(), stackTrace: s);
    }
  }
}
