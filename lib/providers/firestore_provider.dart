import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_4/data/firestore_helper.dart';
import 'package:flutter_application_4/data/storege_helper.dart';
import 'package:flutter_application_4/models/category_data.dart';
import 'package:flutter_application_4/models/offers_model.dart';
import 'package:flutter_application_4/models/photos_model.dart';
import 'package:flutter_application_4/models/prodect.dart';
import 'package:image_picker/image_picker.dart';

class FirestoreProvider extends ChangeNotifier {
  FirestoreProvider() {
    getAllCategories();
    getAllPhotos();
    getAllOffers();
  }
  List<Category> categories = [];
  List<Prodect> products = [];
  List<Photo> photos = [];
  List<Offer> offers = [];
  // TextEditingController categoryNameController = TextEditingController();
  // TextEditingController productNameController = TextEditingController();
  // TextEditingController productDscController = TextEditingController();
  // TextEditingController productpriceController = TextEditingController();
  // TextEditingController productquantityController = TextEditingController();
  // TextEditingController offerNameController = TextEditingController();
  // TextEditingController offerDscController = TextEditingController();
  // TextEditingController offerpriceController = TextEditingController();
  // TextEditingController offerquantityController = TextEditingController();

  File? selectedImage;
  selectImage() async {
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = File(xFile!.path);
    notifyListeners();
  }

  getAllCategories() async {
    categories = await FirestoreHelper.firestoreHelper.getAllCategories();
    notifyListeners();
  }

  getAllProducts(String catId) async {
    products = await FirestoreHelper.firestoreHelper.getAllProdects(catId);
    notifyListeners();
  }

  getAllPhotos() async {
    photos = await FirestoreHelper.firestoreHelper.getAllPhoto();
    notifyListeners();
  }

  getAllOffers() async {
    offers = await FirestoreHelper.firestoreHelper.getAllOffers();
    notifyListeners();
  }
}
