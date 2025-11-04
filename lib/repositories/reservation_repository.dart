import 'package:LCVFlutterSDK/core/models/reservation_item_sdk_request.dart';
import 'package:LCVFlutterSDK/core/network/result.dart';
import 'package:LCVFlutterSDK/core/service_locator.dart';
import 'package:LCVFlutterSDK/core/services/reservation_service.dart';
import 'package:lcv_ui_demo/domains/enities/reservation.dart';
import 'package:lcv_ui_demo/repositories/data_model.dart';

class ReservationRepository {
  final ReservationService _service = ServiceLocator.reservationService;

  Future<DataModel<List<Reservation>>> getResevation() async {
    final result = await _service.getReservation();

    final items =
        (result.data?["data"] as List<dynamic>)
            .map((json) => Reservation.fromJson(json as Map<String, dynamic>))
            .toList();

    return DataModel(statusCode: result.statusCode, data: items);
  }

  Future<Result> newReservation(ReservationItemSdkRequest param) async {
    return await _service.newReservation(param);
  }

  Future<Result> editReservation(ReservationItemSdkRequest param) async {
    return await _service.editReservation(param);
  }

  Future<Result> deleteReservation(int id) async {
    return await _service.deleteReservation(id);
  }

  Future<Result> getReservationSetting() async {
    return await _service.getResetvationSetting();
  }
}
