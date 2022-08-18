import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/AppRouter.dart';
import 'package:flutter_application_4/models/category_data.dart';
import 'package:flutter_application_4/providers/firestore_provider.dart';
import 'package:flutter_application_4/screen/all_products_screen.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  Category category;
  String catId;

  CategoriesWidget(this.category, this.catId);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CircleAvatar(
              radius: 40, backgroundImage: NetworkImage(category.imageUrl)),
          const SizedBox(
            height: 5,
          ),
          Text(
            category.name,
            style: const TextStyle(
                fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
