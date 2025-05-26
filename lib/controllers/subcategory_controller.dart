import 'dart:convert';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:web_ap/global_variable.dart';
import 'package:web_ap/models/subcategory.dart';
import 'package:http/http.dart' as http;
import 'package:web_ap/services/manage_http_response.dart';

class SubcategoryController {
  uploadSubcategory({
    required String categoryId,
    required String categoryName,
    required dynamic pickedImage,
    required String subCategoryName,
    required context,
  }) async {
    try {
      final cloudinary = CloudinaryPublic("dlfpyd3ro", 'back_api');
      //upload the image
      CloudinaryResponse imageResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(
          pickedImage,
          identifier: 'pickedImage',
          folder: 'categoryImages',
        ),
      );
      String image = imageResponse.secureUrl;
      Subcategory subcategory = Subcategory(
        id: " ",
        categoryId: categoryId,
        categoryName: categoryName,
        image: image,
        subCategoryName: subCategoryName,
      );
      http.Response response = await http.post(
        Uri.parse("$uri/api/subcategories"),
        body: subcategory.toJson(),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
      );
      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Suncategory uploaded');
        },
      );
    } catch (e) {
      print("$e");
    }
  }

  Future<List<Subcategory>> loadSubcategories() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$uri/api/subcategories'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
      );
      print(response.body);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        List<Subcategory> subcategories =
            data
                .map((subcategories) => Subcategory.fromJson(subcategories))
                .toList();
        return subcategories;
      } else {
        throw Exception('failed to load subcategories');
      }
    } catch (e) {
      throw Exception('Error loading subcategories: $e');
    }
  }
}
