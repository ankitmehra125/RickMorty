import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

/// A class that provides methods to interact with the Rick and Morty API.
class ApiProvider {
  final String baseUrl = "https://rickandmortyapi.com/api/character";

  /// Function to get the api
  Future<dynamic> getApi() async {
    try{
      final url = Uri.parse(baseUrl);
      final response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          "User-Agent": "Flutter-App"
        },
      );
      if(response.statusCode == 200){
        final decoded = jsonDecode(response.body);
        return decoded;
      }
      else{
        debugPrint("API Error: ${response.statusCode}");
        return null;
      }
    }
    catch(e){
      debugPrint("API Error: $e");
      return null;
    }
  }
}