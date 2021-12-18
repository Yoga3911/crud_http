import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

Future deleteData(id) async {
  final _url = Uri.parse("http://192.168.43.39/php/db/delete.php");
  var request = http.MultipartRequest('POST', _url);
  request.fields.addAll({'id': id});
  EasyLoading.show(status: 'Loading...');
  var response = await request.send();
  if (response.statusCode == 200) {
    EasyLoading.showSuccess('Sukses');
    EasyLoading.dismiss();
  }
}
