class Product {
  final String name;
  final String category;
  final String listPrice; // harga di halaman Home
  final String detailPrice; // harga di halaman Pesan (Rp)
  final String image;

  const Product({
    required this.name,
    required this.category,
    required this.listPrice,
    required this.detailPrice,
    required this.image,
  });
}
