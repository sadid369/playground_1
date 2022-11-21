import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playground_1/main.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});
  void onChg(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateName(value);
  }

  void onChgAge(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateNameAge(int.parse(value));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onSubmitted: (value) {
              onChg(ref, value);
            },
          ),
          TextField(
            onSubmitted: (value) {
              onChgAge(ref, value);
            },
          ),
          Center(
            child: Text(user.age.toString()),
          ),
        ],
      ),
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
