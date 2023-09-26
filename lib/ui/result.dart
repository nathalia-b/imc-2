import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String _texto;

  const Result(this._texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Resultado"), backgroundColor: Colors.purple),
      backgroundColor: const Color.fromARGB(255, 199, 199, 199),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              _texto,
              style:
                  const TextStyle(fontSize: 22.0, fontStyle: FontStyle.italic),
            ),
          )
        ],
      ),
    );
  }
}
