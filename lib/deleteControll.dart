import './alertButton.dart';
import './requests.dart';

softDelete(id, context) async {
  alertDelete(context, id);
}

sendDeleteRequest(context, id) async {
  final enviarReq = await deleteReserva(id);
  if (enviarReq == 204) {
    deleteSuccesAlert(context);
  } else {
    showAlertServiceError(context);
  }
}
