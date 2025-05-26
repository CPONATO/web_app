import 'package:flutter/material.dart';
import 'package:web_ap/controllers/vendor_controller.dart';
import 'package:web_ap/models/vendor.dart';

class VendorWidget extends StatefulWidget {
  const VendorWidget({super.key});

  @override
  State<VendorWidget> createState() => _VendorWidgetState();
}

class _VendorWidgetState extends State<VendorWidget> {
  late Future<List<Vendor>> futureVendors;
  final VendorController _vendorController = VendorController();

  @override
  void initState() {
    super.initState();
    futureVendors = _vendorController.loadVendors();
  }

  void _refreshVendors() {
    setState(() {
      futureVendors = _vendorController.loadVendors();
    });
  }

  Future<void> _deleteVendor(String vendorId) async {
    // Show confirmation dialog
    bool? confirmDelete = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: Text('Are you sure you want to delete this vendor?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );

    if (confirmDelete == true) {
      await _vendorController.deleteVendor(
        vendorId: vendorId,
        context: context,
      );
      _refreshVendors(); // Refresh the list after deletion
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget vendorData(int flex, Widget widget) {
      return Expanded(
        flex: flex,
        child: Container(
          decoration: BoxDecoration(),
          child: Padding(padding: EdgeInsets.all(8), child: widget),
        ),
      );
    }

    return FutureBuilder(
      future: futureVendors,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No Vendors'));
        } else {
          final vendors = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: vendors.length,
            itemBuilder: (context, index) {
              final vendor = vendors[index];
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
                      vendorData(
                        1,
                        CircleAvatar(
                          child: Text(
                            vendor.fullName[0].toUpperCase(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      vendorData(
                        3,
                        Text(
                          vendor.fullName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      vendorData(
                        2,
                        Text(
                          vendor.email,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      vendorData(
                        2,
                        Text(
                          "${vendor.state}, ${vendor.city}, ${vendor.locality}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      vendorData(
                        1,
                        IconButton(
                          onPressed: () => _deleteVendor(vendor.id),
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
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
