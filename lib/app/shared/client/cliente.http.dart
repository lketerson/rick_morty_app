import 'package:dio/dio.dart';

import 'cliente.interceptor.dart';

/// Classe que fornece um cliente HTTP simplificado utilizando o pacote Dio.
///
/// Esta classe encapsula métodos HTTP comuns (GET, POST, PUT, DELETE)
/// e lida com exceções específicas do Dio, retornando um tipo `Result` para
/// representar sucesso ou falha.
class ClienteHttp {
  final String urlBase;
  final Dio _dio;

  /// Constrói uma instância de [ClienteHttp] com uma URL base.
  ///
  /// Se [dio] for fornecido, ele será usado (útil para testes). Caso contrário
  /// um [Dio] será criado com configurações padrão e o interceptor será
  /// adicionado automaticamente.
  ClienteHttp({required this.urlBase, Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: urlBase,
              headers: {'Content-Type': 'application/json'},
            ),
          ) {
    // Somente adiciona o interceptor quando o Dio foi criado internamente.
    if (dio == null) {
      _dio.interceptors.add(ClienteInterceptor());
    }
  }

  BaseOptions get options => _dio.options;
  Map<String, dynamic> get headers => _dio.options.headers;

  /// Realiza uma requisição HTTP GET para o [caminho] especificado.
  ///
  /// [caminho] é o endpoint para o qual a requisição é feita, relativo à URL base.
  /// [parametrosQuery] é um mapa opcional de parâmetros de consulta a serem incluídos na requisição.
  /// [cabecalhos] é um mapa opcional de cabeçalhos a serem incluídos na requisição.
  ///
  /// Retorna um [Future] contendo um [Response] em caso de sucesso ou um [DioException] em caso de falha.
  Future<Response> obter(
    String caminho, {
    Map<String, dynamic>? parametrosQuery,
    Map<String, dynamic>? cabecalhos,
  }) async {
    try {
      final result = await _dio.get(
        caminho,
        queryParameters: parametrosQuery,
        options: Options(headers: cabecalhos),
      );
      return result;
    } on DioException {
      rethrow;
    }
  }

  /// Realiza uma requisição HTTP POST para o [caminho] especificado.
  ///
  /// [caminho] é o endpoint para o qual a requisição é feita, relativo à URL base.
  /// [dados] é o corpo da requisição, tipicamente um mapa que será serializado para JSON.
  /// [cabecalhos] é um mapa opcional de cabeçalhos a serem incluídos na requisição.
  ///
  /// Retorna um [Future] contendo um [Response] em caso de sucesso ou um [DioException] em caso de falha.
  Future<Response> cadastrar(
    String caminho, {
    Map<String, dynamic>? dados,
    Map<String, dynamic>? cabecalhos,
  }) async {
    try {
      return await _dio.post(
        caminho,
        data: dados,
        options: Options(headers: cabecalhos),
      );
    } on DioException {
      rethrow;
    }
  }

  /// Realiza uma requisição HTTP PUT para o [caminho] especificado.
  ///
  /// [caminho] é o endpoint para o qual a requisição é feita, relativo à URL base.
  /// [dados] é o corpo da requisição, tipicamente um mapa que será serializado para JSON.
  /// [cabecalhos] é um mapa opcional de cabeçalhos a serem incluídos na requisição.
  ///
  /// Retorna um [Future] contendo um [Response] em caso de sucesso ou um [DioException] em caso de falha.
  Future<Response> atualizar(
    String caminho, {
    Map<String, dynamic>? dados,
    Map<String, dynamic>? cabecalhos,
  }) async {
    try {
      return await _dio.put(
        caminho,
        data: dados,
        options: Options(headers: cabecalhos),
      );
    } on DioException {
      rethrow;
    }
  }

  /// Realiza uma requisição HTTP DELETE para o [caminho] especificado.
  ///
  /// [caminho] é o endpoint para o qual a requisição é feita, relativo à URL base.
  /// [cabecalhos] é um mapa opcional de cabeçalhos a serem incluídos na requisição.
  ///
  /// Retorna um [Future] contendo um [Response] em caso de sucesso ou um [DioException] em caso de falha.
  Future<Response> delete(
    String caminho, {
    Map<String, dynamic>? cabecalhos,
  }) async {
    try {
      return await _dio.delete(caminho, options: Options(headers: cabecalhos));
    } on DioException {
      rethrow;
    }
  }
}
