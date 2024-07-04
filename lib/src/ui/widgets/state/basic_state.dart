import 'package:flutter/cupertino.dart';

abstract class BasicState<T extends StatefulWidget> extends State<T> {
  void setSafeState(VoidCallback fn) {
    if (mounted) setState(fn);
  }
}
