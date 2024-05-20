import 'package:flutter/material.dart';
import 'package:perpustakaan/page/buku/atributbuku.dart';
import 'package:perpustakaan/page/buku/daftarbuku.dart';
import 'package:perpustakaan/theme.dart';

class buku extends StatefulWidget {
  buku({Key? key}) : super(key: key);

  @override
  _bukuState createState() => _bukuState();
}

class _bukuState extends State<buku> {
  late List<Buku> _filteredBooks;
  late TextEditingController _searchController;
  String _selectedCategory = '';

  @override
  void initState() {
    super.initState();
    _filteredBooks = bukuList;
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterBooks(String query) {
    setState(() {
      _filteredBooks = bukuList
          .where(
              (book) => book.judul.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  final List<String> categories = [
    'Pelajaran',
    'Novel',
    'Cerita Anak',
    'Sejarah',
    'Agama',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: biru,
      body: Padding(
        padding:
            const EdgeInsets.only(right: 12, left: 12, bottom: 12, top: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextField(
                controller: _searchController,
                onChanged: _filterBooks,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50, // Lebar kategori
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategory = categories[index];
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _selectedCategory == categories[index]
                            ? Colors.grey // Warna yang dipilih
                            : Colors.white,
                      ),
                      child: Center(
                        child: Text(categories[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: _buildContentForCategory(),
            ),
          ],
        ),
      ),
    );
  }

Widget _buildContentForCategory() {
    if (_selectedCategory.isEmpty) {
      _selectedCategory = 'Pelajaran';
    }
  switch (_selectedCategory) {
    case 'Pelajaran':
      return _buildGridViewForCategory(_filteredBooks.where((book) => book.category == 'Pelajaran').toList());
    case 'Novel':
      return _buildGridViewForCategory(_filteredBooks.where((book) => book.category == 'Novel').toList());
    case 'Cerita Anak':
      return _buildGridViewForCategory(_filteredBooks.where((book) => book.category == 'Cerita Anak').toList());
    case 'Sejarah':
      return _buildGridViewForCategory(_filteredBooks.where((book) => book.category == 'Sejarah').toList());
    case 'Agama':
      return _buildGridViewForCategory(_filteredBooks.where((book) => book.category == 'Agama').toList());
    default:
      return Container();
  }
}

Widget _buildGridViewForCategory(List<Buku> books) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.8,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
    ),
    itemCount: books.length,
    itemBuilder: (context, index) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: daftarbuku(buku: books[index]),
      );
    },
  );
}
}