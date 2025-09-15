import 'package:flutter/foundation.dart';

import '../../../../../shared/base/controlador/controlador.base.dart';
import '../../../../../shared/base/estado/estado.base.dart';
import '../../../../../shared/utils/utils.dart';
import '../../domain/entities/personagem.entity.dart';
import '../../domain/usecase/usecases.dart';

class PersonagensViewModel extends ControladorBase<EstadoBase> {
  final ObterPaginaPersonagensUseCase obterPaginaUseCase;

  final ValueNotifier<List<Personagem>> personagens =
      ValueNotifier<List<Personagem>>(<Personagem>[]);
  final ValueNotifier<bool> hasNextPage = ValueNotifier<bool>(true);
  int _pagina = 0;

  PersonagensViewModel({required this.obterPaginaUseCase})
    : super(EstadoInicial());

  Future<void> carregarTodosPersonagens() async {
    atualizar(EstadoCarregando());
    try {
      final resposta = await obterPaginaUseCase.call(_pagina + 1);
      final novos = resposta.resultado.map((dto) => dto.toEntity()).toList();

      final merged = removerDuplicidadePorId<Personagem, int>(
        personagens.value,
        novos,
        (p) => p.id,
      );
      personagens.value = merged;

      _pagina = _pagina + 1;
      hasNextPage.value = resposta.informacoes.next != null;

      atualizar(
        EstadoSucesso<List<Personagem>>(
          dados: List.unmodifiable(personagens.value),
        ),
      );
    } on Exception catch (e, st) {
      final baseEx = converterParaBaseException(e, st);
      atualizar(EstadoErro(mensagem: baseEx.mensagem, erro: baseEx));
    }
  }

  Future<void> recarregarPagina() async {
    _pagina = 0;
    personagens.value.clear();
    hasNextPage.value = true;
    await carregarTodosPersonagens();
  }

  @override
  void dispose() {
    personagens.dispose();
    hasNextPage.dispose();
    super.dispose();
  }
}
