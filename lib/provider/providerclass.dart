import 'package:flutter/material.dart';
import 'package:shopnow/model/productmodel.dart';
import 'package:shopnow/provider/listapiservice.dart';

class Providerclass extends ChangeNotifier {
  final _service = ProviderService();
  bool isLoading = false;
  List<Productmodel> _todos = [];
  List<Productmodel> get todos => _todos;
  List<Productmodel> get posts => _todos;

  Future<void> getAllData() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAll();

    _todos = response;
    isLoading = false;
    notifyListeners();
  }
}

class Providerchange extends ChangeNotifier {
  final Providerserver apiservice = Providerserver();
  bool _isLoading = false;
  Productmodel? productDetails;

  bool get isLoading => _isLoading;
  Productmodel? get productDetials => productDetails;

  Future<void> getAllDetials(id) async {
    _isLoading = true;
    notifyListeners();

    try {
      productDetails = (await apiservice.getDetials(id));
    } catch (e) {
      print('Error fetching product details: $e');
      productDetails = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
