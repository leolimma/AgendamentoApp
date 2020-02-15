import 'package:http/http.dart' as http;
import 'dart:async';
import './reservas.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert' show json;



Future<List<Reserva>> getReserva(http.Client client) async {
  final response =
      await http.get('http://tennis-concierge.mybluemix.net/reservas');

  if (response.statusCode == 200) {
      return compute(parseReservas, response.body);

  } else {
    throw Exception('Failed to load');
  }
}


putReserva(id , dataFim, dataInicio, tipo) async {
  final response = await http.put('http://tennis-concierge.mybluemix.net/reservas/$id', 
  body:json.encode({
    "id":id,
    "tipo":tipo,
    "inicioEm": dataInicio,
    "fimEm": dataFim
  }),headers: { "Content-Type" : "application/json"});
  return response.statusCode;
}

addReserva(dataFim, dataInicio, tipo) async {
  final response = await http.post('http://tennis-concierge.mybluemix.net/reservas/', 
  body:json.encode({
    "tipo":tipo,
    "inicioEm": dataInicio,
    "fimEm": dataFim
  }),headers: { "Content-Type" : "application/json"});
  return response.statusCode;
}

deleteReserva(id) async {
  final response = await http.delete('http://tennis-concierge.mybluemix.net/reservas/$id');
  return response.statusCode;
}