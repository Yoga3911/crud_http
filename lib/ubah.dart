import 'package:coba/main.dart';
import 'package:coba/parse.dart';
import 'package:coba/url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UbahData extends StatefulWidget {
  final Welcome data;
  const UbahData({Key? key, required this.data}) : super(key: key);

  @override
  State<UbahData> createState() => _UbahDataState();
}

class _UbahDataState extends State<UbahData> {
  TextEditingController getNama = TextEditingController();
  TextEditingController getUmur = TextEditingController();

  @override
  void initState() {
    getNama = TextEditingController(text: widget.data.nama);
    getUmur = TextEditingController(text: widget.data.umur);
    super.initState();
  }

  @override
  void dispose() {
    getNama.dispose();
    getUmur.dispose();
    super.dispose();
  }

  void ubahData() {
    final _url = Uri.parse(Url.update);
    http.post(_url, body: {"nama": getNama.text, "umur": getUmur.text});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Update Data'),
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
                  ubahData();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Produk()),
                      ModalRoute.withName('/'));
                },
                child: const Text('Ubah'))
          ],
        ),
      ),
    );
  }
}
