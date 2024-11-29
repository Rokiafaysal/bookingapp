import 'package:bookingapp/data/data_source/remote/remote_data.dart';
import 'package:bookingapp/data/models/baisc_response.dart';
import 'package:bookingapp/data/models/reserve_model.dart';
import 'package:bookingapp/data/repo/reserve_repository.dart';

class ReserveRepoImp implements ReserveRepository {
  @override
  Future<ResponseModel> createReseervation({required Reserve reserv}) {
    return MainFun.postReq(
        ResponseModel.fromJson, "appartements/addreverse", reserv.toJson());
  }

  @override
  Future<Reserve> getReserve() {
    // TODO: implement getReserve
    throw UnimplementedError();
  }
}
