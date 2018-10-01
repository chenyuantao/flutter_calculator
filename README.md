# flutter_calculator

## Preview

![preview](https://user-gold-cdn.xitu.io/2018/9/30/1662ad71fa520bae?imageslim)

## Structure

![structure](https://user-gold-cdn.xitu.io/2018/9/30/1662ac4720f10da4?imageView2/0/w/1280/h/960/format/webp/ignore-error/1)

### Input Widgets

input widgets is all extends **StatefulWidget**, because they need to response the onTap gesture.

* **NumberButton**. Rendering the number button (like 1,2,3...) and handling the onTap gesture.

* **OperatorButton**. Rendering the operator button (like +,-,*...)  and handling the onTap gesture.

* **ResultButton**. Rendering the command button (like clear,equal...)  and handling the onTap gesture.


### Output Widgets

output widgets is all extends **StatelessWidget**, because they are just rendering.

* **ResultDisplay**. Rendering the current result and changing display when user tap a number button.

* **HistoryBlock**. Rendering the calculation histories and changing display every time when user tap a valid button.

### CalculatorPage

CalculatorPage is extends StatefulWidget and holding the List of result. 

CalculatorPage receives every input widgets onTap event, makes a logical calculation for these input and decide what to display to output widgets.

## Thanks

This repo is inspired by [react-calculator](https://github.com/benoitvallon/react-native-nw-react-calculator). 

Thanks to the author's awesome idea and app ui.

## Contact

cyt528300@gmail.com
