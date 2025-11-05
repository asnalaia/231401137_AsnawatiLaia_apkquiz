import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final String userName;

  const QuizScreen({
    Key? key,
    required this.userName,
  }) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String? _selectedAnswer;
  final List<String> _options = ["WOODY", "BUZZ", "JACK", "SMITH"];

  void _handleAnswerTap(String answer) {
    setState(() {
      _selectedAnswer = answer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Question 12 of 20"),
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
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 176, // Tinggi tetap
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),
                Image.asset(
                  "assets/woody.png",
                  height: 260,
                ),
              ],
            ),
            const SizedBox(height: 30),

            const Text(
              "What is the name of the toy cowboy in Toy Story?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Baloo 2',
                fontSize: 30,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),

            ..._options.map((answer) {
              final bool isSelected = _selectedAnswer == answer;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () => _handleAnswerTap(answer),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected ? Colors.white : const Color(0xffd8d5e9),
                    foregroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    elevation: 3,
                  ),
                  child: Text(
                    answer,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              );
            }).toList(),

            const SizedBox(height: 30),

            // --- Tombol "Next" (Sekarang Responsif) ---
            ElevatedButton(
              onPressed: () {
                if (_selectedAnswer == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Pilih jawaban dulu!"),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  print("Jawaban dipilih: $_selectedAnswer");
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff7ed957),
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: const Text(
                "Next",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}