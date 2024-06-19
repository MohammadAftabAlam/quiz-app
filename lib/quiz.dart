import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';
// import 'package:quiz_app/result_scree.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   super.initState();
  //   // Here activeScreen is defined
  //   activeScreen = StartScreen(
  //     startQuiz: switchScreen,
  //   );
  // }

  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == QuestionsArray.questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = "result-screen";

        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => ResultScreen()));
      });
    }
  }

  String activeScreen = 'first-screen';
//switchScreen function is defined here for changing the screen
  switchScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(startOfQuiz: switchScreen);
    if (activeScreen == 'question-screen') {
      setState(() {
        screenWidget = QuestionScreen(
          onSelectedAnswer: chooseAnswer,
        );
      });
    }
    if (activeScreen == 'result-screen') {
      setState(() {
        screenWidget = ResultScreen(
          choosenAnswers: selectedAnswers,
        );
      });
    }

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              /* **************** This is the way to add Linear color to the container ************** */
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),

            //Firstly the activeScreen have the value of StartScreen.
            //There is function named as SwitchScreen() in which there is a setState((){}); which is calling QuestionsScreen. Inside initState(){} activeScreen is defined
            //This active screen first shows the StartScreen and then button on startScreen gets clicked then QuestionsScreen will be shown

            child: screenWidget

            // child: activeScreen == 'first-screen'
            //     ? StartScreen(startOfQuiz: switchScreen)
            //     : QuestionScreen(
            //         onSelectedAnswer: chooseAnswer,
            //       ),
            ),
      ),
    );
  }
}
