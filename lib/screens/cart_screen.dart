import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cart Screen'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Consumer<CartProvider>(
                builder: (_,cartprovider,__){
                  if(cartprovider.cartItems.isEmpty){
                    return const Center(
                      child: Text('Your cart is empty'),
                    );
                  }else{
                    return ListView.builder(
                      padding: EdgeInsets.all(24),
                      itemCount: cartprovider.cartItems.length,
                      itemBuilder: (context,index){
                        final item = cartprovider.cartItems[index];
                        return ListTile(
                          leading: Icon(Icons.fastfood),
                          title: Text(item.name),
                          subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                          trailing: IconButton(
                            onPressed: (){
                              Provider.of<CartProvider>(context, listen: false).removeItem(item);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text('${item.name} removed from cart'),
                                  duration: Duration(seconds: 1),
                                )
                              );
                            },
                            icon: Icon(Icons.remove_circle_outline_outlined),
                          ),
                        );
                      }
                    );
                  }
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                border: BoxBorder.fromLTRB(
                  top: BorderSide(
                    color: Colors.grey
                  )
                )
              ),
              child: Selector<CartProvider,double>(
                selector: (_,cartprovider)=>cartprovider.totalPrice,
                builder: (_,totalPrice,__){
                  return Center(
                    child: Text(
                      'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        )
      )
    );
  }
}
