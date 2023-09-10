import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomButtonGPT extends StatelessWidget {
  const CustomButtonGPT({super.key});

  @override
  Widget build(BuildContext context) {
    const apiKey = "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";
    const uri =
        "https://api-inference.huggingface.co/models/EleutherAI/gpt-neo-2.7B";

    Future<String> getHttpSuggestGPT(String description) async {
      final response = await http.post(Uri.parse(uri),
          headers: {
            "Authorization": "Bearer $apiKey",
            "Content-Type": "application/json"
          },
          body: jsonEncode({
            "prompt": description,
            "max_tokens": 150,
          }));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final chatResponse = jsonResponse['choices'][0]['text'];
        return chatResponse;
      } else {
        throw Exception('Error al enviar el mensaje');
      }
    }

    return const Placeholder();
  }
}
