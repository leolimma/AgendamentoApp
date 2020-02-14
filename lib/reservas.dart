import 'dart:convert' show json;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './update.dart';

var formatterTime = new DateFormat.Hm();
var formatterDay = new DateFormat.d();
var formatterMonth = new DateFormat.M();

List<Reserva> parseReservas(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Reserva>((json) => Reserva.fromJson(json)).toList();
}

class Reserva {
  final int id;
  final String tipo;
  final String status;
  final String criadoEm;
  final String inicioEm;
  final String fimEm;
  final String canceladaEm;
  final int valor;
  final int duracao;

  Reserva(
      {this.id,
      this.tipo,
      this.status,
      this.criadoEm,
      this.inicioEm,
      this.fimEm,
      this.canceladaEm,
      this.valor,
      this.duracao});

  factory Reserva.fromJson(Map<String, dynamic> json) {
    return Reserva(
      id: json['id'] as int,
      tipo: json['tipo'] as String,
      status: json['status'] as String,
      criadoEm: json['criadaEm'] as String,
      inicioEm: json['inicioEm'] as String,
      fimEm: json['fimEm'] as String,
      canceladaEm: json['canceladaEm'] as String,
      valor: json['valor'] as int,
      duracao: json['duracao'] as int,
    );
  }
}

class ReservaList extends StatelessWidget {
  final List<Reserva> reservas;

  ReservaList({Key key, this.reservas}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.70,
        crossAxisCount: 1,
      ),
      itemCount: reservas.length,
      itemBuilder: (context, index) {
        var timeInicio = DateTime.parse(reservas[index].inicioEm);
        var timeFim = DateTime.parse(reservas[index].fimEm);
        var id = reservas[index].id;
        return Container(
          child: Card(
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.assignment),
                  title: Text('Reserva Agendada'),
                ),
                new Container(
                  height: 25.0,
                  width: 260,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Para o dia: ' +
                          formatterDay.format(timeInicio) +
                          '/' +
                          formatterMonth.format(timeInicio) +
                          ' às ' +
                          formatterTime.format(timeInicio) +
                          ' - ' +
                          formatterTime.format(timeFim),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                  ),
                ),
                new Container(
                  height: 25.0,
                  width: 250,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Tipo: ' + reservas[index].tipo,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                  ),
                ),
                new Container(
                  height: 25.0,
                  width: 250,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Stattus: ' + reservas[index].status,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                  ),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: Icon(Icons.border_color),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UpdatePage(id: id)),
                        );
                      },
                    ),
                    FlatButton(
                      child: Icon(Icons.delete),
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
