part of 'home_view.dart';

class _Appbar extends StatelessWidget {
  const _Appbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: const Row(
            children: [
              Text('🪙'),
              Text('150',
                  style: TextStyle(
                    color: Colors.white,
                  ))
            ],
          ),
        ),
        Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: const DecorationImage(
              image: AssetImage('assets/images/saitama_poker_face.png'),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.black12,
              width: 1.0,
            ),
          ),
        ),
      ],
    );
  }
}
