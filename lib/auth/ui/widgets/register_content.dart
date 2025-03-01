import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:ylham_motors/auth/auth.dart';
import 'package:ylham_motors/l10n/l10n.dart';

class RegisterContent extends StatelessWidget {
  const RegisterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        /// Phone Input
        BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            final readOnly = state.status.isInProgress;

            return PhoneInput(
              readOnly: readOnly,
              onChanged: (phone) =>
                  context.read<RegisterBloc>().add(RegisterPhoneChanged(phone)),
            );
          },
        ),

        const SizedBox(height: AppSpacing.md),

        /// Name Input
        BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            final readOnly = state.status.isInProgress;

            return UsernameInput(
              readOnly: readOnly,
              onChanged: (username) => context
                  .read<RegisterBloc>()
                  .add(RegisterUsernameChanged(username)),
            );
          },
        ),

        const SizedBox(height: AppSpacing.md),

        /// Surname Input
        BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            final readOnly = state.status.isInProgress;

            return SurnameInput(
              readOnly: readOnly,
              onChanged: (surname) => context
                  .read<RegisterBloc>()
                  .add(RegisterSurnameChanged(surname)),
            );
          },
        ),

        const SizedBox(height: AppSpacing.md),

        /// Email Input
        BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            final readOnly = state.status.isInProgress;

            return EmailInput(
              readOnly: readOnly,
              onChanged: (email) =>
                  context.read<RegisterBloc>().add(RegisterEmailChanged(email)),
            );
          },
        ),

        const SizedBox(height: AppSpacing.md),

        /// Next button
        NextButton(
          onPressed: () =>
              context.read<RegisterBloc>().add(RegisterSubmitted()),
        ),
      ],
    );
  }
}

class AuthDialog extends StatefulWidget {
  const AuthDialog({super.key});

  @override
  State<AuthDialog> createState() => _AuthDialogState();
}

class _AuthDialogState extends State<AuthDialog> {
  Future<void> _authenticate() async {
    Navigator.of(context).push(AuthPage.route());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.authRequired),
      content: Text(
        context.l10n.authRequiredDescription,
        style: TextStyle(fontSize: 14),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(context.l10n.cancel),
        ),
        ElevatedButton(
          onPressed: _authenticate,
          child: Text(context.l10n.login),
        ),
      ],
    );
  }
}
