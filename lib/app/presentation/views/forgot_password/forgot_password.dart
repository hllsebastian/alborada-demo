import 'package:alborada_demo/app/presentation/alborada_ui/alborada_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return AlboradaScaffoldWidget(
      body: _LoginBody(),
    );
  }
}

class _LoginBody extends StatelessWidget {
  const _LoginBody();

  @override
  Widget build(BuildContext context) {
    // void goTo(String route) {
    //   Navigator.pushNamed(context, route);
    // }
    final screenSize = MediaQuery.sizeOf(context);
    return Padding(
      padding: edgeInsetsH25,
      child: SizedBox(
        height: screenSize.height * 0.85,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenSize.height * 0.1),
            const BackButton(),
            Text(
              'Mot de passe oublié',
              style: GoogleFonts.openSans(
                  fontSize: 30, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: screenSize.height * 0.01),
            Text(
              'Nous vous enverons un e-mail pour réinitialiser votre mot de passe.',
              style: GoogleFonts.outfit(fontSize: 16),
            ),
            SizedBox(height: screenSize.height * 0.01),
            _EmailField(),
          ],
        ),
      ),
    );
  }
}

class _EmailField extends StatefulWidget {
  const _EmailField();

  @override
  State<_EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<_EmailField> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'The email is required';
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(value)) return 'Email format invalid';
    return null;
  }

  void _onSubmit(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text;

      // context.read<LoginUserCubit>().login(email, password);
    }
  }

  bool _enableButton() {
    final formCompleted = _formKey.currentState?.validate() ?? false;
    if (formCompleted) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            hintText: 'Adresse e-mail',
            textEditingController: _emailController,
            validatorText: _validateEmail,
            onChanged: (value) {
              setState(() {
                // _validateEmail(value);
                // _enableButton();
              });
            },
          ),
          SizedBox(height: screenSize.height * 0.01),
          SimpleButton(
            text: 'Réinitialiser le mot de passe',
            buttonColor: _enableButton() ? Palette.black : Palette.grey1,
            textColor: _enableButton() ? Palette.white : Palette.grey2,
            onPressed: () => _enableButton() ? _onSubmit(context) : () {},
          ),
        ],
      ),
    );
  }
}
