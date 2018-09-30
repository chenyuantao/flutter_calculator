import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

typedef void PressOperationCallback(Number number);

abstract class Number {
  String display;
  String apply(String original);
}

class NormalNumber extends Number {
  NormalNumber(String display) {
    this.display = display;
  }
  apply(original) {
    if (original == '0') {
      return display;
    } else {
      return original + display;
    }
  }
}

class SymbolNumber extends Number {
  @override
  String get display => '+/-';
  @override
  String apply(String original) {
    int index = original.indexOf('-');
    if (index == -1 && original != '0') {
      return '-' + original;
    } else {
      return original.replaceFirst(new RegExp(r'-'), '');
    }
  }
}

class DecimalNumber extends Number {
  @override
  String get display => ('.');
  @override
  String apply(String original) {
    int index = original.indexOf('.');
    if (index == -1) {
      return original + '.';
    } else if (index == original.length) {
      return original.replaceFirst(new RegExp(r'.'), '');
    } else {
      return original;
    }
  }
}

class NumberButtonLine extends StatelessWidget {
  NumberButtonLine({@required this.array, this.onPress})
      : assert(array != null);
  final List<Number> array;
  final PressOperationCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: <Widget>[
        NumberButton(
            number: array[0],
            pad: EdgeInsets.only(bottom: 4.0),
            onPress: onPress),
        NumberButton(
            number: array[1],
            pad: EdgeInsets.only(left: 4.0, right: 4.0, bottom: 4.0),
            onPress: onPress),
        NumberButton(
            number: array[2],
            pad: EdgeInsets.only(bottom: 4.0),
            onPress: onPress)
      ]),
    );
  }
}

class NumberButton extends StatefulWidget {
  const NumberButton({@required this.number, @required this.pad, this.onPress})
      : assert(number != null),
        assert(pad != null);
  final Number number;
  final EdgeInsetsGeometry pad;
  final PressOperationCallback onPress;
  @override
  State<StatefulWidget> createState() => new NumberButtonState();
}

class NumberButtonState extends State<NumberButton> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Padding(
          padding: widget.pad,
          child: GestureDetector(
            onTap: () {
              if (widget.onPress != null) {
                widget.onPress(widget.number);
                setState(() {
                  pressed = true;
                });
                Future.delayed(
                    const Duration(milliseconds: 200),
                    () => setState(() {
                          pressed = false;
                        }));
              }
            },
            child: Container(
              alignment: Alignment.center,
              color: pressed ? Colors.grey[200] : Colors.white,
              child: Text(
                '${widget.number.display}',
                style: TextStyle(fontSize: 30.0, color: Colors.grey),
              ),
            ),
          ),
        ));
  }
}
