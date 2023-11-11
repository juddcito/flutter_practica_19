

import 'package:flutter/material.dart';

class MyDetailsContainer extends StatelessWidget {

  final String? gender;
  final String? name;

  const MyDetailsContainer({
    super.key,
    this.gender,
    this.name
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 10
      ),
      height: 300,
      decoration: BoxDecoration(
        color: colors.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Nombre: ',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal
            ),
          ),
          const SizedBox(height: 15),
          Center(
            child: Text(
              '$name ',
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.w200,
                fontStyle: FontStyle.italic
              ),
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'Género ',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontStyle: FontStyle.normal
            ),
          ),
          const SizedBox(height: 15),
          Center(
            child: Text(
              '$gender ',
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.w200,
                fontStyle: FontStyle.italic
              ),
            ),
          )
        ],
      ),
    );
  }
}