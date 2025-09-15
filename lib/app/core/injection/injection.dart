import 'package:get_it/get_it.dart';

import '../../shared/cache/cache.dart';
import '../../shared/client/cliente.http.dart';
import '../modules/personagens/data/datasources/cache/impl_personagens.cache.datasource.dart';
import '../modules/personagens/data/datasources/cache/personagens.cache.datasource.dart';
import '../modules/personagens/data/datasources/http/impl_personagens.http.datasource.dart';
import '../modules/personagens/data/datasources/http/personagens.http.datasource.dart';
import '../modules/personagens/data/repositories/impl_personagens.repository.dart';
import '../modules/personagens/domain/repositories/personagens.repository.dart';
import '../modules/personagens/domain/usecase/obter_pagina_personagens.usecase.dart';
import '../modules/personagens/presentation/viewmodel/personagens.viewmodel.dart';

GetIt di = GetIt.I;

void registrarDependencias() {
  _registrarDependenciasGerais();
  _registrarDependenciasPersonagens();
}

void _registrarDependenciasGerais() {
  di.registerSingleton<Cache>(Cache());
  di.registerSingleton<ClienteHttp>(
    ClienteHttp(urlBase: "https://rickandmortyapi.com/api/"),
  );
}

void _registrarDependenciasPersonagens() {
  di.registerSingleton<PersonagensCacheDatasource>(
    ImplPersonagensCacheDatasource(cache: di<Cache>()),
  );
  di.registerSingleton<PersonagensHttpDatasource>(
    ImplPersonagensHttpDatasource(cliente: di<ClienteHttp>()),
  );

  di.registerSingleton<PersonagensRepository>(
    ImplPersonagensRepository(
      cache: di<PersonagensCacheDatasource>(),
      http: di<PersonagensHttpDatasource>(),
    ),
  );

  di.registerFactory<ObterPaginaPersonagensUseCase>(
    () =>
        ObterPaginaPersonagensUseCase(repository: di<PersonagensRepository>()),
  );

  di.registerSingleton<PersonagensViewModel>(
    PersonagensViewModel(
      obterPaginaUseCase: di<ObterPaginaPersonagensUseCase>(),
    ),
  );
}
