// part of 'home_view.dart';

// class AlboradaNavigationBar extends StatelessWidget {
//   // const AlboradaNavigationBar(this.selectedIndex, {super.key});
//   // final int selectedIndex;

//   @override
//   Widget build(BuildContext context) {
//     return NavigationBarTheme(
//         data: NavigationBarThemeData(
//             labelTextStyle: MaterialStateTextStyle.resolveWith((states) {
//           if (states.contains(MaterialState.selected)) {
//             return const TextStyle(
//               fontWeight: FontWeight.bold,
//             );
//           }
//           return const TextStyle(
//             fontWeight: FontWeight.normal,
//           );
//         })),
//         child: NavigationBar(
//       height: MediaQuery.sizeOf(context).height * 0.1,
//       selectedIndex: _selectedIndex,
//       indicatorColor: Colors.amber,
//       onDestinationSelected: (index) {
//         setState(() {
//           _selectedIndex = index;
//         });
//       },
//       destinations: const [
//         NavigationDestination(
//           icon: Icon(Icons.explore),
//           label: 'Découverte',
//         ),
//         NavigationDestination(
//           icon: Icon(Icons.brightness_7),
//           label: 'cagnotte',
//         ),
//         NavigationDestination(
//           icon: Icon(Icons.list),
//           label: 'Initiatives',
//         ),
//         NavigationDestination(
//           icon: Icon(Icons.people),
//           label: 'Communaute',
//         ),
//       ],
//     );;
//   }
// }

// class _BottonNavigationBar extends StatefulWidget {
//   // const _BottonNavigationBar(this.selectedIndex);
//   // final int selectedIndex;

//   @override
//   State<_BottonNavigationBar> createState() => _BottonNavigationBarState();
// }

// class _BottonNavigationBarState extends State<_BottonNavigationBar> {
//   @override
//   Widget build(BuildContext context) {
//     return NavigationBar(
//       height: MediaQuery.sizeOf(context).height * 0.1,
//       selectedIndex: _selectedIndex,
//       indicatorColor: Colors.amber,
//       onDestinationSelected: (index) {
//         setState(() {
//           _selectedIndex = index;
//         });
//       },
//       destinations: const [
//         NavigationDestination(
//           icon: Icon(Icons.explore),
//           label: 'Découverte',
//         ),
//         NavigationDestination(
//           icon: Icon(Icons.brightness_7),
//           label: 'cagnotte',
//         ),
//         NavigationDestination(
//           icon: Icon(Icons.list),
//           label: 'Initiatives',
//         ),
//         NavigationDestination(
//           icon: Icon(Icons.people),
//           label: 'Communaute',
//         ),
//       ],
//     );
//   }
// }
