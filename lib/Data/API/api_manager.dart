// ignore_for_file: prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings, avoid_print
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../Utils/constant_widget.dart';
import '../../Utils/string_constant.dart';
import '../Model/error_model.dart';
import 'api_exeption.dart';

class APIManager {
  // Used to call get API method, pass the url for api call
  Future<dynamic> getAPICall(
      {required String url, bool isLoaderShow = true}) async {
    var responseJson;
    print('[Calling API] => $url');

    try {
      // Show progress loader
      if (isLoaderShow == true) {
        // showProgressIndicator();
      }

      // Set header for send request
      var headers = GetStorage().read(userData) == null
          ? {
              'Content-Type': "application/x-www-form-urlencoded",
            }
          : {
              'Content-Type': "application/x-www-form-urlencoded",
              'Authorization': 'Bearer ${getAuthToken()}',
            };

      final response = await http
          .get(
            Uri.parse(url),
            // headers: headers,
          )
          .timeout(const Duration(seconds: 15))
          .onError(
        (error, stackTrace) {
          print('[Get Api Error] => $error');
          showToast(message: 'No Internet Connection');
          throw FetchDataException('No Internet Connection');
        },
      );
      log('<-------------------- [GET API RESPONSE] -------------------->');
      log(response.body);
      log('<------------------------------------------------------------>');
      responseJson = _response(response);
    } on SocketException {
      // Show error message on SocketException
      Get.showSnackbar(showToast(message: 'No Internet Connection'));
      throw FetchDataException('No Internet Connection');
    } on TimeoutException catch (_) {
      // Throw error message on TimeoutException
      throw FetchDataException('Server Error');
    } finally {
      // Hide progress loader
      if (isLoaderShow == true) {
        dismissProgressIndicator();
      }
    }
    return responseJson;
  }

  // Used to call post API method, pass the url and param for api call
  Future<dynamic> postAPICall(
      {required String url,
      required Map params,
      bool isLoaderShow = true}) async {
    var responseJson;
    print('[Calling API] => $url');
    print('[Calling parameters] => $params');

    try {
      // Show progress loader
      if (isLoaderShow == true) {
        showProgressIndicator();
      }

      // Set header for send request
      var headers = GetStorage().read(userData) == null
          ? {
              'Content-Type': 'application/json',
            }
          : {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer ${getAuthToken()}',
            };

      final response = await http
          .post(
            Uri.parse(url),
            headers: headers,
            body: json.encode(params),
          )
          .timeout(const Duration(seconds: 15))
          .onError(
        (error, stackTrace) {
          print('[Post Api Error] => $error');
          showToast(message: 'No Internet Connection');
          throw FetchDataException('No Internet Connection');
        },
      );
      log('<-------------------- [POST API RESPONSE] -------------------->');
      log(response.body);
      log('<------------------------------------------------------------->');
      responseJson = _response(response);
    } on SocketException {
      // Show error message on SocketException
      showToast(message: 'No Internet Connection');
      throw FetchDataException('No Internet Connection');
    } on TimeoutException catch (_) {
      // Throw error message on TimeoutException
      throw FetchDataException('Server Error');
    } finally {
      // Hide progress loader
      if (isLoaderShow == true) {
        dismissProgressIndicator();
      }
    }
    return responseJson;
  }

  // Used to call put API method, pass the url for api call
  Future<dynamic> putAPICall(
      {required String url, bool isLoaderShow = true}) async {
    var responseJson;
    print('[Calling API] => $url');

    try {
      // Show progress loader
      if (isLoaderShow == true) {
        showProgressIndicator();
      }

      // Set header for send request
      var headers = GetStorage().read(userData) == null
          ? {
              'Content-Type': 'application/json',
            }
          : {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer ${getAuthToken()}',
            };

      final response = await http
          .put(
            Uri.parse(url),
            headers: headers,
          )
          .timeout(const Duration(seconds: 15))
          .onError(
        (error, stackTrace) {
          print('[Put Api Error] => $error');
          showToast(message: 'No Internet Connection');
          throw FetchDataException('No Internet Connection');
        },
      );
      log('<-------------------- [PUT API RESPONSE] -------------------->');
      log(response.body);
      log('<------------------------------------------------------------>');
      responseJson = _response(response);
    } on SocketException {
      // Show error message on TimeoutException
      showToast(message: 'No Internet Connection');
      throw FetchDataException('No Internet Connection');
    } on TimeoutException catch (_) {
      // Throw error message on TimeoutException
      throw FetchDataException('Server Error');
    } finally {
      // Hide progress loader
      if (isLoaderShow == true) {
        dismissProgressIndicator();
      }
    }
    return responseJson;
  }

