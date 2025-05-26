import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:web_ap/controllers/banner_controller.dart';
import 'package:web_ap/views/side_bar_screens/widgets/banner_widget.dart';

class BannerScreen extends StatefulWidget {
  static const String routeId = '\bannerscreen';

  const BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  final BannerController _bannerController = BannerController();
  dynamic _image;
  String? fileName;
  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
        fileName = result.files.first.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Banners',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Divider(color: Colors.grey),
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child:
                            _image != null
                                ? Image.memory(_image)
                                : Text(
                                  'Banner Image',
                                  style: TextStyle(color: Colors.white),
                                ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        pickImage();
                      },
                      child: Text(
                        'Upload Banner',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text('Cancel', style: TextStyle(color: Colors.black)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () async {
                    await _bannerController.uploadBanner(
                      pickedImage: _image,
                      context: context,
                    );
                  },
                  child: Text('Save', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Divider(color: Colors.grey),
          ),
          BannerWidget(),
        ],
      ),
    );
  }
}
