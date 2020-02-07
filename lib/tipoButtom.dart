import 'package:flutter/material.dart';

Widget buildTextInputRow(
    var label, TextEditingController textEditingController) {
  final tipos = ['HARD', 'SAIBRO'];
  return Container(
    height: 150,
    child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        new Padding(
          padding: const EdgeInsets.all(33.0),
          child: new Row(
            children: <Widget>[
              new Expanded(
                  child: new TextField(
                textAlignVertical: TextAlignVertical.center,
                controller: textEditingController,
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                      borderSide: new BorderSide(color: Colors.teal)),
                  hintText: 'Digite o tipo',
                  helperText: 'Escolha o tipo desejado',
                  labelText: 'Tipo',
                ),
              )),
              new PopupMenuButton<String>(
                icon: const Icon(Icons.arrow_drop_down),
                onSelected: (String value) {
                  textEditingController.text = value;
                },
                itemBuilder: (BuildContext context) {
                  return tipos.map<PopupMenuItem<String>>((String value) {
                    return new PopupMenuItem(
                        child: new Text(value), value: value);
                  }).toList();
                },
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildSecondBottom(
    var label, TextEditingController textEditingController) {
  return Center(
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        new Padding(
          padding: const EdgeInsets.all(50.0),
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: new TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintText: 'Digite a Data',
                    helperText: 'No formato DD/MM/AAAA',
                    labelText: 'Data',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

TextEditingController tipoInputController = new TextEditingController();
var tempTipo;

TextEditingController dataInputController = new TextEditingController();
var tempData;
