import 'package:alborada_demo/main_common.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env.stg');
  await mainCommon(flavor: 'stg');
}
