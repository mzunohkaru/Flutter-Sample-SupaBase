// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:supabase_sample/pages/chat_page.dart';
import 'package:supabase_sample/pages/register_page.dart';
import 'package:supabase_sample/utils/constants.dart';

/// ログイン状態に応じてユーザーをリダイレクトするページ
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});


  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    // widgetがmountするのを待つ
    await Future.delayed(Duration.zero);

    /// ログイン状態に応じて適切なページにリダイレクト
    final session = supabase.auth.currentSession;
    if (session == null) {
      Navigator.of(context)
          .pushAndRemoveUntil(RegisterPage.route(), (route) => false);
    } else {
      Navigator.of(context)
          .pushAndRemoveUntil(ChatPage.route(), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: preloader);
  }
}