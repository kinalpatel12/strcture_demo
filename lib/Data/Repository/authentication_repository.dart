import '../../Utils/string_constant.dart';
import '../Model/login_model.dart';
import '../Model/product_model.dart';
import '../api/api_manager.dart';

class AuthenticationRepository {
  final APIManager apiManager;
  AuthenticationRepository(this.apiManager);

  Future<LoginModel> loginApiCall(
      {required Map<String, dynamic> params}) async {
    var jsonData = await apiManager.postAPICall(
      url: '${baseUrl}login',
      params: params,
    );
    var response = LoginModel.fromJson(jsonData);
    return response;
  }

  Future<ProductModel> productApiCall() async {
    var jsonData = await apiManager.getAPICall(url: '${baseUrl}');

    if (jsonData is List) {
      List<Product> productsList =
          jsonData.map((item) => Product.fromJson(item)).toList();
      return ProductModel(products: productsList);
    } else if (jsonData is Map<String, dynamic>) {
      // Handle the case where jsonData is a single object
      return ProductModel(products: [Product.fromJson(jsonData)]);
    } else {
      // Handle other cases or throw an exception
      throw FormatException('Invalid JSON format');
    }
  }

  Future<List<SearchModel>> searchApiCall() async {
    try {
      var jsonData = await apiManager.getAPICall(url: '${baseUrl}');
      if (jsonData is List<dynamic>) {
        return jsonData.map((item) => SearchModel.fromJson(item)).toList();
      } else {
        throw Exception('Unexpected JSON structure. Expected a list.');
      }
    } catch (e) {
      // Handle exceptions, log errors, or rethrow if needed
      print('Error in itemsApiCall: $e');
      throw e; // Rethrow the exception to propagate it
    }
  }
}
