import 'package:flutter/material.dart';
import 'package:web_ap/views/side_bar_screens/widgets/buyer_widget.dart';

class BuyersScreen extends StatefulWidget {
  static const String routeId = '\buyerscreen';
  const BuyersScreen({super.key});

  @override
  State<BuyersScreen> createState() => _BuyersScreenState();
}

class _BuyersScreenState extends State<BuyersScreen> {
  @override
  Widget build(BuildContext context) {
    Widget _rowHeader(int flex, String text) {
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
                'Manage Buyers',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                _rowHeader(1, 'Image'),
                _rowHeader(3, 'Full name'),
                _rowHeader(2, 'Email'),
                _rowHeader(2, 'Address'),
                _rowHeader(1, 'Delete'),
              ],
            ),
            BuyerWidget(),
          ],
        ),
      ),
    );
  }
}
