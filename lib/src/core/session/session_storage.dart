abstract class SessionStorage {
  Future<void> saveToken(String accessToken, String refreshToken);
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> clearSession();
}
