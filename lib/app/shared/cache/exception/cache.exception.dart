import '../../base/exception/exception.base.dart';

class CacheException extends BaseException {
  const CacheException({
    required super.mensagem,
    super.stackTrace,
    super.dados,
  });
}
