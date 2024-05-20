class FormData {
  final String namaPeminjam;
  final String judulBuku;
  final DateTime tanggalPeminjaman;
  final DateTime tanggalPengembalian;

  FormData({
    required this.namaPeminjam,
    required this.judulBuku,
    required this.tanggalPeminjaman,
    required this.tanggalPengembalian,
  });
}
