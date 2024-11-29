import 'package:bookingapp/data/data_source/remote/remote_data.dart';
import 'package:bookingapp/data/models/appartment_model.dart';
import 'package:bookingapp/data/models/baisc_response.dart';
import 'package:bookingapp/data/repo/appartment_repository.dart';

class AppartmentRepoImpl implements AppartmentRepository {
  @override
  Future<ResponseModel> createAppartment({required AppartementModel app}) {
    return MainFun.postReq(
        ResponseModel.fromJson, "appartements/addappartement", app.toJson());
  }

  @override
  Future<List<AppartementModel>> getAppartment() {
    return MainFun.getReq(
        AppartementModel.fromJson, "appartements/getappartements");
  }

  @override
  Future<AppartementModel> getAppartmentbyid({required int id}) {
    return MainFun.getReqMap(
        AppartementModel.fromJson, "appartements/getappartementbyid/$id");
  }
}
