import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/prodect.dart';
import 'package:flutter_application_4/providers/firestore_provider.dart';
import 'package:provider/provider.dart';

class ProductsDetailsWidget extends StatelessWidget {
  Prodect prodect;
  String catId;
  ProductsDetailsWidget(this.prodect, this.catId);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: 220,
            width: MediaQuery.of(context).size.width,
            child: CachedNetworkImage(
              imageUrl: prodect.image,
              fit: BoxFit.cover,
            )),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              " Product Name :".tr(),
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              prodect.name,
              style: const TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          " Product Description ".tr(),
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            prodect.description,
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            prodect.description,
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            prodect.description,
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              " Product price:".tr(),
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              prodect.price.toString(),
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ],
        ),
        // const SizedBox(
        //   width: 10,
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Container(
        //     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        //     decoration: const BoxDecoration(
        //       color: Color(0xff85AFEE),
        //       borderRadius: BorderRadius.all(Radius.circular(15.0)),
        //     ),
        //     width: MediaQuery.of(context).size.width,
        //     child: ElevatedButton(
        //         child: const Text("Edit Prodect"),
        //         onPressed: () {
        //           Provider.of<FirestoreProvider>(context, listen: false)
        //               .deleteproduct(prodect, catId);
        //         }),
        //   ),
        // ),
      ],
    );
  }
}
