import 'package:coba/delete.dart';
import 'package:coba/main.dart';
import 'package:flutter/material.dart';

alert(BuildContext context, String index) {
  AlertDialog alertDialog = AlertDialog(
    content: const Text('Apakah anda yakin'),
    actions: <Widget>[
      ElevatedButton(
          onPressed: () {
            deleteData(index).whenComplete(() => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Produk()),
                ModalRoute.withName('/')));
          },
          child: const Text('Yakin')),
      ElevatedButton(
          onPressed: () => Navigator.pop(context), child: const Text('Batal')),
    ],
  );
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alertDialog;
      });
}
