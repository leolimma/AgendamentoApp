import 'package:http/http.dart' as http;
import 'dart:async';
import './reservas.dart';
import 'package:flutter/foundation.dart';



Future<List<Reserva>> getReserva(http.Client client) async {
  final response =
      await http.get('http://tennis-concierge.mybluemix.net/reservas');

  if (response.statusCode == 200) {
      return compute(parseReservas, response.body);

  } else {
    throw Exception('Failed to load');
  }
}

