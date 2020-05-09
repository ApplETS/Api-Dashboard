/// Represent a User of the dashboard
class User {
  final String uid;

  final String email;

  final UserRole role;

  String fullName;

  User({this.uid, this.email, this.role, this.fullName});

  factory User.fromJson(Map<String, dynamic> json) => User(
    uid: json['uid'],
    email: json['email'],
    role: _roleFromString(json['role']),
    fullName: json['fullname']
  );

  Map<String, dynamic> toJson() => {
    'uid': this.uid,
    'email': this.email,
    'role': this.role,
    'fullname': this.fullName
  };

  static UserRole _roleFromString(String value) {
    switch (value) {
      case 'ADMIN':
        return UserRole.ADMIN;
      default:
        return UserRole.USER;
    }
  }
}

/// Define the permission of the user
enum UserRole { ADMIN, USER }
