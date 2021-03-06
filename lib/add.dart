import 'package:flutter/material.dart';
import './addControll.dart';

class AddPage extends StatefulWidget {
  

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  
  static List<TipoModel> dropdownItemsTipo = new List();
  static List<TempoModel> dropdownItemsTempo = new List();
  
  

  void initState() {
    super.initState();
    dropdownTipoValue = null;
    dropdownTempoValue = null;
     
    setState(() {
      if (dropdownItemsTipo.length == 0 && dropdownItemsTempo.length == 0) {
        dropdownItemsTipo.add(TipoModel(tipo: 'SAIBRO'));
        dropdownItemsTipo.add(TipoModel(tipo: 'HARD'));
        dropdownItemsTempo.add(TempoModel(tempo: '1h'));
        dropdownItemsTempo.add(TempoModel(tempo: '2h'));
        dropdownItemsTempo.add(TempoModel(tempo: '3h'));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Nova reserva'),
      ),
      body: new ListView(children: <Widget>[
        buildTextInputRow(),
        buildSecondButton('Data', dataInputController),
        buildThirdButton('Hora', horaInputController),
        buildFourthButton(),
        button(),
      ]),
    );
  }

  Widget buildTextInputRow() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FormField(
        builder: (FormFieldState state) {
          return DropdownButtonHideUnderline(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new InputDecorator(
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintText: 'Digite o tipo',
                    helperText: 'Escolha o tipo desejado',
                    labelText: dropdownTipoValue == null
                        ? 'Informe o tipo desejado'
                        : 'Tipo',
                    errorText: errorText,
                  ),
                  isEmpty: dropdownTipoValue == null,
                  child: new DropdownButton<TipoModel>(
                    value: dropdownTipoValue,
                    isDense: true,
                    onChanged: (TipoModel newValue) {
                      print(newValue);
                      setState(() {
                        dropdownTipoValue = newValue;
                      });
                    },
                    items: dropdownItemsTipo.map((TipoModel value) {
                      return DropdownMenuItem<TipoModel>(
                        value: value,
                        child: Text(value.tipo),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildFourthButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FormField(
        builder: (FormFieldState state) {
          return DropdownButtonHideUnderline(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new InputDecorator(
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintText: 'Digite o tempo',
                    helperText: 'Escolha o tempo desejado',
                    labelText: dropdownTempoValue == null
                        ? 'Informe o tempo desejado'
                        : 'Tempo',
                    errorText: errorText,
                  ),
                  isEmpty: dropdownTempoValue == null,
                  child: new DropdownButton<TempoModel>(
                    value: dropdownTempoValue,
                    isDense: true,
                    onChanged: (TempoModel newValue) {
                      print(newValue);
                      setState(() {
                        dropdownTempoValue = newValue;
                      });
                    },
                    items: dropdownItemsTempo.map((TempoModel value) {
                      return DropdownMenuItem<TempoModel>(
                        value: value,
                        child: Text(value.tempo),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  Widget button() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      new ButtonTheme(
        minWidth: 210.0,
        height: 50.0,
        child: RaisedButton(
          child: Text("Criar"),
          onPressed: () => resetValue(dropdownTipoValue, dataInputController, horaInputController, dropdownTempoValue, context),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.blue)),
          color: Colors.blue,
          textColor: Colors.white,
          padding: EdgeInsets.all(10),
          splashColor: Colors.grey,
        ),
      ),
    ],
  );
}

}
