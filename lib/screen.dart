import 'package:flutter/material.dart';

class QuizStartScreen extends StatefulWidget {
  const QuizStartScreen({Key? key}) : super(key: key);

  @override
  State<QuizStartScreen> createState() => _QuizStartScreenState();
}

class _QuizStartScreenState extends State<QuizStartScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _mulaiKuis() {
    String userName = _nameController.text;

    if (userName.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Nama tidak boleh kosong!"),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      print("Nama pengguna: $userName");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Halo, $userName! Selamat datang di kuis."),
          backgroundColor: const Color(0xff7ed957), // Warna hijau Anda
        ),
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA47CF3),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "AYO\nMAIN KUIS!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Baloo 2',
                  fontSize: 48,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 30),


              Image.asset(
                "assets/logo.png",
                width: 296,
                height: 296,
              ),
              const SizedBox(height: 30),

              Container(
                width: 258,
                height: 62,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _nameController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Masukan nama kamu",
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[500],
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: _mulaiKuis,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff7ed957),
                  minimumSize: const Size(258, 62),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  "Mulai!",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}