import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'question.dart';
// import 'package:quizzler/question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Question q1 =
      Question(q: 'You can lead a cow down stairs but not up stairs', a: false);

  List<Icon> scoreKeeper = [];
  // List<bool> answers = [false, true, true];
  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs',
  //   'Approximately one quater of human bones are in the feet',
  //   'A Slug\'s blood is green'
  // ];
  List<Question> questionBank = [
    Question(q: 'You can lead a cow down stairs but not up stairs', a: false),
    Question(
        q: 'Approximately one quater of human bones are in the feet', a: true),
    Question(q: 'A Slug\'s blood is green', a: true)
  ];
  int questionNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
                child: Text(
              questionBank[questionNumber].questionText.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 24),
            )),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              // textColor: Colors.white,
              // color: Colors.green,
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                print(questionNumber);
                print(questionBank.length);

                bool? correctAnswer =
                    questionBank[questionNumber].questionAnswer;

                if (correctAnswer == true) {
                  print('User Got It Right');
                } else {
                  print('User got it wrong');
                }
                setState(() {
                  correctAnswer == true
                      ? scoreKeeper.add(const Icon(
                          Icons.check,
                          color: Colors.green,
                        ))
                      : scoreKeeper.add(const Icon(
                          Icons.close,
                          color: Colors.red,
                        ));
                  // scoreKeeper.add(const Icon(
                  //   Icons.check,
                  //   color: Colors.green,
                  // ));
                  if (questionNumber == questionBank.length - 1) {
                    Alert(
                      context: context,
                      type: AlertType.error,
                      title: "Quiz Completed",
                      desc: "Thank you for playing this game.",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Restart",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Quizzler())),
                          width: 120,
                        )
                      ],
                    ).show();
                  } else {
                    questionNumber++;
                  }
                  // questionNumber++;
                });

                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              // color: Colors.red,
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool? correctAnswer =
                    questionBank[questionNumber].questionAnswer;
                if (correctAnswer == false) {
                  print('User Got It Right');
                } else {
                  print('User got it wrong');
                }
                setState(() {
                  correctAnswer == false
                      ? scoreKeeper.add(const Icon(
                          Icons.check,
                          color: Colors.green,
                        ))
                      : scoreKeeper.add(const Icon(
                          Icons.close,
                          color: Colors.red,
                        ));

                  // scoreKeeper.add(const Icon(
                  //   Icons.close,
                  //   color: Colors.red,
                  // ));
                  if (questionNumber == questionBank.length - 1) {
                    Alert(
                      context: context,
                      type: AlertType.error,
                      title: "Quiz Completed",
                      desc: "Thank you for playing this game.",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Refresh",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Quizzler())),
                          width: 120,
                        )
                      ],
                    ).show();
                  } else {
                    questionNumber++;
                  }

                  // questionNumber++;
                });
                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
        //TODO: Add a Row here as your score keeper
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
