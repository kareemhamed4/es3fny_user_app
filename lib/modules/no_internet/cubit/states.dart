import 'package:equatable/equatable.dart';

class ConnectivityState extends Equatable {
  final bool isConnected;

  const ConnectivityState({required this.isConnected});

  @override
  List<Object?> get props => [isConnected];
}