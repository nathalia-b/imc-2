// ignore_for_file: unnecessary_new, prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'result.dart';

class Home extends StatefulWidget {
  @override // marks an instance member as overriding a superclass member with the same name.
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
  // Creates the mutable state for this widget at a given location in the tree.
  // Subclasses should override this method to return a newly created instance
  // of their associated State subclass:
  // @override State<SomeWidget> createState() => _SomeWidgetState();
}

class _HomeState extends State<Home> {
  // Widget - whenever the user modifies a text field with an associated TextEditingController,
  //the text field updates value and the controller notifies its listeners.
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  // This uniquely identifies the Form, and allows validation of the form in a later step.
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  void _resetCampos() {
    pesoController = TextEditingController();
    alturaController = TextEditingController();
    _formKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora de IMC"),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          // ?
          actions: <Widget>[
            IconButton(onPressed: _resetCampos, icon: Icon(Icons.refresh))
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 199, 199, 199),
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Icon(Icons.person, size: 120, color: Colors.deepPurple),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Peso (kg)",
                          labelStyle: TextStyle(color: Colors.deepPurple),
                        ),
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Colors.deepPurple, fontSize: 25.0),
                        controller: pesoController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Insira seu peso!";
                          } else
                            return null;
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Altura (m)",
                            labelStyle: TextStyle(color: Colors.deepPurple)),
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Colors.deepPurple, fontSize: 25.0),
                        controller: alturaController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Insira sua altura!";
                          } else
                            return null;
                        },
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Container(
                              height: 50.0,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _calcular();
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 194, 168, 239),
                                    textStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                                child: Text(
                                  "Calcular",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20.0),
                                ),
                              ))),
                    ]))));
  }

  void _calcular() {
    String _texto = "";

    double peso = double.parse(pesoController.text);
    double altura = double.parse(alturaController.text);

    double imc = peso / (altura * altura);

    if (imc < 18.6) {
      _texto = "Abaixo do peso (${imc.toStringAsPrecision(4)})";
    } else if (imc >= 18.6 && imc < 24.9) {
      _texto = "Peso ideal (${imc.toStringAsPrecision(4)})";
    } else if (imc >= 24.9 && imc < 29.9) {
      _texto = "Levemente acima do peso (${imc.toStringAsPrecision(4)})";
    } else if (imc >= 29.9 && imc < 34.9) {
      _texto = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
    } else if (imc >= 34.9 && imc < 39.9) {
      _texto = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
    } else if (imc >= 40) {
      _texto = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
    }

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Result(_texto)));
  }
}
