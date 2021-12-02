import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  String? text;

  CheckBox({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.text!),
      controlAffinity: ListTileControlAffinity.platform,
      value: _checked,
      onChanged: (bool? value) {
        setState(() {
          _checked = value!;
        });
      },
    );
  }
}
