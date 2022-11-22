import 'package:platzi/src/helpers/api_helper.dart';
import 'package:platzi/src/models/api_response_model.dart';
import 'package:platzi/src/web_service/api_routes.dart';

class ProductsRepository {
 Future<ApiResponseModel> getAllProducts() async {
    ApiResponseModel response =
        await ApiHelper().makeGetRequest(ApiRoutes.products);
    return response;
  }
}
