import 'package:doctor/Provider/conferences_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConferencesView extends StatelessWidget {
  const ConferencesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getData = Provider.of<ConferencesProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Conferences'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: getData.list1.length,
              itemBuilder: (context, index) {
                if (getData.list1.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Image.asset(
                          getData.list1[index].Image!,
                          fit: BoxFit.cover,
                          height: 250,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          title: Text(getData.list1[index].Name!),
                          trailing: Text(getData.list1[index].Date!,
                              style: TextStyle(fontSize: 15)),
                        ),
                        ListTile(
                          title: Text(getData.list1[index].Description!),
                          trailing: Text(getData.list1[index].Location!,
                              style: TextStyle(fontSize: 15)),
                        ),
                      ],
                    ),
                  );
                } else {
                  // Return a placeholder widget or an empty container if list1 is empty
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
