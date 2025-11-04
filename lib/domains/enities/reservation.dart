import 'package:LCVFlutterSDK/core/models/reservation_item_sdk_request.dart';
import 'package:LCVFlutterSDK/core/models/reservation_setting_sdk_request.dart';
import 'package:lcv_ui_demo/domains/enities/repetition.dart';
import 'package:lcv_ui_demo/widgets/picker/repeat_picker_view.dart';

class Reservation {
  final int reservationNo;
  bool activeStatus;
  final Repetition repetition;

  Reservation(
    this.repetition, {
    required this.reservationNo,
    required this.activeStatus,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      Repetition.fromJson(json["Repetition"]),
      reservationNo: json["ReservationNo"],
      activeStatus: json["ActiveStatus"] == 1,
    );
  }

  String title() {
    String hours =
        (repetition.hours > 12 ? repetition.hours - 12 : repetition.hours)
            .toString();
    String mins = repetition.mins.toString();
    String typer = (repetition.hours > 12 ? "PM" : "AM");
    return "$hours:$mins $typer";
  }

  String desc() {
    return repetition.week
        .map((e) => RepeatItemExtenstion.fromNumber(e).minTitle())
        .join(",");
  }

  ReservationItemSdkRequest parse() {
    return ReservationItemSdkRequest(
      repetition: RepetitionSDK(
        week: repetition.week,
        hour: repetition.hours,
        min: repetition.mins,
        setting: repetition.setting.toSetting(),
      ),
      reservationNo: reservationNo,
      activeStatus: activeStatus,
    );
  }
}
