import 'package:flutter/material.dart';
import 'package:football_shop/models/product_models.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'package:football_shop/widgets/products_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:football_shop/screens/product_details.dart';

class ProductEntryListPage extends StatefulWidget {
  final bool showOnlyMine;   

  const ProductEntryListPage({
    super.key,
    this.showOnlyMine = false,
  });

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {

  Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {

    final String url = widget.showOnlyMine
        ? 'http://localhost:8000/json/?filter=my'
        : 'http://localhost:8000/json/';

    final response = await request.get(url);

    List<ProductEntry> products = [];

    for (var d in response) {
      if (d != null) {
        try {
          products.add(ProductEntry.fromJson(d));
        } catch (e) {
          debugPrint("Error parsing product entry: $e");
        }
      }
    }

    debugPrint("Fetched ${products.length} products");
    return products;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.showOnlyMine ? 'My Products' : 'All Products'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          
          // LOADING
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          // ERROR
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }

          // EMPTY LIST
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                widget.showOnlyMine
                    ? "You haven't added any products yet."
                    : "There are no products yet.",
                style: const TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
              ),
            );
          }

          // PRODUCT LIST
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (_, index) {
              final product = snapshot.data![index];
              return ProductEntryCard(
                product: product,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(product: product),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
