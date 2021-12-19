import 'package:coba/url.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

Future deleteData(id) async {
  final _url = Uri.parse(Url.delete);
  var request = http.MultipartRequest('POST', _url);
  request.fields.addAll({'id': id});
  EasyLoading.show(status: 'Loading...');
  var response = await request.send();
  if (response.statusCode == 200) {
    EasyLoading.showSuccess('Sukses');
    EasyLoading.dismiss();
  } else {}
}
