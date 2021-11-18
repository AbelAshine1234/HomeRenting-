import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:home_renting_app/chat/bloc/chat/chat_event.dart';
import 'package:home_renting_app/chat/bloc/chat/chat_state.dart';
import 'package:home_renting_app/chat/models/ChatModel.dart';
import 'package:home_renting_app/chat/models/MessageModel.dart';
import 'package:home_renting_app/chat/repository/chat-repository.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository chatRepository;
  ChatBloc({required this.chatRepository}) : super(ChatInitial());

  @override
  Stream<ChatState> mapEventToState(
    ChatEvent event,
  ) async* {
    if (event is CreateChat) {
      try {
        await chatRepository.create(event.chatModel);
        yield ChatCreated();
      } catch (e) {
        yield ChatCreateFailed(Exception(e));
      }
    }
    if (event is LoadChats) {
      yield ChatsLoading();
      try {
        print("loadchats chat repository");
        var chats = await chatRepository.loadChats();
        yield ChatLoaded(chats);
      } catch (e) {
        yield ChatLoadFailed(Exception(e));
      }
    }
  }
}