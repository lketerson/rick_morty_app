import 'package:dio/dio.dart';

class ClienteInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String mensagem = '';
    switch (err.type) {
      case DioExceptionType.connectionError:
        mensagem = 'Falha ao conectar ao servidor';
        break;
      case DioExceptionType.connectionTimeout:
        mensagem = 'Tempo de conexão excedido';
        break;
      case DioExceptionType.receiveTimeout:
        mensagem = 'Tempo de resposta excedido';
        break;
      case DioExceptionType.sendTimeout:
        mensagem = 'Tempo de envio excedido';
        break;
      case DioExceptionType.unknown:
        mensagem = 'Erro desconhecido';
        break;
      case DioExceptionType.badResponse:
        if (err.message!.contains('400')) {
          mensagem = 'Erro 400: Requisição inválida';
        }
        if (err.message!.contains('401')) {
          mensagem = 'Erro 401: Não autorizado';
        }
        if (err.message!.contains('403')) {
          mensagem = 'Erro 403: Proibido';
        }
        if (err.message!.contains('404')) {
          mensagem = 'Erro 404: Não encontrado';
        }
        if (err.message!.contains('405')) {
          mensagem = 'Erro 405: Método não permitido';
        }
        if (err.message!.contains('500')) {
          mensagem = 'Erro 500: Erro interno do servidor';
        }
        break;
      default:
        mensagem = 'Erro inesperado';
        break;
    }

    handler.next(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: mensagem,
      ),
    );
  }
}
