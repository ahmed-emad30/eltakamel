class LoginFormEntity {
  final String userName;
  final String password;
  final String language;
  LoginFormEntity( {
    required this.userName,
    required this.password,
     this.language = 'ar'
  });

  LoginFormEntity copyWith({
    String? email,
    String? password,
    String? language,
  }) {
    return LoginFormEntity(
      userName: email ?? this.userName,
      password: password ?? this.password,
      language: language ?? this.language,
    );
  }
  @override
  String toString() {

    return 'name: ${userName} password: ${password} language: ${language}';
  }

}