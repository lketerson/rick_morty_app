import 'package:go_router/go_router.dart';

import '../../core/injection/injection.dart';
import '../../core/modules/personagens/domain/entities/personagem.entity.dart';
import '../../core/modules/personagens/presentation/page/personagem_detalhe.page.dart';
import '../../core/modules/personagens/presentation/page/personagens.page.dart';
import '../../core/modules/personagens/presentation/viewmodel/personagens.viewmodel.dart';

final roteador = GoRouter(
  routes: [
    GoRoute(
      path: '/characters',
      builder: (context, state) =>
          PersonagensPage(viewmodel: di.get<PersonagensViewModel>()),
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) {
        final extra = state.extra as Personagem?;
        return PersonagemDetalhePage(personagemExtra: extra);
      },
    ),
  ],
  initialLocation: '/characters',
);
