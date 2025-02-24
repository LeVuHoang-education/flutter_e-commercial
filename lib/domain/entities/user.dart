class UserEntity {
  final String email;
  final String username;
  final String phone;
  final String roleName;
  final int? id;

  UserEntity({
    required this.email,
    required this.username,
    required this.phone,
    required this.roleName,
    this.id
  });
}