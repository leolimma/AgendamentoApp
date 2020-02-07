import 'package:flutter/material.dart';
import './tipoButtom.dart';

class UpdatePage extends StatelessWidget {
  final int id;
  UpdatePage({this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Atualizar Reservas'),
      ),
       body: new ListView(
         children: <Widget>[
           buildTextInputRow('Tipo', tipoInputController),
           buildSecondBottom('Data', dataInputController),
         ]
       ),
    );
  }
}
