import 'package:flutter/material.dart';
import 'dart:async';

import 'package:keyboard_manager/keyboard_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Keyboard _keyboard;

  @override
  void initState() {
    
    _keyboard = new Keyboard(
      left: (){
        print("left key pressed");
      },
      right: (){
        print("right key pressed");
      }
    );
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KeyboardManager(
        keyboard: _keyboard,
        autofocus: true,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Center(
            child: Text('I am listening to button events'),
          ),
        ),
      ),
    );
  }
}
