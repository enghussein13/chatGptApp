import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

Widget customText(bool robot,String message)=>Padding(
  padding: const EdgeInsets.symmetric(horizontal: 8.0),
  child: Container(
    margin:const EdgeInsets.only(top: 10) ,
    padding: const EdgeInsets.all(10),
    color:const Color(0xFF444654) ,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Image.asset(robot==true?'assets/images/chat_logo.png'
              : 'assets/images/person.png',
            width: 30,
            height: 30,),
        ),
        Expanded(child: DefaultTextStyle(
          style: const TextStyle(
            fontSize:16
          ),
          child: AnimatedTextKit(
            totalRepeatCount: 1,
            //pause: const Duration(milliseconds: 3000),
            animatedTexts: [
              TyperAnimatedText(message)],),))],
    ),
  ),
);