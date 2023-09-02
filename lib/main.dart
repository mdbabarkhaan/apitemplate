import 'package:flutter/material.dart';
import 'package:apitemplate/providers/home_provider.dart';
import 'package:apitemplate/resources/app_local.dart';
import 'package:apitemplate/views/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLocal.instance.initStorage();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: HomeProvider())
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  HomeScreen(),
    );
  }
}
