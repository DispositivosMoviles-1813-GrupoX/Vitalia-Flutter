import 'session_storage.dart';

class InMemorySessionStorage implements SessionStorage {
  static final InMemorySessionStorage _instance = InMemorySessionStorage._();

  factory InMemorySessionStorage() => _instance;

  InMemorySessionStorage._();

  String? _accessToken;
  String? _refreshToken;

  @override
  Future<void> saveToken(String accessToken, String refreshToken) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
  }

  @override
  Future<String?> getAccessToken() async {
    return _accessToken;
  }

  @override
  Future<String?> getRefreshToken() async {
    return _refreshToken;
  }

  @override
  Future<void> clearSession() async {
    _accessToken = null;
    _refreshToken = null;
  }
}
