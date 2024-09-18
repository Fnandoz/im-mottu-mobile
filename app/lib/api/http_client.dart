import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:marvel_app/api/paths.dart';
import 'package:marvel_app/model/character.dart';

final _baseOptions = BaseOptions(
  baseUrl: baseUrl,
  headers: {'Content-Type': 'application/json'},
  connectTimeout: const Duration(milliseconds: 30000),
  receiveTimeout: const Duration(milliseconds: 30000)
);

class HttpClient  {
  Dio dio = Dio();
  HttpClient() {
    dio = Dio(_baseOptions);
  }

  Future<List<Character>> fetchCharacters() async {
    try {
      final response = await dio.get('$charactersListEndpont?ts=1&apikey=5594c280f80182b94f0ef948a42467c1&hash=e297bab9d570364275a1507ea76b39fb');
      if (response.statusCode == 200) {
        final data = response.data['data']['results'] as List<dynamic>;
        print(data);
        List<Character> characters = data.map((characterData) {
          return Character(
            id: characterData['id'], 
            name: characterData['name'], 
            description: characterData['description'],
            thumbnail: characterData['thumbnail']['path']+ '.' + characterData['thumbnail']['extension']);
        }).toList();
        return characters;
      } else {
        throw Exception('Failed to load characters');
      }
    } catch (e) {
      throw Exception('Failed to load characters $e');
    }
  }
  

  static Map<String, dynamic> generateParameters(String timestamp, String privateKey, String publicKey) {
    Map<String, dynamic> value =  {
      'ts': timestamp,
      'apikey': publicKey,
      'key': md5.convert(utf8.encode('$timestamp$privateKey$publicKey')).toString()
      };
      return value;
  }
}