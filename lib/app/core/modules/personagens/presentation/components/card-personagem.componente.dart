import 'package:flutter/material.dart';

import '../../../../../shared/extensions/extensions.dart';
import '../../../../../shared/utils/utils.dart';
import '../../domain/entities/personagem.entity.dart';

typedef VoidCallback = void Function();

class CardPersonagemComponente extends StatelessWidget {
  final Personagem personagem;
  final VoidCallback onTap;

  const CardPersonagemComponente({
    super.key,
    required this.personagem,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: context.esquemaCores.surface,
        borderRadius: context.raio16,
        border: Border.all(
          color: obterCoresPorStatus(context, personagem.status).withAlpha(77),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: obterCoresPorStatus(
              context,
              personagem.status,
            ).withAlpha(25),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: context.raio16,
        child: Padding(
          padding: context.padding16,
          child: Row(
            children: [
              Hero(
                tag: 'personagem-${personagem.id}',
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: context.raio12,
                    boxShadow: [
                      BoxShadow(
                        color: obterCoresPorStatus(
                          context,
                          personagem.status,
                        ).withAlpha(77),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: context.raio12,
                    child: Image.network(
                      personagem.image.toString(),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: context.esquemaCores.surface,
                          child: const Icon(Icons.person, size: 40),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      personagem.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    context.espaco8,
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: obterCoresPorStatus(
                              context,
                              personagem.status,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          personagem.status,
                          style: TextStyle(
                            color: obterCoresPorStatus(
                              context,
                              personagem.status,
                            ),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          personagem.species,
                          style: TextStyle(
                            color: context.temaTexto.bodyLarge!.color
                                ?.withAlpha(179),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    context.espaco4,
                    Text(
                      'Last seen: ${personagem.location.name}',
                      style: TextStyle(
                        color: Colors.white.withAlpha(128),
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white.withAlpha(77),
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
