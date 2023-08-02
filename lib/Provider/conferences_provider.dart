import 'package:doctor/Model/conferences_model.dart';
import 'package:flutter/cupertino.dart';

class ConferencesProvider extends ChangeNotifier {
  List<ConfercesModel> list1 = [
    ConfercesModel(
        Name: "Tooths",
        Description: "Description about the Conferences",
        Date: "22/7/2023",
        Image: "assets/Teeth-Download-PNG.png",
        Location: "jabal amman"),
    ConfercesModel(
        Name: "surgery",
        Description: "Description about the Conferences",
        Date: "22/7/2023",
        Image: "assets/download (1).jpeg",
        Location: "abdali"),
    ConfercesModel(
        Name: "bones",
        Description: "Description about the Conferences",
        Date: "22/7/2023",
        Image: "assets/images.jpeg",
        Location: "abdoun"),
  ];
}
