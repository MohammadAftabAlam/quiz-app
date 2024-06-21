import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';
// import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  final List<String> choosenAnswers;
  final VoidCallback onRestart;
  const ResultScreen(
      {super.key, required this.choosenAnswers, required this.onRestart});

  List<Map<String, Object>> getSummaryList() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': QuestionsArray.questions[i].text,
        'correct_answer': QuestionsArray.questions[i].answer[0],
        'user_answer': choosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryList();
    final numTotalQuestion = QuestionsArray.questions.length;

    /* where((){}) returns bool value. It iterates throught the Iterable types such as map,list,set  and creates a new collection based on the condition written after return statement */
    final numCorrectQuestion = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    /* length property is used because it is collection type and i have to return a concrete value */

    return SizedBox(
      width: double.infinity,
      child: Container(
        // margin: const EdgeInsets.only(top: 40, right: 40, left: 40),
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              "You answered $numCorrectQuestion out of $numTotalQuestion questions correctly",
              style: TextStyle(fontSize: 20, color: Colors.amber),
            ),

            // Text.rich(
            //   TextSpan(
            //     text: "You answered ",
            //     children: <InlineSpan>[
            //       TextSpan(
            //         text: "$numCorrectQuestion",
            //         style: TextStyle(
            //           fontSize: 20,
            //           color:
            //               numCorrectQuestion >= 3 ? Colors.green : Colors.red,
            //         ),
            //       ),
            //       TextSpan(text: " out of "),
            //       TextSpan(text: "$numTotalQuestion ",
            //         style: TextStyle(
            //           fontSize: 20,
            //           color:
            //               numCorrectQuestion >= 3 ? Colors.green : Colors.red,
            //         ),
            //       ),
            //       TextSpan(text: "questions correctly"),
            //     ],
            //   ),
            // ),

            const SizedBox(
              height: 30,
            ),
            // Container(
            //   height: 600,
            //   // child: ListView.builder(
            //   //   itemCount: choosenAnswers.length,
            //   //   itemBuilder: (context, index) {
            //   //     return ListTile(
            //   //       leading: Text(""),
            //   //     );
            //   //   },
            //   // ),
            //   child: QuestionSummary(
            //       summaryData:
            //           summaryData /*SummaryData variable has created below the build method*/),
            // ),
            QuestionSummary(
              summaryData:
                  summaryData, /*SummaryData variable has created below the build method*/
            ),

            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: () {
                onRestart();
              },
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              label: const Text(
                "Restart Quiz",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
