import 'package:get/get.dart';
import 'package:jokes_app/models/joke.dart';

class JokeController extends GetxController {
  var joke = Joke(createdAt: DateTime.now(), updatedAt: DateTime.now()).obs;

  Future<void> fetchJoke(String category) async {
    String url = "https://api.chucknorris.io/jokes/random?category=$category";
    final res = await GetConnect().get(url);
    if (res.statusCode == 200) {
      joke.value = Joke.fromJson(res.body);
      print(joke.value);
    }
  }
}
