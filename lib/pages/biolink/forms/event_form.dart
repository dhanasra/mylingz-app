import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mylingz_app/extensions/context_exten.dart';

import 'package:mylingz_app/extensions/number_exten.dart';
import 'package:mylingz_app/extensions/string_exten.dart';

import '../../../constants/string_const.dart';
import '../../../network/models/social_icon.dart';
import '../../../network/models/social_link.dart';
import '../../../utils/utils.dart';
import '../../../utils/validator.dart';
import '../../../widgets/date_picker_field.dart';
import '../../../widgets/styled_button.dart';
import '../../../widgets/time_picker_field.dart';

class EventForm extends StatelessWidget {
  final SocialIcon icon;
  const EventForm({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descController = TextEditingController();
    final TextEditingController locController = TextEditingController();
    DateTime? startDate;
    TimeOfDay? startTime;
    DateTime? endDate;
    TimeOfDay? endTime;

    final GlobalKey<FormState> formKey = GlobalKey();
    final ValueNotifier<AutovalidateMode> mode = ValueNotifier(AutovalidateMode.disabled);

    return ValueListenableBuilder(
      valueListenable: mode,
      builder: (_, value, __) {
        return Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Event Name".ts(context),
              8.h(),
              TextFormField(
                controller: nameController,
                validator: (v)=>Validator.validateNonNullOrEmpty(v, "Event Name"),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.event_outlined),
                  hintText: StringConst.eventNameHint.tr()
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),  
               12.h(),
               "Location".ts(context),
              8.h(),
              TextFormField(
                controller: locController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.room_outlined),
                  hintText: StringConst.locationHint.tr()
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ), 
               12.h(),
                "Start At".ts(context),
              8.h(),
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: DatePickerField(
                      fieldName: "Start Date",
                      hint: StringConst.startDateHint.tr(),
                      onChanged: (e)=>startDate = e
                    ),
                  ),
                  16.w(),
                  Expanded(
                    flex: 4,
                    child: TimePickerField(
                      fieldName: "Time",
                      hint: StringConst.startTimeHint.tr(),
                      onChanged: (e)=>startTime=e,  
                    ),
                  ),
                ],
              ),
               12.h(),
                "End At".ts(context),
              8.h(),
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: DatePickerField(
                      fieldName: "End Date",
                      hint: StringConst.endDateHint.tr(),
                      onChanged: (e)=>endDate=e,  
                    ),
                  ),
                  16.w(),
                  Expanded(
                    flex: 4,
                    child: TimePickerField(
                      fieldName: "Time",
                      hint: StringConst.endTimeHint.tr(),
                      onChanged: (e)=>endTime=e,  
                    ),
                  ),
                ],
              ),
               12.h(),
              "Description".ts(context),
              8.h(),
              TextFormField(
                controller: descController,
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: StringConst.descHint.tr()
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              32.h(),
              StyledButton(
                onClick: (){
                  if(!formKey.currentState!.validate()){
                    mode.value = AutovalidateMode.always;
                    return;
                  }

                  String qrData = "BEGIN:VEVENT\n"
                    "SUMMARY:${nameController.trim()}\n"
                    "DTSTART:${_formatDateTime(startDate, startTime)}Z\n"
                    "DTEND:${_formatDateTime(endDate, endTime)}Z\n"
                    "LOCATION:${locController.trim()}}\n"
                    "DESCRIPTION:${descController.trim()}\n"
                    "END:VEVENT";

                  context.back(args: SocialLink(
                      id: generateUniqueString(), 
                      name: icon.name, 
                      data: {"value": qrData}, 
                      type: icon.type
                  ));
                }, 
                text: StringConst.create.toUpperCase()
              )
            ],
          ),
        );
      }
    );
  }

  String _formatDateTime(DateTime? dateTime, TimeOfDay? timeOfDay) {
  return "${dateTime?.year.toString().padLeft(4, '0')}"
      "${dateTime?.month.toString().padLeft(2, '0')}"
      "${dateTime?.day.toString().padLeft(2, '0')}T"
      "${timeOfDay?.hour.toString().padLeft(2, '0')}"
      "${timeOfDay?.minute.toString().padLeft(2, '0')}";
  }
}