import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<List<String>> jokeCategories = Rx<List<String>>([]).obs();

  Future<void> fetchJokeCategories() async {
    final res =
        await GetConnect().get("https://api.chucknorris.io/jokes/categories");
    if (res.status.hasError) {
      print("Failed to load joke categories");
    }
    jokeCategories.value = List<String>.from(res.body);
  }
}
