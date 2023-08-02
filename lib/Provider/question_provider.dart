import 'package:doctor/Model/question_model.dart';
import 'package:flutter/cupertino.dart';

class QuestionProvider with ChangeNotifier {
  Map<String, QuestionModel> _ques = {};

  Map<String, QuestionModel> get ques {
    return {..._ques};
  }

  addItem(
      String itemId,
      String Title,
      String option,


      ) {
    _ques.putIfAbsent(
      itemId, () => QuestionModel(
        id: DateTime.now().toString(),
        Title: Title,
        Option: option,

    ));
    notifyListeners();
  }
}

