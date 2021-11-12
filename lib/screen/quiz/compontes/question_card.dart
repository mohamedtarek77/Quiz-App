import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controlles/question_controller.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/screen/quiz/compontes/option.dart';

class QuestionCard extends StatelessWidget {
    const QuestionCard({
    Key key,
    // it means we have to pass this
    @required this.question,
  }) : super(key: key);

  final Question question;
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put (QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(color: kGrayColor),
          ),
          SizedBox( height: kDefaultPadding/2,),
          ...List.generate(
            question.options.length,
            (index) => Option(
              index : index,
              text : question.options[index],
              press: ()=> _controller.checkAns(question, index),
            )

          )

        ],
      ),
      
    );
  }
}