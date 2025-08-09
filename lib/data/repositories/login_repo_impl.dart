import 'package:get/get.dart';
import 'package:untitled/data/datasources/remote/remote/app_url.dart';
import 'package:untitled/data/datasources/remote/remote/network_api_services.dart';
import 'package:untitled/data/datasources/remote/remote/responseHandler/api_response.dart';
import 'package:untitled/data/datasources/remote/remote/responseHandler/status.dart';
import 'package:untitled/data/model/login.dart';
import 'package:untitled/domain/repository/login_repo/login_repo.dart';
import 'package:untitled/utils/api_utils/api_util.dart';

class LoginRepoImpl extends LoginRepo{
  final NetworkApiServices _baseApiServices = Get.find<NetworkApiServices>();
  final ApiUtil _apiUtil = Get.find();

  @override
  Future<Resource> postLogin(String email, String password) async{
    Resource resource = await _baseApiServices.postRequest(
        url: AppUrl.loginEndPont, requestData: _apiUtil.loginRequestBody(email,password), requireToken: false);
    if (resource.status == STATUS.SUCCESS && resource.data != null) {
       LoginModel model = LoginModel.fromJson(resource.data);
      return Resource.success(data: model, message: resource.message);
    } else {
      return resource;
    }
  }

}