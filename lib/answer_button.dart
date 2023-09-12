import 'package:flutter/material.dart';

class AnserButton extends StatelessWidget{

  AnserButton(this.Answer,this.ontap,{super.key});

  final String Answer;
  final Function() ontap;

  @override
  Widget build( context) {

    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
        backgroundColor: Color.fromARGB(255, 7, 130, 218),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
      ),
     child:  Text(Answer,
     textAlign: TextAlign.center,
     style: const TextStyle(
      color: Colors.white
     ),)
     );
    
  }
}