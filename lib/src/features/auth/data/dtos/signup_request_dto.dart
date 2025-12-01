class SignUpRequestDto {
  final String username;
  final String password;

  final String emailAddress;
  final List<String> roles;

  SignUpRequestDto({
    required this.username,
    required this.password,
    required this.emailAddress,
    this.roles = const ['ROLE_FAMILY_MEMBER'],
  });

  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
    'emailAddress': emailAddress,
    'roles': roles,
  };
}
