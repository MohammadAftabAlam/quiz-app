import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuestionSummary({super.key, required this.summaryData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                // Text(((data['question_index'] as int) + 1).toString()),
                Container(
                  margin: const EdgeInsets.only(right: 10, bottom: 20),
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 37, 181, 203)),
                  child: Center(
                    child: TextWidget(
                        text: ((data['question_index'] as int) + 1).toString(),
                        textColor: const Color.fromARGB(255, 67, 66, 66)),
                  ),
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(data['question'] as String),
                      const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                          text: data['question'] as String,
                          textColor: const Color.fromARGB(255, 199, 151, 6)),
                      const SizedBox(
                        height: 5,
                      ),
                      TextWidget(
                        text: data['correct_answer'] as String,
                        textColor: const Color.fromARGB(255, 51, 163, 68),
                      ),
                      // Text(data['user_answer'] as String),
                      TextWidget(
                          text: data['user_answer'] as String,
                          textColor: Colors.lightBlueAccent)
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  const TextWidget({super.key, required this.text, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: textColor, fontSize: 16),
    );
  }
}
