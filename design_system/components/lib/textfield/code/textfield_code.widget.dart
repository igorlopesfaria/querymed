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
    // Concatenate values from all text fields
    final allText = controllers.map((controller) => controller.text).join();
    widget.onTextChanged(allText);

    // Move to the next field if digit entered and it's not the last field
    if (value.length == 1 && index < fieldCount - 1) {
      // Use `WidgetsBinding` to delay focus change until after the UI builds
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      });
    }
    // Move to the previous field if backspace is pressed
    else if (value.isEmpty && index > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FocusScope.of(context).requestFocus(focusNodes[index - 1]);
      });
    }
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
              focusNode: focusNodes[index], // Ensure focusNode is passed correctly
              maxLength: 1,
              keyboardType: TextInputType.number,
              autofocus: index == 0, // Automatically focus the first field
              onTextChanged: (value) => onChangedHandler(value, index),
              textInputAction: index < fieldCount - 1
                  ? TextInputAction.next
                  : TextInputAction.done, // Set 'done' for the last field
              onSubmitted: index < fieldCount - 1
                  ? (_) {
                // Move focus to the next field on submit
                FocusScope.of(context).requestFocus(focusNodes[index + 1]);
              }
                  : null,
              textAlign: TextAlign.center,
            ),
          ),
        );
      }),
    );
  }
}
