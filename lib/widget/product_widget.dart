import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/prodect.dart';
import 'package:flutter_application_4/providers/firestore_provider.dart';
import 'package:provider/provider.dart';

class productsWidget extends StatelessWidget {
  Prodect prodect;
  String catId;
  productsWidget(this.prodect, this.catId);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: const BoxDecoration(
        color: Color(0xff85AFEE),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: CachedNetworkImage(
                  imageUrl: prodect.image,
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(prodect.name,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),

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
      ),
    );
  }
}
