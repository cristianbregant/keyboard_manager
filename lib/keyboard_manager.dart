import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

class Keyboard {
  final VoidCallback up;
  final VoidCallback down;
  final VoidCallback left;
  final VoidCallback right;
  final VoidCallback enter;
  final VoidCallback menu;

  Keyboard({this.up, this.right, this.down, this.left, this.enter, this.menu});

  /// The manager of the keyboard, this method contains every button supported
  manager(RawKeyEvent key) async {
    if (key.runtimeType.toString() == 'RawKeyDownEvent') {
      RawKeyEventDataAndroid data = key.data as RawKeyEventDataAndroid;
      print("Pressed: ${data.keyCode}");
      switch (data.keyCode) {
        case 66: //invio
        case 23: //dpad centrale?

          if (enter != null) enter();
          break;
        case 82: //menu
          if (menu != null) menu();
          break;
        case 21: //freccia sinistra
          if (left != null) left();
          break;
        case 22: //freccia destra
          if (right != null) right();
          break;
        case 19: //freccia su
          if (up != null) up();
          break;
        case 20: //freccia giù
          if (down != null) down();
          break;
        case 260: //freccia giù
          if (left != null) left();
          break;
        case 261: //freccia giù
          if (right != null) right();
          break;
        default:
          print("not managed");
      }
    }
  }
}

/// Widget that intercept every button pressed over a bluetooth or external keyboard and pass it to the manager
/// [child] Widget (usually Scaffold)
/// [keyboard] Keyboard variable that was instatiate in the initState
/// [autofocus] if the widget need to be focus on build
/// [focusNode] focus to use when in need to manage focus manually
class KeyboardManager extends StatelessWidget {
  final Widget child;
  final Keyboard keyboard;
  final bool autofocus;
  final FocusNode focusNode;

  KeyboardManager({this.child, this.keyboard, this.autofocus, this.focusNode});

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
        focusNode: focusNode,
        autofocus: autofocus,
        onKey: keyboard.manager,
        child: child);
  }
}
