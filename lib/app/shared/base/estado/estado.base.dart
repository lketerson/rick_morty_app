abstract class EstadoBase {}

class EstadoInicial implements EstadoBase {}

class EstadoCarregando implements EstadoBase {}

class EstadoSucesso<R> implements EstadoBase {
  const EstadoSucesso({required this.dados});

  final R dados;
}

class EstadoErro<T extends Exception> implements EstadoBase {
  const EstadoErro({required this.erro, required this.mensagem});
  final String mensagem;
  final T erro;
}
