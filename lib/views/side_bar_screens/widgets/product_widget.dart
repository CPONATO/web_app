import 'package:flutter/material.dart';
import 'package:web_ap/controllers/product_controller.dart';
import 'package:web_ap/models/product.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  late Future<List<Product>> futureProducts;
  final ProductController _productController = ProductController();

  @override
  void initState() {
    super.initState();
    futureProducts = _productController.loadProducts();
  }

  void _refreshProducts() {
    setState(() {
      futureProducts = _productController.loadProducts();
    });
  }

  void _updateProductStatus(
    String productId,
    bool currentPopular,
    bool currentRecommend,
    String field,
  ) {
    bool newPopular = currentPopular;
    bool newRecommend = currentRecommend;

    if (field == 'popular') {
      newPopular = !currentPopular;
    } else {
      newRecommend = !currentRecommend;
    }

    _productController
        .updateProductStatus(
          productId: productId,
          popular: newPopular,
          recommend: newRecommend,
          context: context,
        )
        .then((_) {
          _refreshProducts();
        });
  }

  @override
  Widget build(BuildContext context) {
    Widget productData(int flex, Widget widget) {
      return Expanded(
        flex: flex,
        child: Container(
          decoration: BoxDecoration(),
          child: Padding(padding: EdgeInsets.all(8), child: widget),
        ),
      );
    }

    return FutureBuilder(
      future: futureProducts,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No Products'));
        } else {
          final products = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
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
                      productData(
                        1,
                        product.images.isNotEmpty
                            ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                product.images[0],
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 80,
                                    height: 80,
                                    color: Colors.grey[300],
                                    child: Icon(Icons.image_not_supported),
                                  );
                                },
                              ),
                            )
                            : Container(
                              width: 80,
                              height: 80,
                              color: Colors.grey[300],
                              child: Icon(Icons.image),
                            ),
                      ),
                      productData(
                        2,
                        Text(
                          product.productName,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      productData(
                        1,
                        Text(
                          "${product.productPrice.toStringAsFixed(0)} VND",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      productData(
                        1,
                        Text(
                          product.quantity.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      productData(
                        1,
                        Text(
                          product.category,
                          style: TextStyle(fontSize: 14, color: Colors.blue),
                        ),
                      ),
                      productData(
                        2,
                        Text(
                          product.description.length > 50
                              ? '${product.description.substring(0, 50)}...'
                              : product.description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      productData(
                        1,
                        GestureDetector(
                          onTap:
                              () => _updateProductStatus(
                                product.id,
                                product.popular,
                                product.recommend,
                                'popular',
                              ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  product.popular
                                      ? Colors.orange
                                      : Colors.grey[300],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  product.popular
                                      ? Icons.star
                                      : Icons.star_border,
                                  color:
                                      product.popular
                                          ? Colors.white
                                          : Colors.grey[600],
                                  size: 16,
                                ),
                                SizedBox(width: 2),
                                Text(
                                  product.popular ? 'Popular' : 'Not Popular',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color:
                                        product.popular
                                            ? Colors.white
                                            : Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      productData(
                        1,
                        GestureDetector(
                          onTap:
                              () => _updateProductStatus(
                                product.id,
                                product.popular,
                                product.recommend,
                                'recommend',
                              ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  product.recommend
                                      ? Colors.green
                                      : Colors.grey[300],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  product.recommend
                                      ? Icons.thumb_up
                                      : Icons.thumb_up_outlined,
                                  color:
                                      product.recommend
                                          ? Colors.white
                                          : Colors.grey[600],
                                  size: 16,
                                ),
                                SizedBox(width: 2),
                                Text(
                                  product.recommend
                                      ? 'Recommend'
                                      : 'Not Recommend',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color:
                                        product.recommend
                                            ? Colors.white
                                            : Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
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
