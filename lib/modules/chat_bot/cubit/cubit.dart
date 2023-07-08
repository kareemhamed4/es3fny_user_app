import 'package:dio/dio.dart';
import 'package:es3fny_user_app/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBotCubit extends Cubit<List<ChatMessage>> {
  static ChatBotCubit get(context) => BlocProvider.of(context);
  final Dio _dio;
  final String chatbotApiUrl =
      'https://chatbot-production-912c.up.railway.app/chatbotApi';
  final ScrollController scrollController = ScrollController();

  ChatBotCubit()
      : _dio = Dio(),
        super([]);

  Future<void> sendMessage(String message) async {
    List<ChatMessage> updatedMessages =
    List<ChatMessage>.from(state)..add(ChatMessage(type: MessageType.sent, message: message,time: DateTime.now()));

    emit(updatedMessages);

    try {
      final response = await _dio.post(chatbotApiUrl, queryParameters: {'message': message});

      if (response.statusCode == 200) {
        String responseMessage = response.data['response'];
        updatedMessages = List<ChatMessage>.from(state)
          ..add(ChatMessage(type: MessageType.received, message: responseMessage,time: DateTime.now()));
        emit(updatedMessages);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollToEnd();
        });
      } else {
        throw Exception('Error connecting to the API');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  void _scrollToEnd() {
    if (scrollController.hasClients && scrollController.position.maxScrollExtent > 0) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }
}