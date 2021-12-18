import 'package:coba/alert.dart';
import 'package:coba/parse.dart';
import 'package:coba/ubah.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final Welcome data;
  const Detail({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.id),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(data.nama),
          Text(data.umur),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UbahData(
                          data: data,
                        ),
                      )),
                  child: const Text('Ubah')),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  alert(context, data.id);
                },
                child: const Text('Hapus'),
                style: ElevatedButton.styleFrom(primary: Colors.red),
              )
            ],
          )
        ],
      )),
    );
  }
}
