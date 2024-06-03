import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes_app/controllers/home_controller.dart';
import 'package:jokes_app/controllers/joke_controller.dart';
import 'package:jokes_app/pages/joke_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    Get.put(JokeController());
    homeController.fetchJokeCategories();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Jokes"),
      ),
      body: Obx(() {
        if (homeController.jokeCategories.value.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: homeController.jokeCategories.value.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(homeController.jokeCategories.value[index]),
                onTap: () {
                  Get.to(() => JokeWidged(
                      jokeCatogories:
                          homeController.jokeCategories.value[index]));
                },
              );
            },
          );
        }
      }),
    );
  }
}
