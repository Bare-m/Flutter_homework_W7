import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Custom buttons")),
        // PART 3: several buttons, each one manages its own state
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableButton(),
            SizedBox(height: 10),
            SelectableButton(),
            SizedBox(height: 10),
            SelectableButton(),
            SizedBox(height: 10),
            SelectableButton(),
          ],
        ),
      ),
    ));

// PART 2: stateful widget
class SelectableButton extends StatefulWidget {
  const SelectableButton({super.key});

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;

  // Getters depending on the state
  String get text => isSelected ? "Selected" : "Not Selected";
  Color get textColor => isSelected ? Colors.white : Colors.black;
  Color get backgroundColor =>
      isSelected ? Colors.blue[500]! : Colors.blue[50]!;

  void _onPressed() {
    setState(() {
      isSelected = !isSelected; // reverse the selection
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
          onPressed: _onPressed,
          style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
          child: Center(
            child: Text(text, style: TextStyle(color: textColor)),
          ),
        ),
      ),
    );
  }
}