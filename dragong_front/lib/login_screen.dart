import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogined = false;

  Future<bool> naverLogin() async {
    try {
      final NaverLoginResult result = await FlutterNaverLogin.logIn();

      NaverAccessToken token = await FlutterNaverLogin.currentAccessToken;
      // Naver 인증 서버에 접근하는 AT를 백엔드에 보내기
      print(token.accessToken);
      // 만약 백엔드에서 AT로 인증하는 과정을 간소화하고 싶으면 이메일만 보내서 토큰 발급하기
      // print(result.account.email);
      setState(() {
        isLogined = true;
      });
      return true;
    } catch (err) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('네이버 로그인')),
      body: Column(
        children: [
          isLogined ? const Text('로그인됨') : const Text('로그인안됨'),
          ElevatedButton(onPressed: naverLogin, child: const Text('네이버 로그인'))
        ],
      ),
    );
  }
}
