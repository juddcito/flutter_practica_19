

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practica_19/src/ui/list_tile.dart';
import 'package:http/http.dart';

class ListViewPage extends StatelessWidget {

  var datos;
  
  ListViewPage({super.key}); 

  @override

  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Práctica 19 - API'),
        centerTitle: true,
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,     
      ),
      body: FutureBuilder(
        future: _llamarURL(),
        initialData: [],
        builder: (context, snapshot) {
          try {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder:(context, index) {
                var data = snapshot.data![index];

                return MyListTile(
                  title: data['name'],
                  subtitle: data['gender'],
                  imagefin: data['image']
                );
              },
            );
          } catch (e) {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<List> _llamarURL() async {

    var url = 'https://rickandmortyapi.com/api/character/1,2,3,4,5,6,7,8,9,10,183';

    final response = await get(Uri.parse(url));
    final jsonResponse = json.decode(response.body);

    return jsonResponse;
  }

}