import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';

class ApiService {
  Future<void> postTransaction(Map<String, dynamic> payload) async {
    if (!ApiConfig.enableRemoteSync) return;
    final res = await http.post(Uri.parse(ApiConfig.baseUrl), headers: {'Content-Type': 'application/json'}, body: jsonEncode(payload));
    if (res.statusCode >= 400) throw Exception('Sync failed');
  }
}
