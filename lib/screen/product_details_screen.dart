import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/prodect.dart';
import 'package:flutter_application_4/providers/firestore_provider.dart';
import 'package:flutter_application_4/widget/product_ditels_widget.dart';
import 'package:provider/provider.dart';

class ProductsDetailsScreen extends StatelessWidget {
  String catId;
  Prodect prodect;
  ProductsDetailsScreen(this.catId, this.prodect);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff85AFEE),
        title: Text("Product details".tr()),
      ),
      body: Consumer<FirestoreProvider>(builder: (y, provider, x) {
        return ProductsDetailsWidget(prodect, catId);
      }),
    );
  }
}
