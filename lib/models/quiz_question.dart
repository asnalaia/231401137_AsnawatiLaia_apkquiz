class QuizQuestion {
  final String? imageAsset;
  final String question;
  final List<String> options;
  final String correctAnswer;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
    this.imageAsset,
  });
}