 int calculateScore({required questions,required selectedAnswers}) {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (selectedAnswers[i] == questions[i].options[questions[i].correctAnswerIndex]) {
        score++;
      }
    }
    return score;
  }
