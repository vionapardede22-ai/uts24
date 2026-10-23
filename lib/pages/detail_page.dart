import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants.dart';
import '../models/product.dart';
import '../widgets/product_image.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage({super.key, required this.product});

  Future<void> _orderViaWhatsApp(BuildContext context) async {
    final text = Uri.encodeComponent(
        'Halo, saya ingin memesan ${product.name} (${product.detailPrice}).');
    final uri = Uri.parse('https://wa.me/$kWhatsAppNumber?text=$text');
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tidak dapat membuka WhatsApp')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const red = Color(0xFFD50000);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Pesan'),
        actions: [
          IconButton(
              icon: const Icon(Icons.notifications_none), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: red,
                fontFamily: 'serif',
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 180,
              child: ProductImage(path: product.image),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                product.detailPrice,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: red,
                  fontFamily: 'serif',
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4CAF50),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                onPressed: () => _orderViaWhatsApp(context),
                icon: const Icon(Icons.chat),
                label: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Order via WhatsApp',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Klik di Sini!', style: TextStyle(fontSize: 9)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey.shade700,
        backgroundColor: Colors.white,
        onTap: (i) => Navigator.pop(context),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Cari'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket_outlined), label: 'Keranjang'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Profil'),
        ],
      ),
    );
  }
}