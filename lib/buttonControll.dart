import 'package:flutter/material.dart';

class TipoModel {
  String tipo = '';

  TipoModel({
    this.tipo,
  });
}

class TempoModel {
  String tempo = '';
  TempoModel({this.tempo});
}

TipoModel dropdownTipoValue;
TempoModel dropdownTempoValue;
String errorText;

Widget buildSecondButton(
    var label, TextEditingController textEditingController) {
  return Center(
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        new Padding(
          padding: const EdgeInsets.all(30.0),
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

Widget buildThirdButton(
    var label, TextEditingController textEditingController) {
  return Center(
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        new Padding(
          padding: const EdgeInsets.all(30.0),
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
                    hintText: 'Digite o Horário',
                    helperText: 'No formato HH:MM',
                    labelText: 'Hora',
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


 resetValue(id , tipoInputController, dataInputController, horaInputController, tempoInputController)  async {
  dropdownTipoValue = null;
  dropdownTempoValue = null;
  final dateInicio = await formataInicio(dataInputController, horaInputController); 
  print(dateInicio);

}

formataInicio(dataInputController, horaInputController) async {
  var parse = dataInputController;
  print(parse);
  return parse;
}

TextEditingController tipoInputController = new TextEditingController();
var tempTipo;

TextEditingController dataInputController = new TextEditingController();
var tempData;

TextEditingController horaInputController = new TextEditingController();
var tempHora;

TextEditingController tempoInputController = new TextEditingController();
var tempTempo;
