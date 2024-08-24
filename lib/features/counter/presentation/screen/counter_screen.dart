import 'package:contact_book/constant/app_space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constant/widget/custom_appbar_widget.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());

    return Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed.
        appBar: CustomAppbarWidget(
          appBarTitle: 'counter',
        ),
        // AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() => Text(
                      "Clicks: ${c.count}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                AppSpace.height30,
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.indigoAccent)),
                    child: Text(
                      "Go to Other",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => Get.to(Other())),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.indigoAccent,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: c.increment));
  }
}

// class Controller {}
class Controller extends GetxController {
  var count = 0.obs;

  increment() => count + 2;

  ///Arrow Function
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(body: Center(child: Text("${c.count}")));
  }
}
