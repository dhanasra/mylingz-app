import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils/validator.dart';

class DatePickerField extends StatefulWidget {
  final ValueChanged<DateTime> onChanged;
  final String fieldName;
  final String hint;
  const DatePickerField({super.key, required this.onChanged, required this.fieldName, required this.hint});

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _selectDate(context);
      },
      child: AbsorbPointer(
        child: TextFormField(
          controller: controller,
          validator: (v)=>Validator.validateNonNullOrEmpty(v, widget.fieldName),
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.calendar_today_outlined),
            hintText: widget.hint
          ),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
    );
    if (picked != null) {
      String date = DateFormat('MMM dd, yyyy').format(picked);
      controller.text = date.toString(); 
      widget.onChanged(picked);
    }
  }
}
