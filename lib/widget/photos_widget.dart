import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/photos_model.dart';
import 'package:flutter_application_4/providers/firestore_provider.dart';
import 'package:provider/provider.dart';

class PhotosWidget extends StatelessWidget {
  Photo photo;
  PhotosWidget(this.photo);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff85AFEE),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          SizedBox(
              height: 200,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: photo.imageUrl,
                fit: BoxFit.cover,
              )),
        ],
      ),
      // margin: ,
      // padding: EdgeInsets.all(10),
      // decoration: const BoxDecoration(
      //   color:  Color(0xff85AFEE),
      //   borderRadius: BorderRadius.all(Radius.circular(10)),
      // ),
      // height: 150,
      // width: double.infinity,
      // child: Image.network(
      //   photo.imageUrl,
      //   fit: BoxFit.cover,
      // ),
    );
  }
}
