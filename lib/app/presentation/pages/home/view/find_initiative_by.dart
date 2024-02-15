part of 'home_view.dart';

class _FindInitiativeBy extends StatefulWidget {
  const _FindInitiativeBy({
    super.key,
  });

  @override
  State<_FindInitiativeBy> createState() => _FindInitiativeByState();
}

class _FindInitiativeByState extends State<_FindInitiativeBy> {
  final options = ['Date', 'type', 'Location'];

  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Trier par :  '),
        const SizedBox(width: 13),
        DropdownButton<String>(
            iconSize: 0,
            value: selectedOption ?? options.first,
            borderRadius: BorderRadius.circular(12),
            items: options.map<DropdownMenuItem<String>>((e) {
              return DropdownMenuItem<String>(value: e, child: Text(e));
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedOption = value;
              });
            },
            selectedItemBuilder: (BuildContext context) {
              return options.map<Widget>((String value) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(value),
                    const Icon(Icons.arrow_drop_down, color: Colors.black),
                  ],
                );
              }).toList();
            })
      ],
    );
  }
}
