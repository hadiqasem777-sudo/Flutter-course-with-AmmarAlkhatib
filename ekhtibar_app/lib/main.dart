import 'package:flutter/material.dart';

import 'AppBrain.dart';

AppBrain appBrain = AppBrain();
void main() {
  runApp(const ExamApp());
}

class QuestionAndAnsware {
  String img;
  String quistion;
  bool answer;

  QuestionAndAnsware(this.img, this.quistion, this.answer);
}

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            backgroundColor: Colors.grey,
            title: Text(
              'Exam App',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          body: Padding(padding: const EdgeInsets.all(20.0), child: ExamPage()),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Padding> amswarResult = [];
  bool examFinished = false;

  void chickAnswer(bool userAnswer) {
    if (examFinished) {
      return;
    }

    setState(() {
      if (userAnswer == appBrain.getAnswer()) {
        amswarResult.add(
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(
              Icons.check,
              color: Color.fromARGB(255, 57, 139, 59),
              size: 30,
            ),
          ),
        );
      } else {
        amswarResult.add(
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(
              Icons.close,
              color: Color.fromARGB(255, 191, 41, 31),
              size: 30,
            ),
          ),
        );
      }

      if (appBrain.getNumOfQuestions() < appBrain.getQuestionCount() - 1) {
        appBrain.nextQuestion();
      } else {
        examFinished = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(appBrain.getImage()),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                  appBrain.getQuestion(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
        Row(children: amswarResult),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  appBrain.restartExam();
                  amswarResult.clear();
                  examFinished = false;
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: const Text(
                'إعادة الإختبار',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  if (examFinished == false) {
                    chickAnswer(true);
                  }
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 57, 139, 59),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: const Text(
                'إجابة صحيحة',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  if (examFinished == false) {
                    chickAnswer(false);
                  }
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 191, 41, 31),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: const Text(
                'إجابة خاطئة',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
