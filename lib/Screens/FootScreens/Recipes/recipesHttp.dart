import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

fetchHttpRecipes(url) {
  var client = http.Client();
  return client.get(url);
}