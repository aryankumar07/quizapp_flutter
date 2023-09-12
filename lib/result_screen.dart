import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/question_summary.dart';

class ResultScreen extends StatelessWidget {

  ResultScreen(this.choosenAnswer,{super.key});

  List<String> choosenAnswer ;

  List<Map<String,Object>> getSummary(){
     List<Map<String,Object>> summary = [];

    for (var i=0;i<choosenAnswer.length;i++){
      summary.add({
        "question_index":i,
        "question":questions[i].text,
        "correct_answer":questions[i].answers[0],
        "user_answer":choosenAnswer[i],
      });
    }

     return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummary();
    final numTotalQuestion = questions.length;
    final numCorrectionQuestion = summaryData.where((data) {
      return data["user_answer"] == data["correct_answer"];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You answered $numCorrectionQuestion out of $numTotalQuestion provided"),
            SizedBox(height: 30,),
            QuestionSummary(summaryData),
            SizedBox(height: 30,),
            TextButton(
              onPressed: () {},
             child: Text("Reset"))
          ],
        )));
  }
}
