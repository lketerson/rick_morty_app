List<T> removerDuplicidadePorId<T, K>(
  List<T> original,
  List<T> incoming,
  K Function(T) key,
) {
  final map = <K, T>{};

  for (final item in original) {
    map[key(item)] = item;
  }

  for (final item in incoming) {
    map[key(item)] = item;
  }

  return map.values.toList();
}
