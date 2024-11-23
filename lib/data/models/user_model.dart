class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  // Factory method to create a User object from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
