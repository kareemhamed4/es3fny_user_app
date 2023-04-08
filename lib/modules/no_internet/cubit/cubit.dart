import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:es3fny_user_app/modules/no_internet/cubit/states.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  final Connectivity _connectivity;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  ConnectivityCubit({required Connectivity connectivity})
      : _connectivity = connectivity,
        super(const ConnectivityState(isConnected: true)) {
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      emit(ConnectivityState(isConnected: result != ConnectivityResult.none));
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}