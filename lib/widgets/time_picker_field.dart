import 'package:flutter/material.dart';

import '../utils/validator.dart';

class TimePickerField extends StatefulWidget {
  final ValueChanged<TimeOfDay> onChanged;
  final String fieldName;
  final String hint;
  const TimePickerField({super.key, required this.onChanged, required this.fieldName, required this.hint});

  @override
  State<TimePickerField> createState() => _TimePickerFieldState();
}

class _TimePickerFieldState extends State<TimePickerField> {
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
            prefixIcon: const Icon(Icons.access_time_outlined),
            hintText: widget.hint
          ),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now()
    ).then((picked){
      if (picked != null) {
        String hour = picked.hourOfPeriod.toString().padLeft(2, '0');
        String minute = picked.minute.toString().padLeft(2, '0');
        String period = picked.period == DayPeriod.am ? 'AM' : 'PM';
        String time = '$hour : $minute $period';
        controller.text = time; 
        widget.onChanged(picked);
      }
    });
  }
}
