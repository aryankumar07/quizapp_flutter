import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/start_screen.dart';
import 'package:quizapp/question.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/result_screen.dart';


class Quiz extends StatefulWidget{

  Quiz({super.key});

  

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{

  List<String> selectedAnswer = [];

  Widget? activeScreen ;

  @override
  void initState() {
    super.initState();
    activeScreen =  StartScreen(switchScreen);

  }
  
  void chooseAnswer(String answer){
    selectedAnswer.add(answer);

  if (selectedAnswer.length==questions.length){
    setState(() {
      activeScreen = ResultScreen(selectedAnswer);
    });
  }

  }


  void switchScreen(){
   setState(() {
     activeScreen = QuestionScreen(chooseAnswer);
   }); 
  }

  



  @override
  Widget build(context) {

    return MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors:[
               Color.fromARGB(255, 113, 36, 247),
               Color.fromARGB(255, 47, 14, 104),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        child: activeScreen
        ),
    ),
  );
  }


}
