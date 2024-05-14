import 'package:flutter/material.dart';
import 'package:quantwealth/app/theme/theme.dart';
import 'package:quantwealth/injectable.dart';
import 'package:quantwealth/ui/auth/cubit/auth_cubit.dart';
import 'package:quantwealth/ui/common/widgets/base_scaffold.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => getIt<AuthCubit>().logout(),
              child: Text(
                'Logout',
                style: fontB(20, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
