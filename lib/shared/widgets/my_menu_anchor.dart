import 'package:flutter/material.dart';

enum SampleItem { item1, item2, item3 }

class MyMenuAnchor extends StatefulWidget {
  const MyMenuAnchor({super.key});

  @override
  State<MyMenuAnchor> createState() => _MyMenuAnchorState();
}

class _MyMenuAnchorState extends State<MyMenuAnchor> {
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        return OutlinedButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          style: OutlinedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(0),
            side: const BorderSide(width: 2, color: Color(0xff93EC0A)),
          ),
          child: const Icon(
            Icons.more_horiz,
            color: Colors.black,
          ),
        );
      },
      menuChildren: List<MenuItemButton>.generate(
        3,
        (int index) => MenuItemButton(
          onPressed: () =>
              setState(() => selectedMenu = SampleItem.values[index]),
          child: Text('Item ${index + 1}'),
        ),
      ),
    );
  }
}
