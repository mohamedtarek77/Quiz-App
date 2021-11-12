
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/screen/score/score_screen.dart';
class QuestionController extends GetxController 
// We use get package for our state management

  with SingleGetTickerProviderMixin {
// Lets animated our progress bar
AnimationController  _animationController ;
Animation _animation;
// so that we can access our animation outside

Animation get animation => this._animation;
PageController _pageController ;
PageController get  pageController => this._pageController;

List <Question> _questions = sample_data
 .map(
   (question) => Question (
       id: question['id'],
       question: question['question'],
       options: question['options'],
       answer: question['answer_index']),
       )
       .toList();
List get questions  => this._questions;

bool _isAnswered = false ;
bool get isAnswered => this._isAnswered;

int _correctAns;
int get correctAns => this._correctAns;

int _selectedAns;
int get selectedAns => this._selectedAns;

// for more about obs please check documentation

RxInt _questionNumber =1.obs;
RxInt get questionNumber => _questionNumber ;

int _numOfCorrectAns = 0;
int get numOfCorrectAns => _numOfCorrectAns ;

  // called immediately after the widget is allocated memory


@override 
void onInit (){
  // Our animation duration is 60 s
  // so our plan is to fill the progress bar within 60s
  _animationController =
  AnimationController (duration: Duration(seconds: 60),vsync: this);
  _animation = Tween<double>(begin: 0 ,end: 1).animate(_animationController)
  ..addListener(() {
    update();
    // update like setState

  });
   // start our animation
    // Once 60s is completed go to the next qn
  _animationController .forward().whenComplete(nextQuestion);
  _pageController = PageController();
  super.onInit();
}

@override

void onClose (){
  _animationController.dispose();
  pageController.dispose();
  }

  void checkAns ( Question question , int selectedIndex ){
    // because once user press any option then it will run
    _isAnswered = true ;
    _correctAns = question.answer;
    _selectedAns = selectedIndex ;
    
    if (_correctAns ==_selectedAns)  _numOfCorrectAns++;
    // It will stop the counter
     _animationController.stop();
     update();
    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(Duration(seconds: 3),(){
     nextQuestion();
    });
    
  }
  void nextQuestion (){
    if (_questionNumber.value != _questions.length){
      _isAnswered =false ;
      _pageController.nextPage(
        duration: Duration (microseconds: 250), curve: Curves.ease);
              // Reset the counter
       _animationController.reset();
       // Then start it again
      // Once timer is finish go to the next qn
      _animationController.forward().whenComplete(nextQuestion);
    } else {
            // Get package provide us simple way to naviigate another page
       Get.to(ScoreScreen());
    }
  }
void  updateTheQnNum (int index){
  _questionNumber.value = index+1;

}
}