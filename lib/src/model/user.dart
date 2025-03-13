class Users {
  final List<User> users;

  const Users({required this.users});

  factory Users.fromList(List list) {
    return Users(
      users: list.map((e) => User.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'users': users};
  }

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(users: json['users'] as List<User>);
  }
}

class User {
  final String id;
  final String title;
  final String organizationId;
  final String email;
  final String? parentId;

  const User({
    required this.id,
    required this.title,
    required this.organizationId,
    required this.email,
    this.parentId,
  });

  factory User.init() {
    return const User(id: '', title: '', organizationId: '', email: '');
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'organizationId': organizationId,
      'email': email,
      'parentId': parentId,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      title: json['title'] as String,
      organizationId: json['organizationId'] as String,
      email: json['email'] as String,
      parentId: json['parentId'] as String?,
    );
  }
}
