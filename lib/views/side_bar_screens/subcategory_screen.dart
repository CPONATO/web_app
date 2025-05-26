import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:web_ap/controllers/category_controller.dart';
import 'package:web_ap/controllers/subcategory_controller.dart';
import 'package:web_ap/models/category.dart';
import 'package:web_ap/views/side_bar_screens/widgets/subcategory_widget.dart';

class SubcategoryScreen extends StatefulWidget {
  static const String routeId = '\subcategoryscreen';
  const SubcategoryScreen({super.key});

  @override
  State<SubcategoryScreen> createState() => _SubcategoryScreenState();
}

class _SubcategoryScreenState extends State<SubcategoryScreen> {
  final SubcategoryController subcategoryController = SubcategoryController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Future<List<Category>> futureCategories;
  dynamic _image;
  late String name;
  Category? selectedCategory;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureCategories = CategoryController().loadCategories();
  }

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
                  'SubCategories',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Divider(color: Colors.grey),
            ),
            FutureBuilder<List<Category>>(
              future: futureCategories,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No Category'));
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<Category>(
                      value: selectedCategory,
                      hint: Text('Select Category'),
                      items:
                          snapshot.data!.map((Category category) {
                            return DropdownMenuItem(
                              value: category,
                              child: Text(category.name),
                            );
                          }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value;
                        });
                        print(selectedCategory!.name);
                      },
                    ),
                  );
                }
              },
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
                                    'SubCategory Image',
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
                          return 'Please Enter SubCategory Name';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter SubCategory Name',
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await subcategoryController.uploadSubcategory(
                          categoryId: selectedCategory!.id,
                          categoryName: selectedCategory!.name,
                          pickedImage: _image,
                          subCategoryName: name,
                          context: context,
                        );

                        setState(() {
                          _formKey.currentState!.reset();
                          _image = null;
                        });
                      }
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
            SubcategoryWidget(),
          ],
        ),
      ),
    );
  }
}
