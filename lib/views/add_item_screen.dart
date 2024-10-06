import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/blocs/chat_bloc/chat_event.dart';
import 'package:flutter_task/blocs/chat_bloc/chat_state.dart';

import '../blocs/chat_bloc/chat_bloc.dart';

class AddItemScreen extends StatelessWidget {
  const AddItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chatBloc = BlocProvider.of<ChatBloc>(context);
    final TextEditingController chatFieldController = TextEditingController();
    final FocusNode chatFieldFocus = FocusNode();
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, 60),
        child: Container(
          padding: const EdgeInsets.only(top: 8),
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 80 / 1440),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: CircleAvatar(
              backgroundColor: const Color(0xFF171717),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Chat Test\nWebSocket",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: const EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 80 / 1440,
                  vertical: MediaQuery.sizeOf(context).width * 40 / 958),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
                    if (state is ChatInitial) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is ChatLoaded) {
                      return Expanded(
                        child: ListView.builder(
                            reverse: true,
                            controller: scrollController,
                            itemCount: state.messages.length,
                            itemBuilder: (context, index) {
                              return Text(
                                state.messages[index].content,
                                style: const TextStyle(color: Colors.white),
                              );
                            }),
                      );
                    }
                    return const Text(
                      "No Messages",
                      style: TextStyle(color: Colors.white),
                    );
                  }),
                  SizedBox(height: 16),
                  TextField(
                    controller: chatFieldController,
                    focusNode: chatFieldFocus,
                    onSubmitted: (text) {
                      chatBloc.add(SendMessage(text));
                      chatFieldController.clear();
                      chatFieldFocus.requestFocus();
                      scrollController
                          .jumpTo(scrollController.position.minScrollExtent);
                    },
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                        label: Text("Send Message"),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignInside)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignInside)),
                        labelStyle: TextStyle(color: Colors.white)),
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
