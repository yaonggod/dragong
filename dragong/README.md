# DRAGONG	

## 1023

안드로이드 키 해시 가지고오기

```bash
keytool -exportcert -alias androiddebugkey -keystore  ~/.android/debug.keystore -storepass android -keypass android 
| openssl sha1 -binary | openssl base64
```

