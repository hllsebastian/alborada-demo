// import 'package:alborada_demo/app/presentation/routes/routes.dart';
// import 'package:flutter/material.dart';

// class SplashView extends StatefulWidget {
//   const SplashView({super.key});

//   @override
//   State<SplashView> createState() => _SplashViewState();
// }

// class _SplashViewState extends State<SplashView> {
//   @override
//   void initState() {
//     super.initState();
//     // To know if the widget is rendered at least once
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _init();
//     });
//   }

//   Future<void> _init() async {
//     final injector = Injector.of(context);
//     final connectivityRepo = injector.connectivityRepo;
//     final hasInternet = await connectivityRepo.hasInternet;
//     print('Has internet = $hasInternet 🛜');
//     if (hasInternet) {
//       final authRepo = injector.authRepo;
//       final isSignedIn = await authRepo.isSignedIn;
//       if (isSignedIn) {
//         final user = await authRepo.getUserData();
//         if (mounted) {
//           if (user != null) {
//             _goTo(Routes.home);
//           } else {
//             _goTo(Routes.signIn);
//           }
//         }
//       }
//       // "mounted" to know if the widget cotinue rendered (stataful widgets)
//       else if (mounted) {
//         _goTo(Routes.signIn);
//       }
//     } else {
//       // _goTo(Routes.offLine);
//     }
//   }

//   void _goTo(String route) {
//     Navigator.pushReplacementNamed(context, route);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: SizedBox(
//           width: 80,
//           height: 80,
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
// }
