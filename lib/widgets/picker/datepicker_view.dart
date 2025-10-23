import 'package:flutter/widgets.dart';
import 'package:lcv_ui_demo/widgets/picker/picker_header_view.dart';

class DatepickerView extends StatefulWidget {
  const DatepickerView({super.key});

  @override
  State<DatepickerView> createState() => _DatepickerViewState();
}

class _DatepickerViewState extends State<DatepickerView> {
  @override
  Widget build(BuildContext context) {
    return _containerView();
  }

  Widget _containerView() {
    return Container(
      height: 470,
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        children: [PickerHeaderView(title: "Select date"), _mainView()],
      ),
    );
  }

  Widget _mainView() {
    return Container();
  }

  // Widget _mainHeader() {
  //   return
  // }
}
