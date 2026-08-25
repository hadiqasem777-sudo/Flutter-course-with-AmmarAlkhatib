import 'QuestionAndAnsware.dart';

class AppBrain {
  int _numOfQuestions = 0;
  final List<QuestionAndAnsware> _questions = [
    QuestionAndAnsware(
      'images/image-1.jpg',
      'عدد كواكب المجموعة الشمسية هو ثمانية كواكب ؟',
      true,
    ),
    QuestionAndAnsware('images/image-2.jpg', 'القطط كائنات لاحمة ؟', true),
    QuestionAndAnsware(
      'images/image-3.jpg',
      'الصين موجودة بالقارة الأفريقية ؟',
      false,
    ),
    QuestionAndAnsware('images/image-4.jpg', 'الأرض كروية ؟', true),
    QuestionAndAnsware(
      'images/image-5.jpg',
      'بإستطاعة الإنسان البقاء على قيد الحياة بدون أكل اللحوم',
      true,
    ),
    QuestionAndAnsware(
      'images/image-6.jpg',
      'الشمس تدور حول الأرض والأرض تدور حول القمر',
      false,
    ),
    QuestionAndAnsware('images/image-7.jpg', 'الحيوانات لا تشعر بالألم', false),
  ];

  void restartExam() {
    _numOfQuestions = 0;
  }

  void nextQuestion() {
    if (_numOfQuestions < _questions.length - 1) {
      _numOfQuestions++;
    }
  }

  int getNumOfQuestions() {
    return _numOfQuestions;
  } 

  int getQuestionCount() {
    return _questions.length;
  }

  String getQuestion() {
    return _questions[_numOfQuestions].quistion;
  }

  String getImage() {
    return _questions[_numOfQuestions].img;
  }

  bool getAnswer() {
    return _questions[_numOfQuestions].answer;
  }
}
