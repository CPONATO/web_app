import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web_ap/global_variable.dart';
import 'package:web_ap/models/vendor.dart';
import 'package:web_ap/services/manage_http_response.dart';

class VendorController {
  Future<List<Vendor>> loadVendors() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$uri/api/vendors'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Vendor> vendors =
            data.map((vendor) => Vendor.fromMap(vendor)).toList();

        return vendors;
      } else {
        throw Exception('Failed to load vendor');
      }
    } catch (e) {
      throw Exception('Error loading vendor $e');
    }
  }

  // Delete vendor function
  Future<void> deleteVendor({
    required String vendorId,
    required context,
  }) async {
    try {
      http.Response response = await http.delete(
        Uri.parse('$uri/api/user/delete-account/$vendorId'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
      );

      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Vendor deleted successfully');
        },
      );
    } catch (e) {
      showSnackBar(context, 'Error deleting vendor: $e');
    }
  }
}
