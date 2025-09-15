import 'exception.base.dart';

class ExcecaoGenerica extends BaseException {
  const ExcecaoGenerica({
    required super.mensagem,
    super.dados,
    super.statusCode,
    super.stackTrace,
  });
}