  // Used to call put with param API method, pass the url and param for api call
  Future<dynamic> putAPICallWithParam(
      {required String url,
      required Map params,
      bool isLoaderShow = true}) async {
    var responseJson;
    print('[Calling API] => $url');
    print('[Calling parameters] => $params');

    try {
      // Show progress loader
      if (isLoaderShow == true) {
        showProgressIndicator();
      }

      // Set header for send request
      var headers = GetStorage().read(userData) == null
          ? {
              'Content-Type': 'application/json',
            }
          : {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer ${getAuthToken()}',
            };

      final response = await http
          .put(
            Uri.parse(url),
            headers: headers,
            body: json.encode(params),
          )
          .timeout(const Duration(seconds: 15))
          .onError(
        (error, stackTrace) {
          print('[Put Api Error] => $error');
          showToast(message: 'No Internet Connection');
          throw FetchDataException('No Internet Connection');
        },
      );
      log('<-------------------- [PUT API WITH PARAM RESPONSE] -------------------->');
      log(response.body);
      log('<----------------------------------------------------------------------->');
      responseJson = _response(response);
    } on SocketException {
      // Show error message on TimeoutException
      showToast(message: 'No Internet Connection');
      throw FetchDataException('No Internet Connection');
    } on TimeoutException catch (_) {
      // Throw error message on TimeoutException
      throw FetchDataException('Server Error');
    } finally {
      // Hide progress loader
      if (isLoaderShow == true) {
        dismissProgressIndicator();
      }
    }
    return responseJson;
  }

  // Used to call delete API method, pass the url for api call
  Future<dynamic> deleteAPICall(
      {required String url, bool isLoaderShow = true}) async {
    var responseJson;
    print('[Calling API] => $url');
    try {
      // Show progress loader
      if (isLoaderShow == true) {
        showProgressIndicator();
      }

      // Set header for send request
      var headers = GetStorage().read(userData) == null
          ? {
              'Content-Type': 'application/json',
            }
          : {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer ${getAuthToken()}',
            };

      final response = await http
          .delete(
            Uri.parse(url),
            headers: headers,
          )
          .timeout(const Duration(seconds: 15))
          .onError(
        (error, stackTrace) {
          print('[Delete Api Error] => $error');
          showToast(message: 'No Internet Connection');
          throw FetchDataException('No Internet Connection');
        },
      );
      log('<-------------------- [DELETE API RESPONSE] -------------------->');
      log(response.body);
      log('<--------------------------------------------------------------->');
      responseJson = _response(response);
    } on SocketException {
      // Show error message on SocketException
      showToast(message: 'No Internet Connection');
      throw FetchDataException('No internet connection');
    } on TimeoutException catch (_) {
      // Throw error message on TimeoutException
      throw FetchDataException('Server Error');
    } finally {
      // Hide progress loader
      if (isLoaderShow == true) {
        dismissProgressIndicator();
      }
    }
    return responseJson;
  }

  // Check response status and handle exception
  dynamic _response(http.Response response) async {
    try {
      var responseJson = json.decode(response.body);

      if (responseJson is List) {
        // Handle response as a list
        return responseJson;
      } else if (responseJson is Map<String, dynamic>) {
        // Handle response as a map
        if (ErrorModel.fromJson(responseJson).status == 0) {
          errorSnackBar(
            message: ErrorModel.fromJson(responseJson).message,
          );
          throw BadRequestException(
            ErrorModel.fromJson(responseJson).message,
          );
        } else {
          return responseJson;
        }
      } else {
        // Invalid JSON format
        throw FormatException('Invalid JSON format');
      }
    } catch (e) {
      // Handle other exceptions
      print('[Error handling API response] => $e');
      throw e;
    }
  }
}
