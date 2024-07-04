///泛型扩展：
extension AllExt<T> on T {
  T apply(Function(T self) f) {
    f(this);
    return this;
  }

  R let<R>(R Function(T self) f) {
    return f(this);
  }
}
