import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

typedef void PressOperationCallback(Operator oper);

abstract class Operator {
  String display;
  Color color;
  num calculate(num first, num second);
}

class AddOperator extends Operator {
  @override
  String get display => '+';
  @override
  Color get color => Colors.pink[300];
  @override
  calculate(first, second) {
    return first + second;
  }
}

class SubOperator extends Operator {
  @override
  String get display => '-';
  @override
  Color get color => Colors.orange[300];
  @override
  calculate(first, second) {
    return first - second;
  }
}

class MultiOperator extends Operator {
  @override
  String get display => 'x';
  @override
  Color get color => Colors.lightBlue[300];
  @override
  calculate(first, second) {
    return first * second;
  }
}

class DivisionOperator extends Operator {
  @override
  String get display => '÷';
  @override
  Color get color => Colors.purple[300];
  @override
  calculate(first, second) {
    return first / second;
  }
}

class OperatorGroup extends StatelessWidget {
  OperatorGroup(this.onOperatorButtonPressed);
  final PressOperationCallback onOperatorButtonPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        OperatorButton(
          oper: AddOperator(),
          onPress: onOperatorButtonPressed,
        ),
        OperatorButton(
          oper: SubOperator(),
          onPress: onOperatorButtonPressed,
        ),
        OperatorButton(
          oper: MultiOperator(),
          onPress: onOperatorButtonPressed,
        ),
        OperatorButton(
          oper: DivisionOperator(),
          onPress: onOperatorButtonPressed,
        ),
      ],
    );
  }
}

class OperatorButton extends StatefulWidget {
  OperatorButton({@required this.oper, this.onPress})
      : assert(Operator != null);
  final Operator oper;
  final PressOperationCallback onPress;

  @override
  State<StatefulWidget> createState() => OperatorButtonState();
}

class OperatorButtonState extends State<OperatorButton> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                if (widget.onPress != null) {
                  widget.onPress(widget.oper);
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
                decoration: BoxDecoration(
                    color: pressed
                        ? Color.alphaBlend(Colors.white30, widget.oper.color)
                        : widget.oper.color,
                    borderRadius: BorderRadius.all(Radius.circular(100.0))),
                child: Text(
                  '${widget.oper.display}',
                  style: TextStyle(fontSize: 30.0, color: Colors.white),
                ),
              ),
            )));
  }
}
