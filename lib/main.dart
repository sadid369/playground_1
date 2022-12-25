import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playground_1/home_screen.dart';
import 'package:playground_1/user.dart';
import 'package:http/http.dart' as http;
// final nameProvider = Provider<String>(
//   (ref) => "Sadid",
// );
// final nameProvider = StateProvider<String?>(
//   (ref) => null,
// );
// final userProvider = StateNotifierProvider<UserNotifier, User>(
//   (ref) => UserNotifier(),
// );

final fetchUserProvider = FutureProvider(
  (ref) {
    final userRepository = ref.watch(userRepositoryProvider);
    return userRepository.fetchData();
  },
);
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
