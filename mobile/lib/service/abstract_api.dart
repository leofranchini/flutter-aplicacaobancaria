import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class AbstractApi<T> {
  final String _urlLocalHost = 'http://localhost:3000/transacoes'; 
  final String _recurso;

  AbstractApi(this._recurso);

  Future<String> getAll() async {
    var response = await http.get(Uri.parse('$_urlLocalHost/$_recurso'));
    return response.body;
  }

  Future<String> getById(int id) async {
    var response = await http.get(Uri.parse('$_urlLocalHost/$_recurso/$id'));
    return response.body;
  }

  Future<String> create(Map<String, dynamic> item) async {
    final response = await http.post(
      Uri.parse('$_urlLocalHost/$_recurso'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(item),
    );
    return response.body;
  }

  Future<String> update(int id, Map<String, dynamic> item) async {
    final response = await http.put(
      Uri.parse('$_urlLocalHost/$_recurso/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(item),
    );
    return response.body;
  }

  Future<void> delete(int id) async {
    await http.delete(Uri.parse('$_urlLocalHost/$_recurso/$id'));
  }
}
