import 'package:LCVFlutterSDK/core/models/reservation_setting_sdk_request.dart';

class ReservationSetting {
  final String temperature;
  final bool steering;
  final bool frontDefogger;
  final bool rearDefogger;

  ReservationSetting({
    required this.temperature,
    required this.steering,
    required this.frontDefogger,
    required this.rearDefogger,
  });

  factory ReservationSetting.fromJson(Map<String, dynamic> json) {
    return ReservationSetting(
      frontDefogger: json["FrontDefoggers"] == "1",
      rearDefogger: json["RearDefogger"] == "1",
      temperature: json["Temperature"],
      steering: json["Steering"] == "1",
    );
  }

  ReservationSettingSdkRequest toSetting() {
    return ReservationSettingSdkRequest(
      frontDefogger: frontDefogger,
      temperature: temperature,
      steering: steering,
      rearDefogger: rearDefogger,
      shVlType: true,
    );
  }
}
