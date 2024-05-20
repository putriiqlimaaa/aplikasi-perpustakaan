import 'package:flutter/material.dart';
import 'package:perpustakaan/page/pengembalian/pengembalian.dart';
import 'package:perpustakaan/theme.dart';

class peminjaman extends StatefulWidget {
  const peminjaman({super.key});

  @override
  State<peminjaman> createState() => _peminjamanState();
}

class _peminjamanState extends State<peminjaman> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Data Peminjaman',
          style: TextStyle(color: Colors.white),
      ),),
      backgroundColor: biru,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  width: 500,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Colors.blue,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Nama Peminjam: John Doe',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Judul Buku: Flutter Cookbook',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Tanggal Pinjam: 2024-03-19',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Tanggal Kembali: 2024-03-26',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 45,
                  right: 60,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.check,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pengembalian()),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 45,
                  right: 15,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        // onPressed event
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
