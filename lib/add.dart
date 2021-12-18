import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController getNama = TextEditingController();

  TextEditingController getUmur = TextEditingController();

  @override
  void dispose() {
    getNama.dispose();
    getUmur.dispose();
    super.dispose();
  }

  Future addData() async {
    final _url = Uri.parse('http://192.168.43.39/php/db/create.php');
    var request = http.MultipartRequest('POST', _url);
    request.fields.addAll({"nama": getNama.text, "umur": getUmur.text});
    EasyLoading.show(status: 'Loading...');
    var response = await request.send();
    if (response.statusCode == 200) {
      EasyLoading.showSuccess('Data berhasil ditambahkan');
    } else {
      EasyLoading.showError('Data gagal ditambahkan');
    }
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Add Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nama'),
            TextField(controller: getNama),
            const Text('Umur'),
            TextField(
              controller: getUmur,
              decoration: InputDecoration(
                  hintText: 'dsa',
                  label: const Text('Umur'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
            ElevatedButton(
                onPressed: () {
                  addData();
                  Navigator.pop(context);
                },
                child: const Text('Tambah'))
          ],
        ),
      ),
    );
  }
}
