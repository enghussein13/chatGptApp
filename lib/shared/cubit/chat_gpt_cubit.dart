import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mo_ai/shared/cubit/chat_gpt_states.dart';

import '../api_sevices.dart';
import '../components.dart';
import '../constant.dart';

class ChatGptCubit extends Cubit<ChatGptStates>{
  ChatGptCubit():super(ChatGptIntialState());
static ChatGptCubit get(context)=>BlocProvider.of(context);

  var models;
  List<DropdownMenuItem> ?lista=[];
  final TextEditingController chatController=TextEditingController();

  bool asking =false;
  bool robot = false;
  String msg='';
  List <Widget> chats=[Container()];
  String dropDownSelected='gpt-3.5-turbo';



  getModels()async{
    var res =await ApiServices.getRequest(modelsUrl);
    models=res['data'].map((e) => e['id']);
    models.forEach((item)=> lista!.add(DropdownMenuItem(value: item,
      child: Text('$item'),)));
    emit(ChatGptGetModelsState());

    //print(models.toList().runtimeType);
    //print(models.toList()[0]);





  }


  chatWithAi()async{
      msg=chatController.text;
      chatController.text='';
      chats.add(customText(robot, msg));
      emit(ChatGptRequestState());

    asking=true;
    var res =await ApiServices.postRequest(url, msg,dropDownSelected);

      robot=true;
      asking=false;
      msg=res['choices'][0]['message']['content'];
      chats.add(customText(robot, msg));
      robot=false;
      chatController.text='';
      emit(ChatGptResponseState());
  }

  dropDownSelectedChange(val){
    dropDownSelected=val;
    emit(DropDownSelectedChangeState());
  }










}