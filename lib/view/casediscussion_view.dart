import 'package:better_polls/better_polls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PollView extends StatefulWidget {
  const PollView({Key? key}) : super(key: key);

  @override
  State<PollView> createState() => _PollViewState();
}

class _PollViewState extends State<PollView> {
  double option1 = 1.0;
  double option2 = 3.0;
  double option3 = 1.0;
  double option4 = 1.0;

  String user = "king@mail.com";
  Map<String, int> usersWhoVoted = {
    'sam@mail.com': 3,
    'mike@mail.com': 4,
    'john@mail.com': 1,
    'kenny@mail.com': 1
  };
  String creator = "eddy@mail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Card(

                  color: Color.fromRGBO(230, 234, 243, 1),
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: Polls(
                      children: [
                        // This cannot be less than 2, else will throw an exception
                        Polls.options(
                            title: 'May be',
                            value: option1),
                        Polls.options(
                            title: 'yes',
                            value: option2),
                        Polls.options(
                            title: 'no',
                            value: option3),
                        Polls.options(
                            title: 'other',
                            value: option4),
                      ],
                      optionBarRadius: 9,
                      borderWidth: 1,
                      optionHeight: 70,

                      optionSpacing: 12,
                      question: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                            'Do you recommend Vitamin K2\nfor patients with low-\nenergy bone fractures?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      ),
                      currentUser: user,
                      creatorID: creator,
                      voteData: usersWhoVoted,
                      userChoice: usersWhoVoted[user],
                      onVoteBorderColor: Colors.blue,
                      voteCastedBorderColor: Colors.orange,
                      onVoteBackgroundColor: Colors.blue,
                      leadingBackgroundColor: Colors.lightGreen,
                      backgroundColor: Colors.white,
                      voteCastedBackgroundColor: Colors.grey,
                      onVote: (choice) {
                        setState(() {
                          usersWhoVoted[user] = choice;
                        });
                        if (choice == 1) {
                          setState(() {
                            option1 += 1.0;
                          });
                        }
                        if (choice == 2) {
                          setState(() {
                            option2 += 1.0;
                          });
                        }
                        if (choice == 3) {
                          setState(() {
                            option3 += 1.0;
                          });
                        }
                        if (choice == 4) {
                          setState(() {
                            option4 += 1.0;
                          });
                        }
                      },
                    ),
                  ),
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
