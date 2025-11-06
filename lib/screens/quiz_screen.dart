import 'package:flutter/material.dart';
import 'result_screen.dart';
import '../models/quiz_question.dart';
import '../widgets/answer_button.dart';
import '../widgets/primary_button.dart';

class QuizScreen extends StatefulWidget {
  final String userName;
  const QuizScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late final List<QuizQuestion> _questions;
  int _questionIndex = 0;
  int _score = 0;
  String? _selectedAnswer;


  List<QuizQuestion> _buildDummyQuestions() {
    const String dummyImage = "assets/woody.png";

    return [
      QuizQuestion(
        question: "What is the name of the toy cowboy in Toy Story?",
        options: ["WOODY", "BUZZ", "JACK", "SMITH"],
        correctAnswer: "WOODY",
        imageAsset: dummyImage,
      ),
      QuizQuestion(
        question: "Siapa nama singa muda di 'The Lion King'?",
        options: ["Simba", "Mufasa", "Scar", "Nala"],
        correctAnswer: "Simba",
      ),
      QuizQuestion(
        question: "Apa nama 'space ranger' di 'Toy Story'?",
        options: ["Zurg", "Buzz Lightyear", "Rex", "Andy"],
        correctAnswer: "Buzz Lightyear",
      ),
      QuizQuestion(
        question: "Siapa nama putri salju di 'Frozen'?",
        options: ["Anna", "Moana", "Cinderella", "Elsa"],
        correctAnswer: "Elsa",
      ),
      QuizQuestion(
        question: "Apa nama ikan badut di 'Finding Nemo'?",
        options: ["Dory", "Marlin", "Nemo", "Bruce"],
        correctAnswer: "Nemo",
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _questions = _buildDummyQuestions();
  }

  void _handleAnswerTap(String answer) {
    setState(() {
      _selectedAnswer = answer;
    });
  }

  void _goToNextQuestion() {
    if (_selectedAnswer == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Pilih jawaban dulu!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_selectedAnswer == _questions[_questionIndex].correctAnswer) {
      _score++;
    }

    if (_questionIndex < _questions.length - 1) {
      setState(() {
        _questionIndex++;
        _selectedAnswer = null;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            userName: widget.userName,
            score: _score,
            totalQuestions: _questions.length,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final QuizQuestion currentQuestion = _questions[_questionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text("Question ${_questionIndex + 1} of ${_questions.length}"),
        backgroundColor: const Color(0xFFA47CF3),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFA47CF3),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            if (currentQuestion.imageAsset != null)
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 176,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                  ),
                  Image.asset(
                    currentQuestion.imageAsset!,
                    height: 260,
                  ),
                ],
              ),

            if (currentQuestion.imageAsset != null)
              const SizedBox(height: 30),

            Text(
              currentQuestion.question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Baloo 2',
                fontSize: 30,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),

            ...currentQuestion.options.map((answer) {
              final bool isSelected = _selectedAnswer == answer;
              return AnswerButton(
                text: answer,
                isSelected: isSelected,
                onPressed: () => _handleAnswerTap(answer),
              );
            }).toList(),

            const SizedBox(height: 30),

            PrimaryButton(
              onPressed: _goToNextQuestion,
              text:
              _questionIndex == _questions.length - 1 ? "Selesai" : "Next",
              fontSize: 22,
            ),
          ],
        ),
      ),
    );
  }
}