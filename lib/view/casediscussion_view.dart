import 'package:flutter/material.dart';
import 'package:better_polls/better_polls.dart';

import 'addquestion_view.dart';

class po {
  String id;

  String title;

  List<options> AllOption;

  po({required this.id, required this.title, required this.AllOption});
}

class options {
  String opID;

  String opTitle;

  double counterClicked;

  options(
      {required this.opID,
      required this.opTitle,
      required this.counterClicked});
}

class poData {
  static po item = po(id: 'po1', title: 'title ', AllOption: [
    options(opID: 'opID1', opTitle: 'option 1 ', counterClicked: 0.0),
    options(opID: 'opID2', opTitle: 'option 2', counterClicked: 0.0),
    options(opID: 'opID3', opTitle: 'option 3', counterClicked: 0.0),
    options(opID: 'opID4', opTitle: 'option 4', counterClicked: 0.0)
  ]);

  static void addOption(options newOption) {
    item.AllOption.add(newOption);
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polls',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PollView(),
    );
  }
}

class PollView extends StatefulWidget {
  const PollView({Key? key}) : super(key: key);

  @override
  State<PollView> createState() => _PollViewState();
}

class _PollViewState extends State<PollView> {
  double option1 = 1.0;
  double option2 = 0.0;
  double option3 = 1.0;
  double option4 = 1.0;
  double option5 = 7.0;
  double option6 = 3.0;
  double option7 = 17.0;
  double option8 = 1.0;

  String user = "king@mail.com";
  Map<String, int> usersWhoVoted = {
    'sam@mail.com': 1,
    'mike@mail.com': 1,
    'john@mail.com': 1,
    'kenny@mail.com': 0
  };
  String creator = "eddy@mail.com";
  double counterClicked = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          child: Text("add Q"),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddQuestion(),
            ));
          }),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("fractures in adulthood."),
                SizedBox(
                  height: 10,
                ),
                Text("Quick options for you (click to select):"),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 300,
                  child: poData.item.AllOption.isNotEmpty
                      ?  ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) => Card(
                      color: Color.fromRGBO(245, 245  , 245, 1),
                      child: Polls(
                        children: poData.item.AllOption.map((option) {
                          return Polls.options(
                            title: option.opTitle,
                            value: option.counterClicked,
                          );
                        }).toList(),
                        optionBarRadius: 24,
                        borderWidth: 1,
                        optionHeight: 50,
                        optionSpacing: 12,
                        question: const Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('What is your favorite place?',style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        currentUser: user,
                        creatorID: creator,
                        voteData: usersWhoVoted,
                        userChoice: usersWhoVoted[user],
                        onVoteBorderColor: Colors.deepPurple,
                        voteCastedBorderColor: Colors.orange,
                        onVoteBackgroundColor: Colors.blue,
                        leadingBackgroundColor: Colors.lightGreen,
                        backgroundColor: Colors.white,
                        voteCastedBackgroundColor: Colors.grey,
                        onVote: (choice) {
                          setState(() {
                            usersWhoVoted[user] = choice;
                          });

                          if (choice == poData.item.id) {
                            setState(() {
                              int selectedOptionIndex = poData.item.AllOption
                                  .indexWhere((element) => element.opID == choice);
                              if (selectedOptionIndex != -1) {
                                poData.item.AllOption[selectedOptionIndex]
                                    .counterClicked += 1.0;
                              }
                            });
                          }
                        },
                      ),
                    ),
                  )
                      : Align(
                      alignment: Alignment.center,
                      child: Text("No questions")),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 350,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Share your Oprion",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  color: Color.fromRGBO(243, 242, 238, 1),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "This email is intended for Dr.Hashem Qudah\nUnsubscribe/ Change your email preferences.",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        child: Text(
                          "@ 2023 MedSynapse USA,Singapore,India",
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
