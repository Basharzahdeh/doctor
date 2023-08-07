import 'package:flutter/cupertino.dart';

import '../view/casediscussion_view.dart';

class OptionProvider with ChangeNotifier {
  List<po> items = [];

   addItemToList(String itemId, String title, List<options> optionsList) {
    items.add(po(
      id: DateTime.now().toString(),
      title: title,
      AllOption: optionsList,
    ));

    notifyListeners(); // Moved inside the method
  }
}