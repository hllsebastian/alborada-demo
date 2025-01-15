import 'package:alborada_demo/app/presentation/presentation.dart';
import 'package:flutter/cupertino.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog._(
    this.info,
    this.textButton,
    this.navigateTo,
  );
  final String info;
  final String textButton;
  final void Function()? navigateTo;

  static Future<void> show({
    required BuildContext context,
    required String info,
    required String textButton,
    navigateTo,
  }) async {
    AlboradaDialog.custom(
      context,
      child: CustomDialog._(info, textButton, navigateTo),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsetsH40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoAlertDialog(
            title: Text(
              'Next Step',
            ),
            content: Text(
              info,
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  if (navigateTo != null) {
                    navigateTo!.call();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Ok'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
