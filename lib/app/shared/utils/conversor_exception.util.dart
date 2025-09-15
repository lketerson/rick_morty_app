import 'package:dio/dio.dart';

import '../base/exception/exception.base.dart';
import '../base/exception/exception.generica.dart';
import '../cache/exception/cache.exception.dart';

BaseException converterParaBaseException(Exception erro, [StackTrace? st]) {
  if (erro is CacheException) return erro;
  if (erro is BaseException) return erro;

  if (erro is DioException) {
    final mensagem = erro.error?.toString() ?? erro.message;
    return ExcecaoGenerica(
      mensagem: mensagem ?? 'Erro de rede',
      dados: erro,
      stackTrace: st,
    );
  }

  return ExcecaoGenerica(
    mensagem: erro.toString(),
    stackTrace: st,
    dados: erro,
  );
}
