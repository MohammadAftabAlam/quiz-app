import "package:flutter/material.dart";
// import "package:quiz_app/questions.dart";

class StartScreen extends StatefulWidget {
  final Function() startOfQuiz;
  const StartScreen({super.key, required this.startOfQuiz});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,

            //Adding Trasperancy to images
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            "Learn Flutter in a fun way!",
            style: TextStyle(
                fontSize: 25, color: Color.fromARGB(255, 237, 223, 252)),
          ),
          const SizedBox(
            height: 10,
          ),

          /* ************** This is for the Icon Button which shows below Learn flutter Text *************** */
          /* I was wondering to use Row widget for adding icon in the button, But wow it's a very easy and nice method to add icon to the button with some text inside it... My mind is just like so beautiful, so elegant, just looking like wow */

          OutlinedButton.icon(
            //startQuiz is a function which is coming from QuizScreen in which QuestionsScreen is stored for Navigating to next screen

            onPressed: widget.startOfQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text("Start Quiz"),
          ),
        ],
      ),
    );
  }
}
