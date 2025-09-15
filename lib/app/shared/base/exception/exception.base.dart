/// Classe base para exceções personalizadas da aplicação.
///
/// Esta classe abstrata serve como base para todas as exceções lançadas na aplicação,
/// permitindo o uso de mensagens customizadas, dados adicionais, códigos de status e stack trace.
///
/// [mensagem] Mensagem descritiva do erro.
/// [dados] Dados adicionais relacionados ao erro (opcional).
/// [statusCode] Código de status associado ao erro, como HTTP status (opcional).
/// [stackTrace] Stack trace do erro para depuração (opcional).
abstract class BaseException implements Exception {
  /// Construtor da [BaseException].
  ///
  /// [mensagem] é obrigatório e descreve o erro.
  /// [dados], [statusCode] e [stackTrace] são opcionais.
  const BaseException({
    required this.mensagem,
    this.dados,
    this.statusCode,
    this.stackTrace,
  });

  /// Dados adicionais relacionados ao erro.
  final dynamic dados;

  /// Mensagem descritiva do erro.
  final String mensagem;

  /// Código de status associado ao erro, como HTTP status.
  final int? statusCode;

  /// Stack trace do erro para depuração.
  final dynamic stackTrace;
}
