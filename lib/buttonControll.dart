import 'package:flutter/material.dart';
import './requests.dart';
import './main.dart';

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
          padding: const EdgeInsets.all(10.0),
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: new TextField(
                  controller: textEditingController,
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
          padding: const EdgeInsets.all(10.0),
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: new TextField(
                  controller: textEditingController,
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

resetValue(int id, dropdownTipoValue, dataInputController, horaInputController,
    dropdownTempoValue, context) async {
  final dataInicio =
      await formataInicio(dataInputController.text, horaInputController.text);
  final dataFim = await formataFim(
      dataInputController.text, dropdownTempoValue.tempo, horaInputController.text);
  final enviarReq =
      await putReserva(id, dataFim, dataInicio, dropdownTipoValue.tipo);
  if (enviarReq == 204 || enviarReq == 200) {
    showAlert(context);
  }
     horaInputController.clear();
     dataInputController.clear(); 
     return enviarReq;
}

formataInicio(dataInputController, horaInputController) async {
  var corteData = dataInputController.split('/');
  var hora = horaInputController;
  var dataInicio = corteData[2] +
      '-' +
      corteData[1] +
      '-' +
      corteData[0] +
      'T' +
      hora +
      ':00Z';
  return dataInicio;
}

formataFim(dataInputController, dropdownTempoValue, horaInputController) async {
  var corteData = dataInputController.split('/');
  var corteHora = horaInputController.split(':00');
  var corteHoratempo = dropdownTempoValue.split('h');
  var horaInt = int.parse(corteHora[0]);
  var tempoInt = int.parse(corteHoratempo[0]);
  var somaTempo = horaInt + tempoInt;
  var tempoFinal = somaTempo.toString();
  var dataFinal = corteData[2] +
      '-' +
      corteData[1] +
      '-' +
      corteData[0] +
      'T' +
      tempoFinal +
      ':00:00Z';
  return dataFinal;
}

void showAlert(BuildContext context) async {
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
       Navigator.push(
        context,
       new MaterialPageRoute(builder: ( BuildContext context) => new MyApp()),
      );

// Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
// Navigator.of(context, rootNavigator: true).popUntil(ModalRoute.withName(Navigator.defaultRouteName));


    },
  );
  await showDialog(
    barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Reserva"),
            content: Text("Sua reserva foi alterada com sucesso"),
            actions: [
              okButton,
            ],
          ));
}

TextEditingController dataInputController = new TextEditingController();
var tempData;

TextEditingController horaInputController = new TextEditingController();
var tempHora;
