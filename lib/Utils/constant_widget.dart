import 'package:api_structure/Utils/string_constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

///
/// Snackbar for showing error message
///
errorSnackBar({String? title, String? message}) {
  Get.log("[$title] $message", isError: true);
  return Get.showSnackbar(
    GetSnackBar(
      titleText: Text(
        title ?? 'Error',
        style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            height: 1.0,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      messageText: Text(
        message!,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            height: 1.0,
            fontWeight: FontWeight.w700),
        textAlign: TextAlign.left,
      ),
      snackPosition: SnackPosition.BOTTOM,
      shouldIconPulse: true,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.red.withOpacity(0.80),
      icon: const Icon(Icons.gpp_bad_outlined, size: 30.0, color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(
        seconds: 3,
      ),
    ),
  );
}

///
/// Snackbar for showing info message
///
infoSnackBar({String? title, String? message}) {
  Get.log("[$title] $message", isError: true);
  return Get.showSnackbar(
    GetSnackBar(
      titleText: Text(
        title ?? 'Info',
        style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            height: 1.0,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      messageText: Text(
        message!,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            height: 1.0,
            fontWeight: FontWeight.w700),
        textAlign: TextAlign.left,
      ),
      snackPosition: SnackPosition.BOTTOM,
      shouldIconPulse: true,
      margin: const EdgeInsets.all(20),
      backgroundColor: const Color(0xFF60B2F5),
      icon: const Icon(Icons.info_outline_rounded,
          size: 30.0, color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(
        seconds: 3,
      ),
    ),
  );
}

///
/// Snackbar for showing success message
///
successSnackBar({String? title, String? message}) {
  Get.log("[$title] $message", isError: true);
  return Get.showSnackbar(
    GetSnackBar(
      titleText: Text(
        title ?? 'Success',
        textAlign: TextAlign.left,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            height: 1.0,
            fontWeight: FontWeight.bold),
      ),
      messageText: Text(
        message!,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            height: 1.0,
            fontWeight: FontWeight.w700),
        textAlign: TextAlign.left,
      ),
      isDismissible: true,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.green.withOpacity(0.80),
      icon:
          const Icon(Icons.task_alt_outlined, size: 30.0, color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
    ),
  );
}

///
/// Show progress indicator when API call Or any other async method call
///
showProgressIndicator() {
  return EasyLoading.show(
    maskType: EasyLoadingMaskType.black,
    status: 'Loading',
    dismissOnTap: false,
  );
}

///
/// Dismiss progress indicator after API calling Or any other async method calling
///
dismissProgressIndicator() {
  return EasyLoading.dismiss();
}

///
/// Get Stored User Auth Token
///

String getAuthToken() {
  if (kDebugMode) {
    print('Auth Token => ${GetStorage().read(authToken) ?? ''}');
  }
  return GetStorage().read(authToken) ?? '';
}

// Toast for message
showToast({String? message}) {
  return Fluttertoast.showToast(
    msg: message!,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.grey.withOpacity(0.9),
    textColor: Colors.white,
    fontSize: 15,
  );
}

/// date picker
///
datePicker(
  context,
  TextEditingController textEditingController, {
  DateTime? dateTime,
}) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: dateTime ?? DateTime.now(),
    firstDate: DateTime(1891),
    lastDate: DateTime(2100),
    selectableDayPredicate: (DateTime date) {
      // Disable past dates (before current date)
      return date.isAfter(DateTime.now().subtract(const Duration(days: 1)));
    },
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: Color(0xff108CF2),
            onPrimary: Color(0xFFFFFFFF),
            onSurface: Color(0xFF4A4A4A),
          ),
          textButtonTheme: TextButtonThemeData(
            style:
                TextButton.styleFrom(backgroundColor: const Color(0xFFFFFFFF)),
          ),
        ),
        child: child!,
      );
    },
  );
  return pickedDate;
}
