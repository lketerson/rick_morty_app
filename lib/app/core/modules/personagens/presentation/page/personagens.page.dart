import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../viewmodel/personagens.viewmodel.dart';
import '../../../../../shared/componente/snackbar.componente.dart';

import '../../../../../shared/base/estado/estado.base.dart';
import '../../domain/entities/personagem.entity.dart';
import '../components/card-personagem.componente.dart';

class PersonagensPage extends StatefulWidget {
  final PersonagensViewModel _viewmodel;

  const PersonagensPage({super.key, required PersonagensViewModel viewmodel})
    : _viewmodel = viewmodel;

  @override
  State<PersonagensPage> createState() => _PersonagensPageState();
}

class _PersonagensPageState extends State<PersonagensPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingNextPage = false;
  _listener() {
    if (!mounted) return;
    final state = widget._viewmodel.value;
    if (state is EstadoErro) {
      mostrarSnackBarErro(context, state.mensagem);
    }
  }

  void _onScroll() {
    if (!_scrollController.hasClients ||
        _isLoadingNextPage ||
        !widget._viewmodel.hasNextPage.value) {
      return;
    }
    final max = _scrollController.position.maxScrollExtent;
    final pos = _scrollController.position.pixels;
    if (pos >= max * 0.8) {
      _isLoadingNextPage = true;
      widget._viewmodel.carregarTodosPersonagens().whenComplete(() {
        if (mounted) {
          setState(() {
            _isLoadingNextPage = false;
          });
        } else {
          _isLoadingNextPage = false;
        }
      });
    }
  }

  @override
  void initState() {
    widget._viewmodel.addListener(_listener);
    _scrollController.addListener(_onScroll);
    widget._viewmodel.carregarTodosPersonagens();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
        actions: [
          IconButton(
            onPressed: () {
              widget._viewmodel.recarregarPagina();
              _scrollController.jumpTo(0);
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: ValueListenableBuilder<List<Personagem>>(
        valueListenable: widget._viewmodel.personagens,
        builder: (context, items, _) {
          return ListView.builder(
            controller: _scrollController,
            itemCount: widget._viewmodel.personagens.value.length,
            cacheExtent: 1000,
            itemBuilder: (context, index) {
              if (items.isNotEmpty) {
                final personagem = items[index];

                return CardPersonagemComponente(
                  personagem: personagem,
                  onTap: () {
                    context.push('/details', extra: personagem);
                  },
                );
              }
              return const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
