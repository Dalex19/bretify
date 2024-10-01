import 'package:bretify_mvp/features/home/widgets/curved_container_clipper.dart';
import 'package:bretify_mvp/shared/widgets/my_menu_anchor.dart';
import 'package:flutter/material.dart';

class PeopleAroundCard extends StatelessWidget {
  const PeopleAroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 70,
      child: ClipPath(
        clipper: CurvedContainerClipper(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          width: MediaQuery.of(context).size.width * 0.9,
          height: 180,
          color: const Color(0xffADFF2F),
          child: const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      PeopleAroundOptions(nameTag: "All", isSelected: true),
                      SizedBox(width: 5),
                      PeopleAroundOptions(nameTag: "Nearby", isSelected: false),
                      SizedBox(width: 5),
                      PeopleAroundOptions(nameTag: "Items", isSelected: false),
                    ],
                  ),
                  MyMenuAnchor()
                ],
              ),
              SizedBox(height: 8),
              PeopleAroundItem(
                name: "Joan D",
                adress: "CVR4+QQ9 Palo Alto...",
                imgPath:
                    "https://i.pinimg.com/564x/0e/53/46/0e534664ece4a126870682017dec4679.jpg",
              ),
              SizedBox(height: 5),
              PeopleAroundItem(
                name: "Ais Wallenstein",
                adress: "Don Edwards San...",
                imgPath:
                    "https://i.pinimg.com/564x/51/82/a4/5182a45c1fa324dc6a833d6b4c983372.jpg",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PeopleAroundItem extends StatelessWidget {
  const PeopleAroundItem({
    super.key,
    required this.name,
    required this.adress,
    required this.imgPath,
  });

  final String name, adress, imgPath;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image.network(
                imgPath,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            RichText(
              text: TextSpan(
                text: '$name\n',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: adress,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(0),
                side: const BorderSide(width: 2, color: Color(0xff93EC0A)),
              ),
              child: const Icon(
                Icons.video_call_outlined,
                color: Colors.black,
              ),
            ),
            const CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(
                Icons.message_outlined,
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }
}

//CVR4+QQ9 Palo Alto... Joan D
//"https://i.pinimg.com/564x/51/82/a4/5182a45c1fa324dc6a833d6b4c983372.jpg"

class PeopleAroundOptions extends StatelessWidget {
  const PeopleAroundOptions(
      {super.key, required this.nameTag, required this.isSelected});
  final String nameTag;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      decoration: BoxDecoration(
          color: isSelected ? const Color(0xff95F500) : const Color(0xff95F500),
          borderRadius: BorderRadius.circular(18)),
      child: Center(
        child: Text(
          nameTag,
          style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 16,
              color: Colors.black),
        ),
      ),
    );
  }
}
