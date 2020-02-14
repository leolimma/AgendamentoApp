import 'package:flutter/material.dart';
import './main.dart';

void updateAlert(BuildContext context)  {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      String contentText = "Sua reserva foi alterada com sucesso.";
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text("Reserva"),
            content: Text(contentText),
            actions: [
              FlatButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new MyApp()),
                    );
                    contentText = "Changed Content of Dialog";
                  });
                },
                child: Text("Ok"),
              ),
            ],
          );
        },
      );
    },
  );
}

 showAlertServiceError(BuildContext context)  {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      String contentText = "Ocorreu um problema na comunicação com o servidor, tente novamente mais tarde";
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text("Reserva"),
            content: Text(contentText),
            actions: [
              FlatButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new MyApp()),
                    );
                    contentText = "Changed Content of Dialog";
                  });
                },
                child: Text("Ok"),
              ),
            ],
          );
        },
      );
    },
  );
}

void addAlert(BuildContext context)  {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      String contentText = "Sua reserva foi criada com sucesso.";
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text("Reserva"),
            content: Text(contentText),
            actions: [
              FlatButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new MyApp()),
                    );
                    contentText = "Changed Content of Dialog";
                  });
                },
                child: Text("Ok"),
              ),
            ],
          );
        },
      );
    },
  );
}

 alertDialogDataError(BuildContext context) {

showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      String contentText = "A data informada está no formato errado.";
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text("Reserva"),
            content: Text(contentText),
            actions: [
              FlatButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pop();
                    contentText = "Changed Content of Dialog";
                  });
                },
                child: Text("Ok"),
              ),
            ],
          );
        },
      );
    },
  );
}

alertDialogHoraError(BuildContext context) {

showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      String contentText = "A hora informada está no formato errado.";
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text("Reserva"),
            content: Text(contentText),
            actions: [
              FlatButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pop();
                    contentText = "Changed Content of Dialog";
                  });
                },
                child: Text("Ok"),
              ),
            ],
          );
        },
      );
    },
  );
}

alertDialog422(BuildContext context) {

showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      String contentText = "O horário solicitado não está disponível, favor selecione um outro horário.";
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text("Reserva"),
            content: Text(contentText),
            actions: [
              FlatButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pop();
                    contentText = "Changed Content of Dialog";
                  });
                },
                child: Text("Ok"),
              ),
            ],
          );
        },
      );
    },
  );
}

void showAlertVazio(BuildContext context)  {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      String contentText = "Algum campo não foi preenchido";
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text("Reserva"),
            content: Text(contentText),
            actions: [
              FlatButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pop();
                    contentText = "Changed Content of Dialog";
                  });
                },
                child: Text("Ok"),
              ),
            ],
          );
        },
      );
    },
  );
}