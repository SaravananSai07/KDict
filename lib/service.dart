import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class Service {
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initializeNotifications() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('app_icon');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);
    await _localNotificationsPlugin.initialize(initializationSettings);
  }

  

}