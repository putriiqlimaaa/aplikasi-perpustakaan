import 'package:flutter/material.dart';
import 'package:perpustakaan/page/buku/atributbuku.dart';
import 'package:perpustakaan/page/peminjaman/form_pinjam.dart';

class detailbuku extends StatelessWidget {
  final Buku buku;

  const detailbuku({Key? key, required this.buku}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(buku.judul),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  buku.imageUrl,
                  fit: BoxFit.contain,
                  width: 400,
                  height:400,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                buku.judul,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Pengarang: ${buku.pengarang}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 3),
              Text(
                'Penerbit: ${buku.penerbit}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 3),
              Text(
                'Tahun Terbit: ${buku.tahun_terbit}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 3),
              Text(
                'Sinopsis: ${buku.sinopsis}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 60,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => form_pinjam(buku: buku)),
                );
            },
            child: Text('Pinjam'),
            style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0), // Adjust the value to make the button more or less rounded
            ),
          ),
          ),
        ),
      ),
    );
  }
}
