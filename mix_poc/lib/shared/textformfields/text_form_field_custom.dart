import 'dart:developer';

import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatefulWidget {
  const TextFormFieldCustom({
    super.key,
    required this.controller,
    required this.validator,
    required this.label,
    required this.width,
    required this.height,
  });

  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final String label;
  final double width;
  final double height;

  @override
  State<TextFormFieldCustom> createState() => _TextFormFieldCustomState();
}

class _TextFormFieldCustomState extends State<TextFormFieldCustom> {
  double finalheight = 0;
  late MaterialStatesController materialStatesController;

  @override
  void initState() {
    finalheight = widget.height;
    materialStatesController = MaterialStatesController();
    materialStatesController.addListener(() {
      Future.delayed(Duration.zero, () {
        log(materialStatesController.value.toString(),
            name: 'Status do TextFormField');
        if (materialStatesController.value.contains(MaterialState.error)) {
          if (finalheight == widget.height) {
            setState(() {
              finalheight += 20;
            });
          }
        } else {
          setState(() {
            finalheight = widget.height;
          });
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: finalheight,
      child: TextFormField(
        statesController: materialStatesController,
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
            isCollapsed: false,
            label: Text(
              widget.label,
              style: const TextStyle(color: Color(0xFF2D2D2D)),
            )),
      ),
    );
  }
}
