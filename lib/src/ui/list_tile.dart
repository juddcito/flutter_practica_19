

import 'package:flutter/material.dart';
import 'package:flutter_practica_19/src/details_page.dart';

class MyListTile extends StatelessWidget {

  var title;
  var subtitle;
  String? imagefin;

  MyListTile({
    super.key,
    this.title,
    this.subtitle,
    this.imagefin
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.only(
        left: 15,
        right: 10,
        top: 15
      ),
      decoration: BoxDecoration(
        color: colors.secondaryContainer,
        borderRadius: BorderRadius.circular(20)
      ),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(10),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(imagefin!),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder:(context) => DetailsPage(
              datosName: title,
              datosGender: subtitle,
              datosImage: imagefin,
              )
            )
          );
        },
      ),
    );
  }
}