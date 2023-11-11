
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_practica_19/src/ui/details_container.dart';
import 'package:flutter_practica_19/src/ui/head_container.dart';
import 'package:flutter_practica_19/src/ui/pdf_preview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class DetailsPage extends StatelessWidget {

  String datosName;
  String datosGender;
  String? datosImage;
  String? path;

  DetailsPage({
    super.key,
    required this.datosName,
    required this.datosGender,
    this.datosImage
  }); 

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(datosName + ' details'),
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: colors.background,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          children: [
            MyHeadContainer(imagerec: datosImage),
            MyDetailsContainer(name: datosName, gender: datosGender)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.print_outlined),
        onPressed:(){
          _downloadImage(datosImage);
          Future.delayed(const Duration(milliseconds: 3000), () {
            Navigator.push(context, MaterialPageRoute(builder:(context) => PDFScreen(
              name: datosName,
              gender: datosGender,
              imageUrl: path ?? '',
            )));
          });
        }
      ),
    );
  }

  void _downloadImage(String? datosImage) async {

    try {

      final http.Response response = await http.get(Uri.parse(datosImage!));
      final dir = await getTemporaryDirectory();
      var filename = '${dir.path}/image.jpeg';
      final file = File(filename);

      await file.writeAsBytes(response.bodyBytes);
      path = file.path;
    
    } catch (e) {
      print('Ha ocurrido un error descargando la imagen $e');
    }
  }
}