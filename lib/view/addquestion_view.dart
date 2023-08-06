import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:doctor/Provider/question_provider.dart';


class AddQuestion extends StatefulWidget {
  AddQuestion({super.key});

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  List<TextEditingController> _optionsControllers = [];
  TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _optionsControllers
        .add(TextEditingController()); // Initial option text field
  }

  @override
  void dispose() {
    for (var controller in _optionsControllers) {
      controller.dispose();
    }
    _titleController.dispose();
    super.dispose();
  }

  void _addTextField() {
    setState(() {
      _optionsControllers.add(TextEditingController());
    });
  }

  @override
  Widget build(BuildContext context) {
    final getData1 = Provider.of<QuestionProvider>(context);

    return SafeArea(

      child: Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          child: Icon(Icons.add),
          onPressed: _addTextField,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: "Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Options"),
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: _optionsControllers.map((controller) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: "Option",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        controller: controller,
                      ),
                    );
                  }).toList(),
                ),
                Container(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(getData1.addItem(
                        DateTime.now().toString(),
                        _titleController.text,
                        _optionsControllers
                            .map((controller) => controller.text)
                            .join(","),
                      ));
                    },
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
