
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controlles/question_controller.dart';
import 'package:quiz_app/screen/quiz/compontes/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     QuestionController _controller = Get .put (QuestionController());  
     return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar (
       // Fluttter show the back button automatically
       backgroundColor: Colors.transparent,
       elevation: 0,
       actions: [
         FlatButton(onPressed: _controller.nextQuestion, child: Text('Skip'))
       ],
      ),
      body: Body() ,
    );
  }
}