import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogined = false;
  String? nickname;

  Future<bool> naverLogin() async {
    final NaverLoginResult result = await FlutterNaverLogin.logIn();
    NaverAccessToken token = await FlutterNaverLogin.currentAccessToken;
    print(token.accessToken);
    print(token.refreshToken);
    print(result.account.email);
    setState(() {
      nickname = result.account.nickname;
      isLogined = true;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('네이버 로그인')),
      body: Column(
        children: [
          nickname != null ? Text(nickname!) : const Text('정보 없음'),
          isLogined ? const Text('로그인됨') : const Text('로그인안됨'),
          ElevatedButton(onPressed: naverLogin, child: const Text('네이버 로그인'))
        ],
      ),
    );
  }
}
