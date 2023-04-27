// Dart

import 'dart:convert';
import 'dart:html';

void handleSubmit(Event event) {
  event.preventDefault();
  FormData formData = FormData(event.target);
  Map<String, dynamic> jsonData = {};
  formData.forEach((key, value) => jsonData[key] = value);
  String jsonText = JsonEncoder.withIndent('  ').convert(jsonData);
  print(jsonText);
}
