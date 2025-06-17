class UserModel {
  final int userId;
  final String name;
  final String email;
  final int roleId;
  // final DateTime createdDate;
  // final String token;

  UserModel(
    this.userId,
    this.name,
    this.email,
    this.roleId,
    // this.createdDate,
    // this.token,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json['user_id'],
      json['name'],
      json['email'],
      json['role_id'],
      // json['created_date'],
      // json['token'],
    );
  }
}
