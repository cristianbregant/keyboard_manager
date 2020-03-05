# Keyboard Manager

This is a wrapper for the raw keyboard listener made to simplify intercept external keyboard button press.

## Installation

To install the package use the latest:

```dart
keyboard_manager : ^0.2.0
```

## Usage

To use this plugin simply wrap the Scaffold of your root widget with the KeyboardManager widget.

In your initState instantiate a Keyboard with what you want to do when the relative keys are pressed.



## Example app

```dart
import 'package:flutter/material.dart';
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
            title: const Text('Keyboard manager example'),
          ),
          body: Center(
            child: Text('I am listening to keyboard events'),
          ),
        ),
      ),
    );
  }
}
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)