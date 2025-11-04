import 'package:flutter/material.dart';
import 'package:lcv_ui_demo/gen/assets.gen.dart';
import 'package:lcv_ui_demo/themes/app_colors.dart';
import 'package:lcv_ui_demo/widgets/picker/picker_header_view.dart';

class RepeatpickerView extends StatefulWidget {
  const RepeatpickerView({super.key});

  @override
  State<RepeatpickerView> createState() => _RepeatpickerViewState();
}

class _RepeatpickerViewState extends State<RepeatpickerView> {
  List<RepeatItem> items =
      Repeat.values.map((e) => RepeatItem(isChecked: false, item: e)).toList();

  @override
  Widget build(BuildContext context) {
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
              title: "Repeat",
              save: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 24),
            Column(
              children:
                  items.asMap().entries.map((entry) {
                    return _item(entry.key, onItemTap);
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void onItemTap(int index) {
    setState(() {
      items[index].isChecked = !items[index].isChecked;
    });
  }

  Widget _item(int index, ValueChanged<int> tap) {
    return GestureDetector(
      onTap: () {
        tap(index);
      },
      child: SizedBox(
        height: 36,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Every ${items[index].item.title()}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 20,
              height: 20,
              child:
                  (items[index].isChecked
                          ? Assets.icons.commons.icCheckboxChecked
                          : Assets.icons.commons.icCheckboxUncheck)
                      .image(),
            ),
          ],
        ),
      ),
    );
  }
}

class RepeatItem {
  Repeat item;
  bool isChecked;
  RepeatItem({required this.isChecked, required this.item});
}

enum Repeat { mon, tue, wed, thur, fri, sat, sun }

extension RepeatItemExtenstion on Repeat {
  String title() {
    switch (this) {
      case Repeat.mon:
        return "Monday";
      case Repeat.tue:
        return "Tuesday";
      case Repeat.wed:
        return "Wednesday";
      case Repeat.thur:
        return "Thursday";
      case Repeat.fri:
        return "Friday";
      case Repeat.sat:
        return "Saturday";
      case Repeat.sun:
        return "Sunday";
    }
  }

  int get number {
    switch (this) {
      case Repeat.mon:
        return 1;
      case Repeat.tue:
        return 2;
      case Repeat.wed:
        return 3;
      case Repeat.thur:
        return 4;
      case Repeat.fri:
        return 5;
      case Repeat.sat:
        return 6;
      case Repeat.sun:
        return 7;
    }
  }

  static Repeat fromNumber(int n) {
    switch (n) {
      case 1:
        return Repeat.mon;
      case 2:
        return Repeat.tue;
      case 3:
        return Repeat.wed;
      case 4:
        return Repeat.thur;
      case 5:
        return Repeat.fri;
      case 6:
        return Repeat.sat;
      case 7:
        return Repeat.sun;
      default:
        throw ArgumentError('Invalid number for Repeat enum: $n');
    }
  }

  String minTitle() {
    switch (this) {
      case Repeat.mon:
        return "Mon";
      case Repeat.tue:
        return "Tue";
      case Repeat.wed:
        return "Wed";
      case Repeat.thur:
        return "Thu";
      case Repeat.fri:
        return "Fri";
      case Repeat.sat:
        return "Sat";
      case Repeat.sun:
        return "Sun";
    }
  }
}
