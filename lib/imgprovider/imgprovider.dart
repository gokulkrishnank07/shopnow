import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Imgprovider extends ChangeNotifier {
  String? _imageUrl;

  String? get imageUrl => _imageUrl;

  Future<void> uploadImage(File image) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('https://api.escuelajs.co/api/v1/files/upload'),
    );

    request.files.add(await http.MultipartFile.fromPath('file', image.path));

    final response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final jsonResponse = jsonDecode(responseString);
      _imageUrl = jsonResponse['url'];
      notifyListeners();
    } else {
      throw Exception('Failed to upload image');
    }
  }
}