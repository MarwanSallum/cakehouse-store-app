import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  bool get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  late bool _hasConnection;

  Future<NetworkInfoImpl> init() async{
    _hasConnection = await  InternetConnectionChecker().hasConnection;
    return this;
  }

  @override
  bool get isConnected =>  _hasConnection;
}
