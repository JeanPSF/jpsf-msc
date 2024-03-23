import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ActionOnCoordinates extends StatefulWidget {
  const ActionOnCoordinates({
    required this.label,
    required this.onPress,
    super.key,
  });

  final String label;
  final void Function((int, int) coords) onPress;

  @override
  State<ActionOnCoordinates> createState() => _ActionOnCoordinatesState();
}

class _ActionOnCoordinatesState extends State<ActionOnCoordinates> {
  final x = TextEditingController();
  final y = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isValid = x.text.isNotEmpty && y.text.isNotEmpty;
    return Column(
      children: [
        ElevatedButton(
          onPressed: isValid
              ? () {
                  final auxX = int.tryParse(x.text);
                  final auxY = int.tryParse(y.text);
                  if (auxX != null && auxY != null) {
                    widget.onPress((auxX, auxY));
                  }
                }
              : null,
          child: Text(widget.label),
        ),
        TextField(
          controller: x,
          decoration: const InputDecoration(labelText: "x"),
          keyboardType: TextInputType.number,
          maxLength: 2,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (value) {
            setState(() {});
          },
        ),
        TextField(
          controller: y,
          decoration: const InputDecoration(labelText: "y"),
          keyboardType: TextInputType.number,
          maxLength: 2,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (value) {
            setState(() {});
          },
        ),
      ],
    );
  }
}
