import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kdict/service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeLocalNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
       appBar: AppBar(
         title: const Text('KDict'),
       ),
       body: const Center(
         child: Text('For Kannada Learners'),
       ),
     ),
    );
  }
}

void initializeLocalNotifications() async {
  final localNotificationsPlugin = FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');
  InitializationSettings initializationSettings =
      const InitializationSettings(android: initializationSettingsAndroid);
  await localNotificationsPlugin.initialize(initializationSettings);
  final Service service = Service();
  await service.initializeNotifications();
  await service.fetchWordOfTheDay();
}