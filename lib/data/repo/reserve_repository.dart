import 'package:bookingapp/data/models/baisc_response.dart';
import 'package:bookingapp/data/models/reserve_model.dart';

abstract class ReserveRepository {
  Future<ResponseModel> createReseervation({required Reserve reserv});
  Future<Reserve> getReserve();
}
