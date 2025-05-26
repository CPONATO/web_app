import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:web_ap/controllers/category_controller.dart';
import 'package:web_ap/views/side_bar_screens/widgets/category_widget.dart';

class CategoryScreen extends StatefulWidget {
  static const String routeId = '\categoryscreen';

  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late String name;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CategoryController _categoryController = CategoryController();
  dynamic _bannerImage;
  dynamic _image;
  pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
      });
    }
  }

  pickBannerImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        _bannerImage = result.files.first.bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Categories',
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
                                    'Category Image',
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
                          'Upload Image',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 200,
                    child: TextFormField(
                      onChanged: (value) {
                        name = value;
                      },
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          return null;
                        } else {
                          return 'Please Enter Category Name';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter Category Name',
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Cancel', style: TextStyle(color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _categoryController.uploadCategory(
                          pickedImage: _image,
                          pickedBanner: _bannerImage,
                          name: name,
                          context: context,
                        );
                      }
                    },
                    child: Text('Save', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            Divider(color: Colors.grey),
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
                          _bannerImage != null
                              ? Image.memory(_bannerImage)
                              : Text(
                                'Category Banner',
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
                      pickBannerImage();
                    },
                    child: Text(
                      'Piack Image',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Divider(color: Colors.grey),
            CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
