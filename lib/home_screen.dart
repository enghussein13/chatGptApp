import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mo_ai/shared/cubit/chat_gpt_cubit.dart';
import 'package:mo_ai/shared/cubit/chat_gpt_states.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ChatGptCubit, ChatGptStates>(
          listener: (context, state) {},
          builder: (context, state) {
            ChatGptCubit cubit = ChatGptCubit.get(context);
            return Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                elevation: 10,
                title: const Text('Mo Hussein ChatGPT'),
                leading: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset('assets/images/openai_logo.jpg'),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      scaffoldKey.currentState!
                          .showBottomSheet((context) => Container(
                              width: double.infinity,
                              color: Colors.grey[200],
                              padding: const EdgeInsets.all(20.0),
                              child: DropdownButton(
                                  value: cubit.dropDownSelected,
                                  onChanged: (value) {
                                    cubit.dropDownSelectedChange(value);
                                    //   dropDownSelected=value;
                                  },
                                  items: cubit.lista)));
                    },
                    icon: const Icon(Icons.more_vert_rounded),
                    color: Colors.white,
                  )
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: cubit.chats,
                    ),
                  ),
                  cubit.asking == true
                      ? const SpinKitThreeBounce(
                          color: Colors.white,
                          size: 20,
                        )
                      : Container(),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: const Color(0xFF444654),
                    height: 100,
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                          focusNode: FocusNode(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                          controller: cubit.chatController,
                          onSubmitted: (value) async {},
                          decoration: const InputDecoration.collapsed(
                              hintText: "  How can I help you",
                              hintStyle: TextStyle(color: Colors.white)),
                        )),
                        IconButton(
                            onPressed: () {
                              cubit.chatWithAi();
                            },
                            icon: const Icon(
                              Icons.send,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            );
          },
    );
  }
}
