import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormField extends StatefulWidget {
  const DateFormField({
    super.key,
    required this.firstDate,
    required this.lastDate,
    required this.initialDate,
    this.labelText,
    this.hintText,
    required this.onSaved,
  });

  final String? labelText;
  final String? hintText;
  final void Function(DateTime) onSaved;
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime? initialDate;

  @override
  State<DateFormField> createState() => _DateFormFieldState();
}

class _DateFormFieldState extends State<DateFormField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(
      text: widget.initialDate == null
          ? null
          : DateFormat("d MMM, yyyy").format(widget.initialDate!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTapAlwaysCalled: true,
      onTap: () async {
        ;
        final date = await showDatePicker(
          context: context,
          firstDate: widget.firstDate,
          initialDate: DateFormat("d MMM, yyyy").tryParse(controller.text),
          lastDate: widget.lastDate,
        );
        if (date != null) {
          controller.text = DateFormat("d MMM, yyyy").format(date);
        }
      },
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
      ),
      onSaved: (newValue) {
        if (newValue == null) return;
        final date = DateFormat("d MMM, yyyy").tryParse(controller.text);
        if (date != null) {
          widget.onSaved(date);
        }
      },
    );
  }
}
