import 'package:bookingapp/data/models/apparntment_send_model.dart';
import 'package:bookingapp/data/models/appartment_model.dart';
import 'package:bookingapp/data/models/baisc_response.dart';
import 'package:bookingapp/data/models/single_appartment_model.dart';

abstract class AppartmentRepository {
  Future<ResponseModel> createAppartment({required AppartementSendModel app});
  Future<List<AppartementModel>> getAppartment();
  Future<SingleAppartmentModel> getAppartmentbyid({required int id});
}
