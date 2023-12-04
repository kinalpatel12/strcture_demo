import 'package:api_structure/Data/Model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../Data/Model/login_model.dart';
import '../Data/Repository/authentication_repository.dart';
import '../Data/api/api_manager.dart';
import '../Utils/constant_widget.dart';
import '../Utils/string_constant.dart';

class AuthenticationController extends GetxController {
  final authenticationRepository = AuthenticationRepository(APIManager());

  // Login Screen
  // TextEditingController passLoginController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // Rx<GetUserProfileModel> userProfileData = GetUserProfileModel().obs;

  // Rx<PhoneNumber> phoneData = PhoneNumber(countryISOCode: '', countryCode: '', number: '').obs;
  RxList<Product> eventList = <Product>[].obs;

  final List<String> items = [
    'Male',
    'Female',
  ];

  @override
  void onInit() async {
    // getFcmToken();
    super.onInit();
  }

  // getFcmToken() async {
  //   var getToken = await FirebaseMessaging.instance.getToken();
  //   fcmToken.value = getToken!;
  //   if (kDebugMode) {
  //     print("[FCM Token] =====> $fcmToken");
  //   }
  // }

  // signUPWithEmailPassword() async {
  //   LoginModel loginModel = await authenticationRepository.registerApiCall(
  //     params: {
  //       'username': 'happy',
  //       'email': emailController.text,
  //       'password': passwordController.text,
  //       'country_code': phoneData.value.countryCode,
  //       'iso_code': phoneData.value.countryISOCode,
  //       'phone': phoneData.value.number,
  //       'age': ageController.text.toString(),
  //       'gender': selectedValue.toString(),
  //       'device_token': fcmToken.value,
  //     },
  //   );
  //   if (loginModel.success == true) {
  //     GetStorage().write(userData, loginModel.toJson());
  //     GetStorage().write(authToken, loginModel.data!.token);

  //     Get.offAllNamed(Routes.HOME_SCREEN);
  //     userNameController.clear();
  //     emailController.clear();
  //     passwordController.clear();
  //     ageController.clear();
  //     // phoneData.value = PhoneNumber(countryISOCode: "", countryCode: "", number: "");
  //     successSnackBar(message: loginModel.message.toString());
  //   } else {
  //     errorSnackBar(message: loginModel.message.toString());
  //   }
  // }

// //********************** Log in with E-mail & Password **********************//

  signInWithEmailPassword() async {
    LoginModel loginModel = await authenticationRepository.loginApiCall(
      params: {
        'email': 'abcd12@gmail.com',
        'password': '12345678',
        'device_token': 'ggyfftf',
      },
    );
    if (loginModel.success == true) {
      GetStorage().write(userData, loginModel.toJson());
      GetStorage().write(authToken, loginModel.data!.token);
      // Get.offAllNamed(Routes.HOME_SCREEN);
      print("Done");
      emailController.clear();
      passwordController.clear();
      successSnackBar(message: loginModel.message.toString());
    } else {
      errorSnackBar(message: loginModel.message.toString());
    }
  }

  Future<void> getEventListData() async {
    ProductModel eventData = await authenticationRepository.productApiCall();
    eventList.addAll(eventData.products!);
    print(eventList);
  }
}
