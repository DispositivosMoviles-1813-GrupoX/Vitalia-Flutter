class SignUpRequestDto {
  final String username;
  final String password;

  final List<String> roles = const ['ROLE_USER'];

  SignUpRequestDto({
    required this.username,
    required this.password,

  });

  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
    'roles': roles,
  };
}
