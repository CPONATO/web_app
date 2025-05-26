import 'package:flutter/material.dart';
import 'package:web_ap/views/side_bar_screens/widgets/order_widget.dart';

class OrderScreen extends StatefulWidget {
  static const String routeId = 'orderscreen';
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    Widget rowHeader(int flex, String text) {
      return Expanded(
        flex: flex,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
            color: Colors.blue,
          ),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Manage Orders',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                rowHeader(1, 'Product Image'),
                rowHeader(2, 'Product Name'),
                rowHeader(1, 'Category'),
                rowHeader(1, 'Price'),
                rowHeader(1, 'Quantity'),
                rowHeader(2, 'Buyer Name'),
                rowHeader(2, 'Buyer Email'),
                rowHeader(2, 'Buyer Address'),
                rowHeader(1, 'Status'),
              ],
            ),
            OrderWidget(),
          ],
        ),
      ),
    );
  }
}
