import 'package:flutter/material.dart';
import 'package:perpustakaan/page/buku/atributbuku.dart';
import 'package:perpustakaan/page/buku/detailbuku.dart';

class daftarbuku extends StatelessWidget {
final Buku buku;

  const daftarbuku({Key? key, required this.buku}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => detailbuku(buku: buku)),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8), 
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(10), 
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), 
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8), 
              child: Image.asset(
                buku.imageUrl,
                fit: BoxFit.cover,
                width: double.maxFinite,
                height: 165,
              ),
            ),
            SizedBox(height: 9),
            Text(
              buku.judul,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}