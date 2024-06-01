
import 'package:dio/dio.dart';
import 'package:quizfullapp/Quiz/QuizModel.dart';

Future<List<QuizModel>> getQuiz() async {
  Dio req = Dio();
  try {
    Response response =
    await req.get("https://6654ec903c1d3b602937cdc1.mockapi.io/Quiz");
    List<QuizModel> quiz = List.generate(
      response.data.length,
          (index) => QuizModel.fromMap(response.data[index]),
    );
    return quiz;
  } catch (e) {
    print("Failed to load quiz data: $e");
    return [];
  }
}
