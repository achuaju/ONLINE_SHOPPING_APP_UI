import 'package:flutter/material.dart';



class DeliveryDatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample data for delivery details
    String deliveryDate = "September 20, 2023";
    double deliveryCharge = 5.99;
    String deliveryAddress = "123 Main Street, City, Country";

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Delivery Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Delivery Date:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                deliveryDate,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Delivery Charge:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$$deliveryCharge',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Delivery Address:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                deliveryAddress,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
