import 'package:bretify_mvp/features/home/home.dart';
import 'package:flutter/material.dart';

class With extends StatelessWidget {
  const With({
    super.key,
    required this.btnName,
    required this.subTitle,
  });

  final String btnName;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Color(0xff6E54B5)),
              padding:
                  WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 90)),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            },
            child: Text(
              btnName,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Expanded(child: Skeleton()),
              const SizedBox(width: 15),
              Text(subTitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 16)),
              const SizedBox(width: 15),
              const Expanded(child: Skeleton()),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.facebook,
                  color: Colors.white,
                ),
                label: const Text(
                  'Facebook',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                iconAlignment: IconAlignment.start,
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                label: const Text(
                  'Google',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                iconAlignment: IconAlignment.start,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Skeleton extends StatelessWidget {
  const Skeleton({
    super.key,
    this.height,
    this.width,
  });

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.grey.shade600,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
    );
  }
}

//"Crear Cuenta", o registrate con