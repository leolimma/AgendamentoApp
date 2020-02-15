import 'package:flutter/material.dart';
import './reservas.dart';
import './requests.dart';
import 'package:http/http.dart' as http;
import './add.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  Future<Reserva> reserva;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen(),debugShowCheckedModeBanner: false,
);
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Minhas Reservas'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AddPage()),
                );
              },
            )
          ],
        ),
        body: FutureBuilder<List<Reserva>>(
          future: getReserva(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? ReservaList(reservas: snapshot.data)
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
