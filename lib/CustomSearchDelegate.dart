// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    //throw UnimplementedError();
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(
          Icons.clear,
        ),
      ),
      // IconButton(
      //   onPressed: () {},
      //   icon: const Icon(
      //     Icons.done,
      //   ),
      // ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //throw UnimplementedError();
    return IconButton(
      onPressed: () {
        close(
          context,
          "",
        );
      },
      icon: const Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //throw UnimplementedError();
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //throw UnimplementedError();
    // voce cria a lista de sugestoes para algo do tipo direcionado, como um
    //suporte por exemplo, assim facilita a vida do usuario.
    List<String> lista = [];
    if (query.isNotEmpty) {
      lista = [
        "cars",
        "android",
        "iOS",
      ]
          .where((texto) => texto.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
      return ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                close(
                  context,
                  lista[index],
                );
              },
              title: Text(lista[index]),
            );
          });
    } else {
      return const Center(
        child: Text("Nenhum resultado encontrado"),
      );
    }
  }
}
