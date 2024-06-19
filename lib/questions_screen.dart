import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      //   if (currentQuestionIndex == QuestionsArray.questions.length - 1) {
      //     currentQuestionIndex = -1;
      //   }
      currentQuestionIndex++;
      //   debugPrint(currentQuestionIndex.toString());
    });

    // if(currentQuestionIndex == selectedAnswer.length){

    // }
  }

  @override
  Widget build(BuildContext context) {
    // Getting questions from Questions.dart page
    var currentQuestion = QuestionsArray.questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),

            /* Spreading Values(...) 
                eg. const numbers = [1,2,3]
                const moreNums = [numbers, 4];     --result--> [[1,2,3],4]
                const moreNums = [...numbers,4];   --result--> [1,2,3,4]
            */

            //We are going to shuffle the answer index... logic has been written in quiz_question.dart screen. There is [getShuffledList] created by me for shuffling the answer array by using the internal method named as [shuffle]
            ...currentQuestion.getShuffledAnswer().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

class AnswerButton extends StatelessWidget {
  final String answerText;
  final VoidCallback onTap;
  const AnswerButton(
      {super.key, required this.onTap, required this.answerText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 33, 1, 95),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          answerText,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
