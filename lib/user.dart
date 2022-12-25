import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

@immutable
class User {
  final String name;
  final String email;
  const User({
    required this.name,
    required this.email,
  });

  User copyWith({
    String? name,
    String? email,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(name: $name, email: $email)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.name == name && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}

// class UserNotifier extends StateNotifier<User> {
//   UserNotifier()
//       : super(
//           const User(name: "", age: 0),
//         );

//   void updateName(String n) {
//     state = state.copyWith(name: n);
//   }

//   void updateNameAge(int a) {
//     state = state.copyWith(age: a);
//   }
// }
final userRepositoryProvider = Provider(
  (ref) {
    return UserRepository();
  },
);

class UserRepository {
  Future<User> fetchData() {
    const url = 'https://jsonplaceholder.typicode.com/users/1';
    return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
  }
}
