import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:agrotics/main.dart';
import 'package:agrotics/Util/check_internet_connection.dart';
class ConnectionStatusCubit extends Cubit<ConnectionStatus> {
  late StreamSubscription _connectionSubscription;

  ConnectionStatusCubit() : super(ConnectionStatus.online) {
    _connectionSubscription = internetChecker.internetStatus().listen(emit);
  }

  @override
  Future<void> close() {
    _connectionSubscription.cancel();
    return super.close();
  }
}