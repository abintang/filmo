import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheSessionId(String sessionId);
  Future<String?> getSessionId();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  static const cachedSession = 'CACHED_SESSION_ID';

  @override
  Future<void> cacheSessionId(String sessionId) {
    return sharedPreferences.setString(cachedSession, sessionId);
  }

  @override
  Future<String?> getSessionId() {
    final sessionId = sharedPreferences.getString(cachedSession);
    if (sessionId != null) {
      return Future.value(sessionId);
    } else {
      throw Exception("Failed to get Session");
    }
  }
}
