import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopnow/model/productmodel.dart';

class ProviderService {
  
  Future<List<Productmodel>> getAll() async {
    const url = 'https://fakestoreapi.com/products';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e) {
        return Productmodel(
            id: e['id'],
            title: e['title'],
            price: e['price'],
            category: e['category'],
            description: e['description'],
            image: e['image']);
      }).toList();
      return todos;
    }
    return [];
  }
}


class Providerserver {
  Future<Productmodel?> getDetials(int id) async {
    Productmodel? readData;
    var url = 'https://fakestoreapi.com/products/$id';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    print("Response: ${response.body}");

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      readData = Productmodel.fromJson(json);

      return readData;
    } else {
      print('Failed to load product');
      return null;
    }
  }
}
