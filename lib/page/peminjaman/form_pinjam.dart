import 'package:flutter/material.dart';
import 'package:perpustakaan/page/buku/atributbuku.dart';

class form_pinjam extends StatefulWidget {
  final Buku buku;

  const form_pinjam({Key? key, required this.buku}) : super(key: key);

  @override
  _form_pinjamState createState() => _form_pinjamState();
}

class _form_pinjamState extends State<form_pinjam> {
  DateTime? _tanggalPeminjaman;
  DateTime? _tanggalPengembalian;
  TextEditingController _namaPeminjamController = TextEditingController();

  Future<void> _selectDate(BuildContext context, bool isPeminjaman) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _tanggalPeminjaman) {
      setState(() {
        if (isPeminjaman) {
          _tanggalPeminjaman = picked;
        } else {
          _tanggalPengembalian = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Peminjaman'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  "Nama Peminjam",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 5),
                TextFormField(
                  controller: _namaPeminjamController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Masukkan nama peminjam",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Judul Buku",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 5),
                TextFormField(
                  initialValue: widget.buku.judul,
                  enabled: false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Tanggal Peminjaman",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        enabled: false,
                        controller: TextEditingController(
                          text: _tanggalPeminjaman != null
                              ? "${_tanggalPeminjaman!.toLocal()}".split(' ')[0]
                              : "",
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Pilih tanggal peminjaman",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _selectDate(context, true);
                      },
                      icon: Icon(Icons.calendar_today),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Tanggal Pengembalian",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        enabled: false,
                        controller: TextEditingController(
                          text: _tanggalPengembalian != null
                              ? "${_tanggalPengembalian!.toLocal()}".split(' ')[0]
                              : "",
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Pilih tanggal pengembalian",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _selectDate(context, false);
                      },
                      icon: Icon(Icons.calendar_today),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Store form data
                    
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnotherPage extends StatelessWidget {
  final String bookTitle;
  final FormData formData;

  const AnotherPage({
    Key? key,
    required this.bookTitle,
    required this.formData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Judul Buku: $bookTitle'),
            Text('Nama Peminjam: ${formData.namaPeminjam}'),
            Text('Tanggal Peminjaman: ${formData.tanggalPeminjaman}'),
            Text('Tanggal Pengembalian: ${formData.tanggalPengembalian}'),
          ],
        ),
      ),
    );
  }
}

class FormData {
  final String namaPeminjam;
  final DateTime tanggalPeminjaman;
  final DateTime tanggalPengembalian;

  FormData({
    required this.namaPeminjam,
    required this.tanggalPeminjaman,
    required this.tanggalPengembalian,
  });
}
