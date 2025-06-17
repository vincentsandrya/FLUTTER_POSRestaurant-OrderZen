import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.onChanged,
  });

  final String label;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          label: Text(label, style: TextStyle(color: Color(0xffC0C0C0))),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffC0C0C0)),
          ),
        ),
      ),
    );
  }
}
