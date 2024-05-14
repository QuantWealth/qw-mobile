import 'package:flutter/material.dart';
import 'package:quantwealth/ui/common/widgets/base_scaffold.dart';

class AuthStatusPage extends StatelessWidget {
  const AuthStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
