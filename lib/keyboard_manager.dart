import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

class Keyboard {
  final VoidCallback up;
  final VoidCallback down;
  final VoidCallback left;
  final VoidCallback right;
  final VoidCallback enter;
  final VoidCallback menu;
  final VoidCallback guide;
  final VoidCallback info;
  final VoidCallback mediaPlay;
  final VoidCallback mediaPause;
  final VoidCallback mediaPlayPause;

  Keyboard({this.up, this.right, this.down, this.left, this.enter, this.menu,this.guide,this.info,this.mediaPlay,this.mediaPause,this.mediaPlayPause});

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
        case 260: //freccia left
          if (left != null) left();
          break;
        case 261: //freccia right
          if (right != null) right();
          break;
        case 172: //guide
          if (guide != null) guide();
          break;
        case 165: //info
          if (info != null) info();
          break;
        case 127: //pause
          if (mediaPause != null) mediaPause();
          break;
        case 126: //play
          if (mediaPlay != null) mediaPlay();
          break;
        case 85: //play pause
          if (mediaPlayPause != null) mediaPlayPause();
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
