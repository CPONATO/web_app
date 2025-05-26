import 'package:flutter/material.dart';
import 'package:web_ap/controllers/buyer_controller.dart';
import 'package:web_ap/models/buyer.dart';

class BuyerWidget extends StatefulWidget {
  const BuyerWidget({super.key});

  @override
  State<BuyerWidget> createState() => _BuyerWidgetState();
}

class _BuyerWidgetState extends State<BuyerWidget> {
  late Future<List<Buyer>> futureBuyers;

  @override
  void initState() {
    super.initState();
    futureBuyers = BuyerController().loadBuyers();
  }

  @override
  Widget build(BuildContext context) {
    Widget buyerData(int flex, Widget widget) {
      return Expanded(
        flex: flex,
        child: Container(
          decoration: BoxDecoration(),
          child: Padding(padding: EdgeInsets.all(8), child: widget),
        ),
      );
    }

    return FutureBuilder(
      future: futureBuyers,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No Banners'));
        } else {
          final buyers = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: buyers.length,

            itemBuilder: (context, index) {
              final buyer = buyers[index];
              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300, width: 1.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      buyerData(
                        1,
                        CircleAvatar(
                          child: Text(
                            buyer.fullName[0].toUpperCase(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      buyerData(
                        3,
                        Text(
                          buyer.fullName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      buyerData(
                        2,
                        Text(
                          buyer.email,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      buyerData(
                        2,
                        Text(
                          "${buyer.state}, ${buyer.city}, ${buyer.locality}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      buyerData(
                        1,
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
