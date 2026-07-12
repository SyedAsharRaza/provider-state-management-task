import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management_task/providers/cart_provider.dart';
import 'package:provider_state_management_task/providers/theme_provider.dart';

import '../models/cart_item.dart';
import 'cart_screen.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Catalog'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>CartScreen())
            );
          }, icon: Icon(Icons.shopping_cart)),
          Consumer<ThemeProvider>(
            builder: (_,themeProvider,__){
              return IconButton(
                onPressed: (){
                  themeProvider.toggleTheme();
                },
                icon: Icon(themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode)
              );
            },
          )
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(24),
          itemCount: foodMenu.length,
          itemBuilder: (context,index){
            final item = foodMenu[index];
            return ListTile(
              leading: const Icon(Icons.fastfood),
              title: Text(item.name),
              subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
              trailing: IconButton(onPressed: (){
                Provider.of<CartProvider>(context, listen: false).addItem(item);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    content: Text('${item.name} added to cart'),
                    duration: Duration(seconds: 1),
                  )
                );
              }, icon: Icon(Icons.add)),
            );
          },
        ),
      )
    );
  }
}

final List<CartItem> foodMenu = [
  CartItem(id: '1', name: 'Gourmet Beef Burger', price: 8.99),
  CartItem(id: '2', name: 'Pepperoni Pizza', price: 12.49),
  CartItem(id: '3', name: 'Crunchy French Fries', price: 3.99),
  CartItem(id: '4', name: 'Chocolate Milkshake', price: 4.99),
  CartItem(id: '5', name: 'Spicy Chicken Wings', price: 7.99),
];
