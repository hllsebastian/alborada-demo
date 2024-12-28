import 'package:alborada_demo/app/presentation/presentation.dart';
import 'package:alborada_demo/app/presentation/routes/routes.dart';
import 'package:alborada_demo/app/presentation/views/login/cubit/login_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return BlocProvider(
      create: (context) => GetIt.I.get<LoginUserCubit>(),
      child: AlboradaScaffoldWidget(
        body: _LoginBody(screenSize: screenSize),
      ),
    );
  }
}

class _LoginBody extends StatelessWidget {
  const _LoginBody({
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginUserCubit, LoginUserState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (error) => AlboradaSnackBar.of(context).warning(error),
          loginSuccess: (user, sucessType) {
            if (sucessType == SuccessType.loginSuccess) {
              return Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.pageView,
                (route) => false,
              );
            }
          },
        );
      },
      builder: (context, state) {
        return Padding(
          padding: edgeInsetsH25,
          child: SizedBox(
            height: screenSize.height * 0.85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.height * 0.1,
                ),
                const BackButton(),
                Text(
                  'Je me connecte',
                  style: GoogleFonts.openSans(
                      fontSize: 30, fontWeight: FontWeight.w500),
                ),
                gap10,
                _LoginForm(isLoading: state.isLoading),
                gap20,
                _FogotPasswordTextButton(),
                const Spacer(),
                _CreateAccountButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _FogotPasswordTextButton extends StatelessWidget {
  const _FogotPasswordTextButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: const Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () => goTo(context, Routes.forgotPassword),
      child: Text(
        'Mot de passe oublié ?',
        style: GoogleFonts.outfit(fontSize: 16, color: Colors.black),
      ),
    );
  }
}

class _CreateAccountButton extends StatelessWidget {
  const _CreateAccountButton();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            'Tu n’as pas encore de compte ?',
            style: GoogleFonts.outfit(fontSize: 16),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () => goTo(context, Routes.createAccount),
            child: Text(
              'Je créé mon compte',
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

class _LoginForm extends StatefulWidget {
  const _LoginForm({this.isLoading = false});
  final bool isLoading;

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSubmit(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text;
      final password = _passwordController.text;

      context.read<LoginUserCubit>().login(email, password);
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
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            readOnly: widget.isLoading,
            textEditingController: _emailController,
            validatorText: _validateEmail,
            hintText: 'Adresse e-mail',
            onChanged: (value) {},
          ),
          gap10,
          CustomTextField(
            maxLines: 1,
            readOnly: widget.isLoading,
            textEditingController: _passwordController,
            obscureText: _passwordVisible,
            keyboardType: TextInputType.emailAddress,
            validatorText: _validatePassword,
            hintText: 'Mot de passe',
            onChanged: (value) {},
            icon: IconButton(
              icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          ),
          gap16,
          SimpleButton(
            text: 'Se connecter',
            isDarkButton: true,
            onPressed: () => _onSubmit(context),
          ),
        ],
      ),
    );
  }
}

void goTo(BuildContext context, String route) {
  Navigator.pushNamed(context, route);
}
