import 'package:design_system_components/textfield/textfield.widget.dart';
import 'package:flutter/material.dart';

class DSOneDigitTextFields extends StatefulWidget {
  const DSOneDigitTextFields({
    super.key,
    required this.onTextChanged,
  });

  final Function(String) onTextChanged;

  @override
  State createState() => _DSOneDigitTextFieldsState();
}

class _DSOneDigitTextFieldsState extends State<DSOneDigitTextFields> {
  final int fieldCount = 4; // Number of TextFields
  final List<TextEditingController> controllers = [];
  final List<FocusNode> focusNodes = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < fieldCount; i++) {
      controllers.add(TextEditingController());
      focusNodes.add(FocusNode());
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void onChangedHandler(String value, int index) {
    if (value.length == 1 && index < fieldCount - 1) {
      // Request focus for the next field
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      // Request focus for the previous field if value is empty
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }

    // Notify the concatenated value to the callback
    final allText = controllers.map((controller) => controller.text).join();
    widget.onTextChanged(allText);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(fieldCount, (index) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Small padding between fields
            child: DSTextFieldWidget(
              controller: controllers[index],
              focusNode: focusNodes[index], // Ensure the focus node is passed
              maxLength: 1,
              keyboardType: TextInputType.number,
              autofocus: index == 0, // Automatically focus the first field
              onTextChanged: (value) => onChangedHandler(value, index),
              textInputAction: index < fieldCount - 1
                  ? TextInputAction.next
                  : TextInputAction.done, // Set 'done' for the last field
              onSubmitted: index < fieldCount - 1
                  ? (_) => FocusScope.of(context).requestFocus(focusNodes[index + 1])
                  : null,
              textAlign: TextAlign.center,
            ),
          ),
        );
      }),
    );
  }
}

