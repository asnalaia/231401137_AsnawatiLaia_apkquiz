import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizScreen(
            userName: userName,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // 1. Dapatkan ukuran layar perangkat
    final double screenWidth = MediaQuery.of(context).size.width;

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
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),

              // 2. PERUBAHAN: Lebar gambar sekarang 70% dari lebar layar
              //    Tinggi dihapus agar rasio aspek gambar tetap terjaga
              Image.asset(
                "assets/logo.png",
                width: screenWidth * 0.7, // 70% dari lebar layar
              ),
              const SizedBox(height: 30),

              // 3. PERUBAHAN: Lebar kontainer sekarang 80% dari lebar layar
              Container(
                width: screenWidth * 0.8, // 80% dari lebar layar
                height: 62, // Tinggi tetap untuk ergonomi tap
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

              // 4. PERUBAHAN: Lebar minimum tombol sekarang 80% dari lebar layar
              ElevatedButton(
                onPressed: _mulaiKuis,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff7ed957),
                  minimumSize: Size(screenWidth * 0.8, 62), // 80% lebar, 62 tinggi
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  "Mulai!",
                  style: TextStyle(
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