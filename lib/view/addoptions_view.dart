import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/option_provider.dart';
import 'casediscussion_view.dart';

class AddOptions extends StatefulWidget {
  final List<po> items;
  final Function(List<po>) updateItems;

  AddOptions({Key? key, required this.items, required this.updateItems}) : super(key: key);

  @override
  State<AddOptions> createState() => _AddOptionsState();
}

class _AddOptionsState extends State<AddOptions> {
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
    final getData1 = Provider.of<OptionProvider>(context);

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
                      List<options> optionsList = _optionsControllers.map((controller) {
                        return options(
                          opID: UniqueKey().toString(),
                          opTitle: controller.text,
                          counterClicked: 0.0,
                        );
                      }).toList();

                      Navigator.of(context).pop(
                      widget.updateItems(getData1.addItemToList(
                      DateTime.now().toString(),
                      _titleController.text,
                      optionsList,
                      ))
                      );
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