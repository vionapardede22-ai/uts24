import '../models/product.dart';

const List<String> categories = ['All', 'Living Room', 'Bedroom', 'Dining Room'];

const List<Product> products = [
  Product(
    name: 'Stylish Chair',
    category: 'Living Room',
    listPrice: '\$170',
    detailPrice: 'Rp.170.000,00',
    image: 'assets/images/kursi.png',
  ),
  Product(
    name: 'Modern Table',
    category: 'Dining Room',
    listPrice: '\$75',
    detailPrice: 'Rp.75.000,00',
    image: 'assets/images/meja.png',
  ),
  Product(
    name: 'Wooden Console',
    category: 'Living Room',
    listPrice: '\$340',
    detailPrice: 'Rp.250.000,00',
    image: 'assets/images/game.png',
  ),
  Product(
    name: 'Brown Armchair',
    category: 'Living Room',
    listPrice: '\$210',
    detailPrice: 'Rp.210.000,00',
    image: 'assets/images/sofaa.png',
  ),
];
