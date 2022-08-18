import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/AppRouter.dart';
import 'package:flutter_application_4/models/photos_model.dart';
import 'package:flutter_application_4/providers/firestore_provider.dart';
import 'package:flutter_application_4/screen/all_products_screen.dart';
import 'package:flutter_application_4/widget/categories_widget.dart';
import 'package:flutter_application_4/widget/offer_widget.dart';
import 'package:flutter_application_4/widget/photos_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEAF0F9),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff85AFEE),
        actions: [
          IconButton(
              onPressed: () {
                if (context.locale.toString() == "ar") {
                  context.setLocale(Locale("en"));
                } else {
                  context.setLocale(Locale("ar"));
                }
              },
              icon: const Icon(Icons.language))
        ],
        title: Text(
          "Home Screen".tr(),
        ),
      ),
      body: Consumer<FirestoreProvider>(builder: (context, provider, x) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                items: provider.photos
                    .map((e) => CachedNetworkImage(
                          imageUrl: e.imageUrl,
                          height: 200,
                          width: 500,
                        ))
                    .toList(),
                options:
                    CarouselOptions(autoPlay: true, enlargeCenterPage: true)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Categories".tr(),
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.categories.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        provider
                            .getAllProducts(provider.categories[index].catId);
                        AppRouter.NavigateToWidget(
                            ProductsScreen(provider.categories[index].catId));
                      },
                      child: CategoriesWidget(provider.categories[index],
                          provider.categories[index].catId),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Special Offers".tr(),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.offers.length,
                  itemBuilder: (context, index) {
                    return OffersWidget(provider.offers[index]);
                  }),
            )
          ],
        );
      }),
    );
  }
}
