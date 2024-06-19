import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuestionSummary({super.key, required this.summaryData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map((data) {
          return Row(
            children: [
              Text(((data['question_index'] as int) + 1).toString()),
              Expanded(
                child: Column(
                  children: [
                    Text(data['question'] as String),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      data['correct_answer'] as String,
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(data['user_answer'] as String),
                  ],
                ),
              ),
            ],
          );
        }).toList()),
      ),
    );
  }
}
