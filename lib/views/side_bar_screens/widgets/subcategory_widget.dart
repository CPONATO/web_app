import 'package:flutter/material.dart';
import 'package:web_ap/controllers/subcategory_controller.dart';
import 'package:web_ap/models/subcategory.dart';

class SubcategoryWidget extends StatefulWidget {
  const SubcategoryWidget({super.key});

  @override
  State<SubcategoryWidget> createState() => _SubcategoryWidgetState();
}

class _SubcategoryWidgetState extends State<SubcategoryWidget> {
  late Future<List<Subcategory>> futureCategories;
  @override
  void initState() {
    super.initState();
    futureCategories = SubcategoryController().loadSubcategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureCategories,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No Subcategories'));
        } else {
          final subcategories = snapshot.data!;
          return GridView.builder(
            shrinkWrap: true,
            itemCount: subcategories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 7,
              crossAxisSpacing: 7,
            ),
            itemBuilder: (context, index) {
              final subcategory = subcategories[index];
              return Column(
                children: [
                  Image.network(subcategory.image, height: 100, width: 100),
                  Text(subcategory.subCategoryName),
                ],
              );
            },
          );
        }
      },
    );
  }
}
