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
      safeArea: true,
      extendBodyBehindAppBar: false,
      isCenterTitle: true,
      titleWidget: Text(
        'Profile',
        style: fontSB(24),
      ),
      suffix: [
        IconButton(
          icon: Icon(Icons.logout_sharp),
          onPressed: () => getIt<AuthCubit>().logout(),
        ),
      ],
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white.withOpacity(.3),
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 55,
                  ),
                ),
                SizedBox(height: 10),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'John Doe',
                        style: fontSB(20),
                        textAlign: TextAlign.center,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.qr_code_2_sharp,
                          size: 30,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  subtitle: Text(
                    '0x1234567890abcdef',
                    style: fontM(16, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
                // TextButton(
                //   onPressed: () {},
                //   child: Text(
                //     'Refer a friend',
                //     style: fontSB(14, color: Colors.white),
                //   ),
                // ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: Text(
                    'Edit Profile',
                    style: fontSB(14, color: Colors.black),
                  ),
                )
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 10,
            ),
            itemCount: settings.length,
            itemBuilder: (context, index) {
              final key = settings.keys.elementAt(index);
              final value = settings[key];

              return SettingTile(
                title: key,
                subtitle: value,
                onTap: () {},
              );
            },
          ),
        ],
      ),
    );
  }
}

final settings = Map<String, String>.fromIterables(
  [
    'Risk Profile',
    'Investment Horizon',
    'Investment Amount',
    'Investment Goal',
    'Investment Strategy',
    'Contact Support',
    'Privacy Policy',
    'Terms of Service',
    'About Us',
  ],
  [
    'Conservative',
    'Long Term',
    '\$10,000',
    '\$1,00,000',
    'Dollar Cost Averaging',
    'Have a question? Contact us',
    'Read our privacy policy',
    'Read our terms of service',
    'Learn more about us',
  ],
);

class SettingTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Function()? onTap;

  const SettingTile({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 6),
      title: Text(
        title,
        style: fontM(16),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: fontM(16, color: Colors.grey),
            )
          : null,
      trailing: Icon(
        icon ?? Icons.keyboard_arrow_right,
        color: Colors.white,
      ),
    );
  }
}
