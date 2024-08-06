part of 'home_view.dart';

class _FindInitiative extends StatelessWidget {
  const _FindInitiative({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 50,
      child: TextFormField(
        decoration: InputDecoration(
          label: Row(children: [
            const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            Text(
              AlboradaTexts.findInitiative,
              style: GoogleFonts.outfit(fontSize: 14),
            )
          ]),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(5),
          //   borderSide: const BorderSide(
          //       // color: Colors.red,
          //       ),
          // ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
