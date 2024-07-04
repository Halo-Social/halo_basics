extension IterableExt<E> on Iterable<E> {
  E? firstWhereOr(bool Function(E element) test, {E Function()? orElse}) {
    for (E element in this) {
      if (test(element)) return element;
    }
    if (orElse != null) return orElse();

    return null;
  }
}
