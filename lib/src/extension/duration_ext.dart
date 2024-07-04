import 'package:flutter/material.dart';

extension DurationExt on Duration {
  Future delay(VoidCallback callback) {
    return Future.delayed(this).then((value) => callback.call());
  }

  Future delayPure() {
    return Future.delayed(this);
  }
}
