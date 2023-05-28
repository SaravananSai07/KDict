import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kdict/models/item.dart';


class Service {
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initializeNotifications() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('app_icon');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);
    await _localNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> fetchWordOfTheDay() async {
      List<Definition> definitions = [];
      Definition definition = Definition(122343, 'an indeclinable termination to verbs to add politeness in addressing (ನೋಡು>ನೋಡ, ನೋಡಾ) the second person in singular number.', 'independent clause');
      definitions.add(definition);
      Item item = Item('1223', 'ಅ', 'ಅ', 'a', '', '', definitions);
      showWordOfTheDayNotification(item);
  }

  void showWordOfTheDayNotification(Item item) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      'channel_description',
      importance: Importance.high,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await _localNotificationsPlugin.show(
      0,
      'Word of the Day: ${item.head}',
      'Definition: ${item.definitions[0].entry}',
      platformChannelSpecifics,
    );
  }

}