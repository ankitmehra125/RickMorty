import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// A provider class for making API calls to the Rick and Morty API.
class ApiProvider {
  final String baseUrl = "https://rickandmortyapi.com/api/character";

  /// Fetches a specific page of characters
  Future<dynamic> getApi({int page = 1}) async {
    try {
      final url = Uri.parse("$baseUrl?page=$page");
      final response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "User-Agent": "Flutter-App",
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        debugPrint("API Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      debugPrint("API Error: $e");
      return null;
    }
  }
}

