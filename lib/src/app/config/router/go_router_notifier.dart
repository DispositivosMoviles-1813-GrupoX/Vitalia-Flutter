import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../features/auth/application/auth_notifier.dart';

class GoRouterNotifier extends AsyncNotifier<void> implements Listenable {
  VoidCallback? _listener;

  @override
  void addListener(VoidCallback listener) {
    _listener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    _listener = null;
  }

  @override
  FutureOr<void> build() {
    ref.listen(authNotifierProvider, (_, __) {
      _listener?.call();
    });
  }
}

final goRouterNotifierProvider =
AsyncNotifierProvider<GoRouterNotifier, void>(GoRouterNotifier.new);
