import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfo {
  InternetConnectionChecker connectionChecker;
  NetworkInfo({required this.connectionChecker});
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
