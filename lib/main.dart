import 'package:chat_app/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      initialRoute: 'chat',
      routes: appRoutes,


      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            shape: const StadiumBorder(),
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: Colors.blue,
            textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)
          ), 
        )
      ),

    );
  
  }

}