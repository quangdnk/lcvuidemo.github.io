import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/extensions/hex_color_extension.dart';
import 'package:lcv_ui_demo/themes/app_colors.dart';
import 'package:lcv_ui_demo/widgets/picker/picker_header_view.dart';
import 'package:table_calendar/table_calendar.dart';

class DatepickerView extends StatefulWidget {
  const DatepickerView({super.key});

  @override
  State<DatepickerView> createState() => _DatepickerViewState();
}

class _DatepickerViewState extends State<DatepickerView> {
  DateTime? _selectedDay;
  DateTime _forcusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return _containerView();
  }

  Widget _containerView() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.black30,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            PickerHeaderView(
              title: "Select date",
              save: () {
                Navigator.pop(context);
              },
            ),
            TableCalendar(
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _forcusedDay = focusedDay;
                  _selectedDay = selectedDay;
                });
              },
              daysOfWeekVisible: true,
              headerVisible: true,
              focusedDay: _forcusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              firstDay: DateTime.now(),
              lastDay: DateTime.utc(2030, 3, 14),
              headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              calendarStyle: CalendarStyle(
                defaultTextStyle: TextStyle(fontSize: 20, color: Colors.white),
                weekendTextStyle: TextStyle(fontSize: 20, color: Colors.white),
                selectedTextStyle: TextStyle(color: "#0A84FF".toColor()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pickerView() {
    return Container(child: Column(children: [

        ],
      ));
  }

  Widget _pickerDateHeader() {
    return Row(children: [Container(), Container()]);
  }
}
