import 'package:flutter/material.dart';
import 'package:teste_delivery/app/core/themes/extensions/color_theme_extension.dart';

class DropdownButtonWidget extends StatefulWidget {
  const DropdownButtonWidget({super.key});

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

const List<String> list = <String>[
  'Recebido',
  'Em preparo',
  'Concluído',
  'Recusados'
];

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      //elevation: 16,
      style: TextStyle(
        color: context.appColors.orange,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      underline: Container(
        height: 0,
        color: Colors.white,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
