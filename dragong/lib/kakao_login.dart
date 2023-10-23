import 'package:dragong/social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLogin implements SocialLogin {
  @override
  Future<bool> login() async {
    try {
      // 카카오톡 설치 여부 확인
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        // 그러면 카톡으로 로그인혀
        try {
          await UserApi.instance.loginWithKakaoTalk();
          return true;
        } catch (err) {
          print('1');
          return false;
        }
      } else {
        // 없으면 카카오계정으로 로그인혀
        try {
          OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
          print('AT: ${token.accessToken}');
          print('RT: ${token.refreshToken}');
          return true;
        } catch (err) {
          print('2');
          return false;
        }
      }
    } catch (err) {
      print('3');
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      return true;
    } catch (err) {
      return false;
    }
  }
}
