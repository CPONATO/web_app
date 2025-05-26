import 'dart:convert';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:web_ap/global_variable.dart';
import 'package:web_ap/models/banner.dart';
import 'package:http/http.dart' as http;
import 'package:web_ap/services/manage_http_response.dart';

class BannerController {
  uploadBanner({required dynamic pickedImage, required context}) async {
    try {
      final cloudinary = CloudinaryPublic("dlfpyd3ro", 'back_api');
      CloudinaryResponse imageResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromBytesData(
          pickedImage,
          identifier: 'pickedImage',
          folder: 'banners',
        ),
      );
      String image = imageResponse.secureUrl;

      BannerModel bannerModel = BannerModel(id: ' ', image: image);
      http.Response response = await http.post(
        Uri.parse("$uri/api/banner"),
        body: bannerModel.toJson(),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
      );
      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Uploaded Banner');
        },
      );
    } catch (e) {}
  }

  Future<List<BannerModel>> loadBanners() async {
    try {
      http.Response response = await http.get(
        Uri.parse('$uri/api/banner'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<BannerModel> banners =
            data.map((banner) => BannerModel.fromJson(banner)).toList();

        return banners;
      } else {
        throw Exception('Failed to load banner');
      }
    } catch (e) {
      throw Exception('Error loading Banner $e');
    }
  }
}
