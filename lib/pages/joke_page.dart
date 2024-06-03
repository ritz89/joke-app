import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes_app/controllers/joke_controller.dart';

class JokeWidged extends StatelessWidget {
  const JokeWidged({super.key, required this.jokeCatogories});
  final String jokeCatogories;
  @override
  Widget build(BuildContext context) {
    JokeController jokeController = Get.find<JokeController>();
    jokeController.fetchJoke(jokeCatogories);

    return Scaffold(
      appBar: AppBar(
        title: Text(jokeCatogories),
      ),
      body: Column(
        children: [
          const Image(image: NetworkImage("https://picsum.photos/200/300")),
          _jokeText(jokeController)
        ],
      ),
    );
  }

  Center _jokeText(JokeController jokeController) {
    return Center(
      child: Obx(() {
        if (jokeController.joke.value.id == "") {
          return const CircularProgressIndicator();
        } else {
          return Text(
            jokeController.joke.value.value,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          );
        }
      }),
    );
  }
}
