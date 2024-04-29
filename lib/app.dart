import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloWorldProvider = Provider((_) => 'Hello world');

class QuantApp extends ConsumerWidget {
  const QuantApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('QuantWealth')),
        body: Center(
          child: Text(ref.read(helloWorldProvider)),
        ),
      ),
    );
  }
}
