import 'package:flutter/material.dart';
import 'package:ylham_motors/l10n/l10n.dart';
import 'package:ylham_motors/masters/masters.dart';

class MastersPage extends StatelessWidget {
  const MastersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.masters),
      ),
      body: const MastersListView(),
    );
  }
}
