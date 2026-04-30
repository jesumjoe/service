class Staff {
  final String id;
  final String authId;
  final String name;
  final String role;

  Staff({
    required this.id,
    required this.authId,
    required this.name,
    required this.role,
  });

  factory Staff.fromJson(Map<String, dynamic> json) {
    return Staff(
      id: json['id'] as String,
      authId: json['auth_id'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'auth_id': authId, 'name': name, 'role': role};
  }
}
