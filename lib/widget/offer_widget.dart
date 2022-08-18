import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/offers_model.dart';
import 'package:flutter_application_4/providers/firestore_provider.dart';
import 'package:provider/provider.dart';

class OffersWidget extends StatelessWidget {
  Offer offer;

  OffersWidget(
    this.offer,
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Card(
        child: SizedBox(
          height: 213,
          width: 155,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: CachedNetworkImage(
                imageUrl: offer.image,
                fit: BoxFit.cover,
              )),
              const SizedBox(
                height: 30,
              ),
              Center(child: Text(offer.name)),
              Center(
                child: Text(
                  'USD ' + offer.price.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 12),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
    // TODO: implement build
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       decoration: const BoxDecoration(
//         color: Color(0xff85AFEE),
//         borderRadius: BorderRadius.all(Radius.circular(15.0)),
//       ),
//       child: Column(
//         children: [
//           SizedBox(
//               height: 180,
//               width: MediaQuery.of(context).size.width,
//               child: CachedNetworkImage(
//                 imageUrl: offer.image,
//                 fit: BoxFit.cover,
//               )),
//           SizedBox(
//             height: 10,
//           ),
//           Text(
//             offer.name,
//             style: TextStyle(
//                 fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
//           ),
//         ],
//       ),
//     );
//   }
// }
// SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         physics: const BouncingScrollPhysics(),
//                         child: Row(
//                           children: const [
//                             BigProductCard(
//                               title: 'TMA-2\nModular Headphone',
//                               imageUrl:
//                                   'https://m.media-amazon.com/images/I/51WdpaV2LjL.jpg',
//                             ),
//                             BigProductCard(
//                               title: 'Connector',
//                               imageUrl:
//                                   'https://m.media-amazon.com/images/I/71eABaZU3oL._SL1500_.jpg',
//                             ),
//                             SizedBox(
//                               height: 20,
//                             )
//                           ],
//                         ),
//                       ),