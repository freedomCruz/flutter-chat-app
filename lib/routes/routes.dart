import 'package:chat_app/pages/pages.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function (BuildContext)> appRoutes = {

  'chat'   : (_) => const ChatPage(),
  'loading': (_) => const LoadingPage(),
  'login'  : (_) => const LoginPage(),
  'signup' : (_) => const SignupPage(),
  'user'   : (_) => const UsersPage(),
  
};