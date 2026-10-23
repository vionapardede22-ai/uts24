import 'package:flutter/material.dart';
import '../data/product_data.dart';
import '../widgets/category_chips.dart';
import '../widgets/product_card.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  final String storeName;
  const HomePage({super.key, required this.storeName});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedCategory = 'All';
  final Set<String> _favorites = {};
  int _navIndex = 0;

  @override
  Widget build(BuildContext context) {
    final shown = _selectedCategory == 'All'
        ? products
        : products.where((p) => p.category == _selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (ctx) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(ctx).openDrawer(),
          ),
        ),
        title: const Text('Home'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListTile(
            leading: const Icon(Icons.store),
            title: Text(widget.storeName),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            // Nama toko diambil dari form registrasi
            Text(
              widget.storeName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            CategoryChips(
              categories: categories,
              selected: _selectedCategory,
              onSelected: (c) => setState(() => _selectedCategory = c),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                itemCount: shown.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.82,
                ),
                itemBuilder: (_, i) {
                  final p = shown[i];
                  return ProductCard(
                    product: p,
                    isFavorite: _favorites.contains(p.name),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => DetailPage(product: p)),
                    ),
                    onFavorite: () => setState(() {
                      _favorites.contains(p.name)
                          ? _favorites.remove(p.name)
                          : _favorites.add(p.name);
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey.shade700,
        backgroundColor: Colors.white,
        onTap: (i) => setState(() => _navIndex = i),
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
