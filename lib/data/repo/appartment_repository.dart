import 'package:bookingapp/data/models/appartment_model.dart';
import 'package:bookingapp/data/models/baisc_response.dart';

abstract class AppartmentRepository {
  Future<ResponseModel> createAppartment({required AppartementModel app});
  Future<List<AppartementModel>> getAppartment();
  Future<AppartementModel> getAppartmentbyid({required int id});
}
