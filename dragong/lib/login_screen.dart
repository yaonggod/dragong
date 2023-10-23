import 'package:dragong/kakao_login.dart';
import 'package:dragong/main_view_model.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final viewModel = MainViewModel(KakaoLogin());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('kakao login')),
        body: Center(
          child: Column(
            children: [
              viewModel.isLogined ? const Text('로그인 됨') : const Text('로그인 안됨'),
              ElevatedButton(
                  onPressed: () async {
                    await viewModel.login();
                    setState(() {});
                  },
                  child: const Text('로그인')),
              ElevatedButton(
                  onPressed: () async {
                    await viewModel.logout();
                    setState(() {});
                  },
                  child: const Text('로그아웃')),
            ],
          ),
        ));
  }
}
