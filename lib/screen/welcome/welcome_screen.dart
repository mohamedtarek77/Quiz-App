
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screen/quiz/quiz_screen.dart';
import '../../constants.dart';
class WelcomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          body: Stack(
            children: [
              SvgPicture.asset('assets/icons/home.svg', fit: BoxFit.fill),
              SafeArea(
                child: Padding(
                  padding:EdgeInsets.symmetric( horizontal: kDefaultPadding ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(flex:2),
                      Text(
                        "let's play a quiz",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold
                        ),
                      ),
                      Text ("Enter your informations below"),
                      Spacer(),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF1C2341),
                          hintText: 'full name',
                          border: OutlineInputBorder (
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap:()=> Get.to(QuizScreen()),
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(kDefaultPadding * 0.75),
                          decoration: BoxDecoration(
                            gradient:  kPrimaryGradient,
                             borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Text(
                            'lets start Quiz',
                            style: Theme.of(context)
                            . textTheme
                            .button
                            .copyWith(color: Colors.black)
                            ,
                          ),
                        ),
                      ),
                     Spacer(flex: 2,),
                    ],
                  ),
            ))
        ],),
      
    );
  }
}