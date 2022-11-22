import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playground_1/main.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(fetchUserProvider).when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            title: Text(data.name),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(data.email),
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return Scaffold(
            appBar: AppBar(
              title: Text(error.toString()),
            ),
            body: Center(
              child: Text(error.toString()),
            ));
      },
      loading: () {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Title'),
          ),
          body: const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(''),
//       ),
//       body: Consumer(builder: (context, ref, child) {
//         return Column(
//           children: [Center(child: Text(ref.read(nameProvider)))],
//         );
//       }),
//     );
//   }
// }
