import 'package:flutter/material.dart';

class UpdatePage extends StatelessWidget {

  final int id;
  UpdatePage({this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Alterar Reserva'),
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14),
                ),
              ),
            ), 
          ],
        ),
      ),
    );
  }
}