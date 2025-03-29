import 'package:alborada_demo/app/presentation/alborada_ui/alborada_ui.dart';
import 'package:alborada_demo/app/presentation/enums/enums.dart';
import 'package:alborada_demo/app/presentation/routes/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cubit/create_account_cubit.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return AlboradaScaffoldWidget(
      body: BlocProvider(
        create: (context) => GetIt.I.get<CreateAccountCubit>(),
        child: _LoginBody(),
      ),
    );
  }
}

class _LoginBody extends StatefulWidget {
  const _LoginBody();

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
  bool _isCheckboxSelected = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onSubmit(BuildContext context) {
    if (_enableButton()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      context.read<CreateAccountCubit>().createAccount(email, password);
    }
  }

  bool _enableButton() {
    final formCompleted = _formKey.currentState?.validate() ?? false;
    if (formCompleted && _isCheckboxSelected) return true;
    return false;
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
          createAccountSuccess: (user, sucessType, checkbox) async {
            if (sucessType == LoginType.accountAlreadyExists) {
              AlboradaSnackBar.of(context).warning('The email alredy exist');
            }
            if (sucessType == LoginType.confirmEmail) {
              print('CONFIRM EMAIL');
              CustomDialog.show(
                context: context,
                info:
                    'Confirm your registered email address in your inbox to log in',
                textButton: 'Ok',
                navigateTo: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.login,
                  (route) => false,
                ),
              );
            }
          },
          error: (error) =>
              AlboradaSnackBar.of(context).warning('Something went wrong'),
        );
      },
      builder: (context, state) {
        final screenSize = MediaQuery.sizeOf(context);
        return Padding(
          padding: edgeInsetsH25,
          child: SizedBox(
            width: screenSize.width * 0.9,
            height: screenSize.height * 0.9,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenSize.height * 0.1),
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
                      setState(() {
                        _enableButton();
                      });
                    },
                  ),
                  SizedBox(height: screenSize.height * 0.01),
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
                    onChanged: (value) {
                      print('Mot de passe');
                      setState(() {
                        _enableButton();
                      });
                    },
                  ),
                  SizedBox(height: screenSize.height * 0.01),
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
                    onChanged: (value) {
                      print('Confirmer le mot de passe');
                      setState(() {
                        print(_enableButton());
                      });
                    },
                  ),
                  gap20,
                  _TermsAndConditions(
                    value: _isCheckboxSelected,
                    onChanged: (a) {
                      setState(() {
                        _isCheckboxSelected = a ?? false;
                      });
                    },
                  ),
                  gap20,
                  SimpleButton(
                    isLoading: state.isLoading,
                    text: 'Créer un compte',
                    buttonColor:
                        _enableButton() ? Palette.black : Palette.grey1,
                    textColor: _enableButton() ? Palette.white : Palette.grey2,
                    onPressed: () =>
                        _enableButton() ? _onSubmit(context) : () {},
                  ),
                  const Spacer(),
                  _LoginTextButton(state.isLoading),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _LoginTextButton extends StatelessWidget {
  const _LoginTextButton(this.isLoading);
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    void goTo(String route) {
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
                color: Palette.yellow100,
                decorationColor: Palette.yellow100,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TermsAndConditions extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const _TermsAndConditions({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          checkColor: Palette.yellow100,
          activeColor: Colors.black87,
          onChanged: onChanged,
        ),
        Flexible(
            child: RichText(
                text: TextSpan(
                    text: 'He leído y acepto los ',
                    style: GoogleFonts.outfit(
                      fontSize: 16,
                      color: Palette.black,
                    ),
                    children: [
              TextSpan(
                text: 'Términos y Condiciones',
                style: GoogleFonts.outfit(
                  fontSize: 16,
                  color: Palette.yellow100,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => _showTerms(context),
              ),
              TextSpan(text: ' y la '),
              TextSpan(
                text: 'Política de Privacidad.',
                style: GoogleFonts.outfit(
                  fontSize: 16,
                  color: Palette.yellow100,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => _showPolicyAndPrivacy(context),
              ),
            ]))),
      ],
    );
  }
}

void _showTerms(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (context) => Padding(
      padding: const EdgeInsets.all(30.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.zero,
                  child: ArrowBackButton(),
                ),
                Text(
                  "Terminos y condiciones",
                  style: GoogleFonts.outfit(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            gap10,
            Text(
              "What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: GoogleFonts.outfit(fontSize: 16, height: 1.5),
            ),
            Text(
              "What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: GoogleFonts.outfit(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    ),
  );
}

void _showPolicyAndPrivacy(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (context) => const Padding(
      padding: EdgeInsets.all(30.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                ArrowBackButton(),
                Text(
                  "Politica de privacidad",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            gap10,
            Text(
              "What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    ),
  );
}
