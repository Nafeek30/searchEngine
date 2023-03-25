import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kwic_app/Alphabetize.dart';
import 'package:kwic_app/CircularShift.dart';
import 'package:kwic_app/Sort.dart';

class UserInterfaceScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserInterfaceState();
  }
}

class UserInterfaceState extends State<UserInterfaceScreen> {
  TextEditingController inputController = TextEditingController();
  List<String> allShifts = [];
  List sortedShifts = [];

  /// Initialize Instances
  CircularShift circularShift = CircularShift();
  Alphabetize alphabetize = Alphabetize();
  Sort sort = Sort();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Home'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Type your lines below: ',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 6,
                decoration: const InputDecoration(
                  labelText: 'Enter your text',
                  border: OutlineInputBorder(),
                ),
                controller: inputController,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'All circular shift sentences: ',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    child: ListView.builder(
                      itemCount: allShifts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Text(
                          '${index + 1} - ${allShifts[index]}',
                          style: const TextStyle(fontSize: 16),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Sorted Circular shift possibilities: ',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    child: ListView.builder(
                      itemCount: sortedShifts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Text(
                          '${index + 1} - ${sortedShifts[index]}',
                          style: const TextStyle(fontSize: 16),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // First cleanup, then generate circular shifts, then sort the sentences by
                      // alphabets (upper/lower case not considered), then finally sort the sentences by
                      // upper/lowercase.
                      allShifts.clear();
                      sortedShifts.clear();
                      generateCircularShift();
                      alphabetize.sortLines(sortedShifts);
                      sort.sortLines(sortedShifts);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.greenAccent,
                    ),
                    child: const Text('Compute'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Clear all lists
                        inputController.clear();
                        allShifts.clear();
                        sortedShifts.clear();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.redAccent,
                    ),
                    child: const Text('Reset'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  generateCircularShift() {
    /// split each line and put it in a list
    List<String> lines = inputController.text.split('\n');

    /// for each line, perform circular shifts of all possibilities,
    /// and add to lists [allShifts] and [sortedShifts]. Then omit
    /// noise words.
    lines.forEach((element) {
      List<String> words = element.split(' ').toList();

      for (var i = 0; i < words.length; i++) {
        setState(() {
          allShifts.add(circularShift.circularShift(words, i));
          sortedShifts.add(circularShift.circularShift(words, i));
        });
      }
    });

    setState(() {
      circularShift.omitNoise(allShifts);
      circularShift.omitNoise(sortedShifts);
    });
  }
}
