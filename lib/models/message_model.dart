import 'package:equatable/equatable.dart';

enum MessageType { sent, received }

class ChatMessage extends Equatable {
  final MessageType type;
  final String message;
  final DateTime time;

  const ChatMessage({required this.type, required this.message,required this.time,});

  @override
  List<Object?> get props => [type, message];
}