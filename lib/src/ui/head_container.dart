

import 'package:flutter/material.dart';

class MyHeadContainer extends StatelessWidget {

  String? imagerec;

  MyHeadContainer({
    super.key,
    this.imagerec
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(
        top: 30,
        left: 30,
        right: 30,
        bottom: 15
      ),
      height: 160,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(10),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            imagerec!,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}