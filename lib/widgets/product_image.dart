import 'package:flutter/material.dart';

/// Menampilkan gambar dari assets. Jika file belum ada, tampil placeholder.
class ProductImage extends StatelessWidget {
  final String path;
  final BoxFit fit;

  const ProductImage({super.key, required this.path, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: fit,
      width: double.infinity,
      errorBuilder: (_, __, ___) => Container(
        color: Colors.amber.shade200,
        alignment: Alignment.center,
        child: const Icon(Icons.chair_alt, size: 48, color: Colors.black54),
      ),
    );
  }
}
