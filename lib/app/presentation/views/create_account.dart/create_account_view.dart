import 'package:alborada_demo/app/presentation/alborada_ui/alborada_ui.dart';
import 'package:alborada_demo/app/presentation/enums/enums.dart';
import 'package:alborada_demo/app/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cubit/create_account_cubit.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return AlboradaScaffoldWidget(
      body: BlocProvider(
        create: (context) => GetIt.I.get<CreateAccountCubit>(),
        child: _LoginBody(screenSize: screenSize),
      ),
    );
  }
}

class _LoginBody extends StatefulWidget {
  const _LoginBody({
    required this.screenSize,
  });

  final Size screenSize;

  @override
  State<_LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<_LoginBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSubmit(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text;
      final password = _passwordController.text;

      context.read<CreateAccountCubit>().createAccount(email, password);
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'The email is required';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Email format invalid';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'The password is required';
    }
    if (value.length < 6) {
      return 'The password should have minimum 6 charateheres';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'confirm your password';
    }
    if (value != _passwordController.text) {
      return 'The password should be equals';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateAccountCubit, CreateAccountState>(
      listener: (context, state) {
        state.whenOrNull(
          createAccountSuccess: (user, sucessType) {
            if (sucessType == SuccessType.accountAlreadyExists) {
              AlboradaSnackBar.of(context)
                  .warning('The email ${user.email} is alredy exist');
            }
            // TODO: Verify email before continue the onboarding
            if (sucessType == SuccessType.confirmEmail && user.id.isNotEmpty) {
              return Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.onboarding,
                (route) => false,
              );
            }
          },
          error: (error) =>
              AlboradaSnackBar.of(context).warning('Something went wrong'),
        );
      },
      builder: (context, state) => Padding(
        padding: edgeInsetsH25,
        child: SizedBox(
          height: widget.screenSize.height * 0.85,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: widget.screenSize.height * 0.1),
                const BackButton(),
                Text(
                  'Je créé mon compte',
                  style: GoogleFonts.openSans(
                      fontSize: 30, fontWeight: FontWeight.w500),
                ),
                CustomTextField(
                  readOnly: state.isLoading,
                  textEditingController: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validatorText: _validateEmail,
                  hintText: 'Adresse e-mail',
                  onChanged: (value) {
                    _validateEmail(value);
                  },
                ),
                SizedBox(height: widget.screenSize.height * 0.01),
                CustomTextField(
                  readOnly: state.isLoading,
                  textEditingController: _passwordController,
                  obscureText: !_passwordVisible,
                  hintText: 'Mot de passe',
                  maxLines: 1,
                  validatorText: _validatePassword,
                  icon: IconButton(
                    icon: Icon(_passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  onChanged: (value) {},
                ),
                SizedBox(height: widget.screenSize.height * 0.01),
                CustomTextField(
                  readOnly: state.isLoading,
                  textEditingController: _confirmPasswordController,
                  obscureText: !_confirmPasswordVisible,
                  hintText: 'Confirmer le mot de passe',
                  maxLines: 1,
                  validatorText: _validateConfirmPassword,
                  icon: IconButton(
                    icon: Icon(_confirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _confirmPasswordVisible = !_confirmPasswordVisible;
                      });
                    },
                  ),
                  onChanged: (value) {},
                ),
                gap20,
                SimpleButton(
                  isLoading: state.isLoading,
                  text: 'Créer un compte',
                  isDarkButton: true,
                  onPressed: () => _onSubmit(context),
                ),
                Text(
                  'En cliquant sur “Créer un compte, vous acceptez les conditions d’utilisation d’Alborada.',
                  style: GoogleFonts.outfit(fontSize: 16),
                ),
                const Spacer(),
                _LoginTextButton(state.isLoading),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginTextButton extends StatelessWidget {
  const _LoginTextButton(this.isLoading);
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    void goTo(String route) {
      // Navigator.pushNamedAndRemoveUntil(
      //   context,
      //   route,
      //   (r) => false,
      // );
      Navigator.popAndPushNamed(
        context,
        route,
      );
    }

    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            'Tu as déjà un compte ?',
            style: GoogleFonts.outfit(fontSize: 16),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () => goTo(Routes.login),
            child: Text(
              'Je me connecte',
              style: GoogleFonts.outfit(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
