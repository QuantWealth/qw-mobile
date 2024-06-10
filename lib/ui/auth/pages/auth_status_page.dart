import 'package:flutter/material.dart';
import 'package:quantwealth/ui/common/widgets/base_scaffold.dart';

class AuthStatusPage extends StatelessWidget {
  const AuthStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      bgImage: 'assets/images/qw_login_bg.png',
      body: Center(
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
      ),
    );
  }
}
