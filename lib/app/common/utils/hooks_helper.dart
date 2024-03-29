import 'package:flutter_hooks/flutter_hooks.dart';

class HooksHelper {
  void useAsyncEffect(
    Future<Dispose?> Function() effect, [
    List<Object?>? keys,
  ]) {
    useEffect(
      () {
        final disposeFuture = Future.microtask(effect);
        return () => disposeFuture.then((dispose) => dispose?.call());
      },
      keys,
    );
  }
}
