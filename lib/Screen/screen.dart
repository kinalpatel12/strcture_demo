import 'package:api_structure/Controller/authentication_controller.dart';
import 'package:api_structure/Data/Model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  @override
  void initState() {
    super.initState();
    // authenticationController.getEventListData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () async {
                await authenticationController.signInWithEmailPassword();
              },
              child: const Center(
                child: Text("Login"),
              ),
            ),
          ),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: authenticationController.eventList.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       Product eventData = authenticationController.eventList[index];
          //       return Container(
          //         color: Colors.green,
          //         child: Text(
          //           eventData.title.toString(),
          //         ),
          //       );
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
