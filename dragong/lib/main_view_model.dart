import 'package:dragong/social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class MainViewModel {
  final SocialLogin _socialLogin;
  bool isLogined = false;

  // 카카오에서 제공하는 user클래스
  User? user;

  MainViewModel(this._socialLogin);

  Future login() async {
    isLogined = await _socialLogin.login();
    // 로그인 성공했으면
    if (isLogined) {
      // 유저 정보를 갖고옵니다
      user = await UserApi.instance.me();
    }
  }

  Future logout() async {
    await _socialLogin.logout();
    isLogined = false;
    user = null;
  }
}
