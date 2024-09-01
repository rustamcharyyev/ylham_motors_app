import 'package:flutter/material.dart';
import 'package:ylham_motors/l10n/l10n.dart';
import 'package:ylham_motors/profile/profile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.profile),
      ),
      body: const ProfileContent(),
    );
  }
}
