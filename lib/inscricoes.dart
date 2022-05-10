// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

class Inscricoes extends StatefulWidget {
  @override
  _InscricoesState createState() => _InscricoesState();
}

class _InscricoesState extends State<Inscricoes> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Center(
      child: Text(
        "Inscrições",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
