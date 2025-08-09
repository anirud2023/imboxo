import 'package:get/get.dart';
import 'package:untitled/data/datasources/remote/remote/app_url.dart';
import 'package:untitled/data/datasources/remote/remote/network_api_services.dart';
import 'package:untitled/data/datasources/remote/remote/responseHandler/api_response.dart';
import 'package:untitled/data/datasources/remote/remote/responseHandler/status.dart';
import 'package:untitled/data/model/register_user.dart';
import 'package:untitled/domain/repository/register_user_repo/register_repo.dart';
import 'package:untitled/utils/api_utils/api_util.dart';

class RegisterUserRepoImpl extends RegisterUserRepo{

  final NetworkApiServices _baseApiServices = Get.find<NetworkApiServices>();
  final ApiUtil _apiUtil = Get.find();

  @override
  Future<Resource> postRegisterUser(
      String name,
      String phone,
      String email,
      String password,
      ) async {
    Resource resource = await _baseApiServices.postRequest(
      url: AppUrl.registerEndPont,
      requestData: _apiUtil.registerRequestBody(name, phone, email, password),
      requireToken: false,
    );

    if (resource.status == STATUS.SUCCESS && resource.data != null) {
      RegisterModel model = RegisterModel.fromJson(resource.data);
      return Resource.success(data: model, message: resource.message);
    } else {
      return resource;
    }
  }



}