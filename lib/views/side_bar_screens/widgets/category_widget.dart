import 'package:flutter/material.dart';
import 'package:web_ap/controllers/category_controller.dart';
import 'package:web_ap/models/category.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  late Future<List<Category>> futureCategories;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureCategories = CategoryController().loadCategories();
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
          return Center(child: Text('No Categories'));
        } else {
          final categories = snapshot.data!;
          return GridView.builder(
            shrinkWrap: true,
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 7,
              crossAxisSpacing: 7,
            ),
            itemBuilder: (context, index) {
              final Category = categories[index];
              return Column(
                children: [
                  Image.network(Category.image, height: 100, width: 100),
                  Text(Category.name),
                ],
              );
            },
          );
        }
      },
    );
  }
}
