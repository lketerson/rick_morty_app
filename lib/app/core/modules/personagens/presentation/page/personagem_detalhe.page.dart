import 'package:flutter/material.dart';
import '../../domain/entities/personagem.entity.dart';
import '../../../../../shared/extensions/theme.extensions.dart';

import '../../../../../shared/utils/cor_status.util.dart';
import '../components/card_informacoes.componente.dart';
import '../components/linha_informacoes.componente.dart';

class PersonagemDetalhePage extends StatelessWidget {
  final Personagem? personagemExtra;

  const PersonagemDetalhePage({super.key, required this.personagemExtra});

  @override
  Widget build(BuildContext context) {
    if (personagemExtra == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Details')),
        body: const Center(
          child: Text('Informações do personagem não disponíveis'),
        ),
      );
    }

    final personagem = personagemExtra!;

    return Scaffold(
      appBar: AppBar(title: Text(personagem.name)),
      body: SingleChildScrollView(
        padding: context.padding16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: 'personagem-${personagem.id}',
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: obterCoresPorStatus(
                          context,
                          personagem.status,
                        ).withAlpha(77),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      personagem.image.toString(),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: context.esquemaCores.surface,
                          child: const Icon(
                            Icons.person,
                            size: 100,
                            color: Colors.white54,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            context.espaco24,
            CardInformacoesComponente(
              titulo: 'Basic Information',
              personagemStatus: personagem.status,
              filhos: [
                LinhaInformacoesComponente(
                  rotulo: 'Name',
                  valor: personagem.name,
                ),
                LinhaInformacoesComponente(
                  rotulo: 'Status',
                  valor: personagem.status,
                  color: obterCoresPorStatus(context, personagem.status),
                ),
                LinhaInformacoesComponente(
                  rotulo: 'Species',
                  valor: personagem.species,
                ),
                if (personagem.type.isNotEmpty)
                  LinhaInformacoesComponente(
                    rotulo: 'Type',
                    valor: personagem.type,
                  ),
                LinhaInformacoesComponente(
                  rotulo: 'Gender',
                  valor: personagem.gender,
                ),
              ],
            ),
            context.espaco16,
            CardInformacoesComponente(
              titulo: 'Location Information',
              personagemStatus: personagem.status,
              filhos: [
                LinhaInformacoesComponente(
                  rotulo: 'Origin',
                  valor: personagem.origin.name,
                ),
                LinhaInformacoesComponente(
                  rotulo: 'Last Known Location',
                  valor: personagem.location.name,
                ),
              ],
            ),
            context.espaco16,
            CardInformacoesComponente(
              titulo: 'Additional Information',
              personagemStatus: personagem.status,
              filhos: [
                LinhaInformacoesComponente(
                  rotulo: 'Episodes',
                  valor: '${personagem.episodes.length} episodes',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
