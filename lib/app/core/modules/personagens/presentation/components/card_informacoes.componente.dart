import 'package:flutter/material.dart';
import '../../../../../shared/extensions/extensions.dart';
import '../../../../../shared/utils/utils.dart';

class CardInformacoesComponente extends StatelessWidget {
  final String titulo;
  final List<Widget> filhos;
  final String personagemStatus;

  const CardInformacoesComponente({
    super.key,
    required this.titulo,
    required this.filhos,
    required this.personagemStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.padding16,
      decoration: BoxDecoration(
        color: context.esquemaCores.surface,
        borderRadius: context.raio16,
        border: Border.all(
          color: obterCoresPorStatus(context, personagemStatus).withAlpha(50),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: TextStyle(
              color: context.esquemaCores.primary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          context.espaco8,
          ...filhos,
        ],
      ),
    );
  }
}
