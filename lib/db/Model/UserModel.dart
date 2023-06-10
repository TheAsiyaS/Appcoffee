class User {
 
  final String username;
  final String password;

  User({ required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {
     
      'username': username,
      'password': password,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
    
      username: map['username'],
      password: map['password'],
    );
  }
}
