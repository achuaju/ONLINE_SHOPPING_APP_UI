import 'package:flutter/material.dart';


class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Sample product data for 10 products
  List<Map<String, dynamic>> cartItems = [
    {
      'image': "assets/image/boy.png",
      'name': 'Product 1',
      'price': 899.0,
      'rating': 4.8,
      'deliveryDays': 2,
      'offer': '10% off',
      'quantity': 2,
    },
    {
      'image':  "assets/image/BlackPant.png",
      'name': 'Product 2',
      'price': 999.0,
      'rating': 3.2,
      'deliveryDays': 3,
      'offer': '15% off',
      'quantity': 3,
    },
    {
      'image':     "assets/image/Bag.png",
      'name': 'Product 2',
      'price': 500.0,
      'rating': 4.9,
      'deliveryDays': 3,
      'offer': '15% off',
      'quantity': 1,
    },
    {
      'image':     "assets/image/lo.png",
      'name': 'Product 2',
      'price': 3000.0,
      'rating': 4.2,
      'deliveryDays': 1,
      'offer': '15% off',
      'quantity': 1,
    },
    {
      'image':     "assets/image/log.png",
      'name': 'Product 2',
      'price': 2000.0,
      'rating': 4.6,
      'deliveryDays': 1,
      'offer': '15% off',
      'quantity': 1,
    },
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SHADOW CART'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return Card(
            child: ListTile(
              leading: Image.asset(
                item['image'],
                width: 80,
                height: 80,
              ),
              title: Text(item['name']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price: \$${item['price']}'),
                  Text('Rating: ${item['rating']}'),
                  Text('Delivery Days: ${item['deliveryDays']}'),
                  Text('Offer: ${item['offer']}'),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Quantity: ${item['quantity']}'),
                  Text('Total: \$${item['price'] * item['quantity']}'),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Amount: \$${calculateTotalAmount()}'),
              ElevatedButton(
                onPressed: () {
                  // Handle the place order action here
                  // You can navigate to a checkout page or perform the desired action.
                },
                child: Text('Place Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calculateTotalAmount() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }
}
