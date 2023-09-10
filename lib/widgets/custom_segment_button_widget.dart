import 'package:flutter/material.dart';

enum Categories { trabajo, estudio, personal, ocio }

class CustomeSegmentButton extends StatefulWidget {

  const CustomeSegmentButton({super.key});

  @override
  State<CustomeSegmentButton> createState() => _CustomeSegmentButtonState();
}

class _CustomeSegmentButtonState extends State<CustomeSegmentButton> {

  Categories categorySelected = Categories.trabajo;

  @override
  Widget build(BuildContext context) {
    List<ButtonSegment> categoryOption = [
      const ButtonSegment(
          value: Categories.trabajo,
          icon: Icon(Icons.work),
          label: Text("Trabajo")),
      const ButtonSegment(
          value: Categories.estudio,
          icon: Icon(Icons.school),
          label: Text("Estudio")),
      const ButtonSegment(
          value: Categories.personal,
          icon: Icon(Icons.person),
          label: Text("Personal")),
      const ButtonSegment(
          value: Categories.ocio,
          icon: Icon(Icons.sports_esports),
          label: Text("Ócio")),
    ];

    return SegmentedButton(
      segments: categoryOption,
      selected: <Categories>{categorySelected},
      onSelectionChanged: (value) {
        setState(() {
          categorySelected = value.first;
        });
      },
      selectedIcon: const Icon(Icons.check),
    );
  }
}
