import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/AppRouter.dart';
import 'package:flutter_application_4/providers/firestore_provider.dart';
import 'package:flutter_application_4/screen/product_details_screen.dart';
import 'package:flutter_application_4/widget/product_widget.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  String catId;
  ProductsScreen(this.catId);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff85AFEE),
        title: Text("Products Screen".tr()),
      ),
      body: Consumer<FirestoreProvider>(builder: (y, provider, x) {
        return provider.products.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                itemCount: provider.products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        AppRouter.NavigateToWidget(ProductsDetailsScreen(
                            catId, provider.products[index]));
                      },
                      child: productsWidget(provider.products[index], catId));
                });
      }),
    );
  }
}
