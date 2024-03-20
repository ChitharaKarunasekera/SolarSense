import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../constants/size.dart';
import '../../../../constants/text_strings.dart';
import '../dashboard/widgets/appbar.dart';

import 'package:http/http.dart' as http;

class MyPlan extends StatelessWidget {
  const MyPlan({super.key});

  // Function to fetch generated content from the API
  Future<String> fetchGeneratedContent() async {
    final url = Uri.parse('https://generativelanguage.googleapis.com/v1beta/models/gemini-1.0-pro:generateContent?key=AIzaSyAOvAI8BQUo8hH4lB792DmJb1ct4w3rJc4');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {
                "text": "Consider the peak sunlight hours are 4 hours and the system efficiency is 80%. \n\nThe method to calculate inverter capacity is,\nDaily consumption = monthly electricity consumption / 30.\ninverter capacity = daily consumption / (peak sunlight hours * system efficiency).\n\n\nlist of exact inverter capacities that are often chosen for residential use in Sri Lanka:\n1 kW: Ideal for very small installations, suitable for lighting and small appliances.\n1.5 kW: A step up, accommodating a bit more than the basic needs, like small appliances along with lighting.\n2 kW: Suitable for average households with moderate electricity consumption.\n3 kW: A good middle ground for many homes, offering the flexibility to power several appliances.\n3.5 kW: Provides a bit more capacity, useful for homes with slightly higher energy needs.\n4 kW: Suitable for homes with consistent usage patterns, including air conditioning or heating systems.\n5 kW: One of the most common residential sizes, balancing cost with the capacity to meet the energy needs of a typical family.\n6 kW: Offers additional capacity for homes with higher energy demands, including those with electric vehicle charging needs.\n7.5 kW: A higher-capacity option for large households or those with significant energy requirements.\n10 kW: Generally the upper limit for residential installations, catering to large homes with extensive energy consumption, including multiple large appliances and comprehensive air conditioning systems.\n\n\nRound off the final answer you obtain and choose the best inverter capacity from the above list. Do not provide steps."
              },
              {
                "text": "input: 550 kWh Units"
              },
              {
                "text": "output: 7.5 kW"
              },
              {
                "text": "input: 450 kWh Units"
              },
              {
                "text": "output: 5 kW"
              },
              {
                "text": "input: 250 kWh Units"
              },
              {
                "text": "output: 3.5 kW"
              },
              {
                "text": "input: 450 kWh Units"
              },
              {
                "text": "output: "
              }
            ]
          }
        ],
        "generationConfig": {
          "temperature": 0,
          "topK": 1,
          "topP": 1,
          "maxOutputTokens": 16,
          "stopSequences": []
        },
        "safetySettings": [
          {
            "category": "HARM_CATEGORY_HARASSMENT",
            "threshold": "BLOCK_MEDIUM_AND_ABOVE"
          },
          {
            "category": "HARM_CATEGORY_HATE_SPEECH",
            "threshold": "BLOCK_MEDIUM_AND_ABOVE"
          },
          {
            "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
            "threshold": "BLOCK_MEDIUM_AND_ABOVE"
          },
          {
            "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
            "threshold": "BLOCK_MEDIUM_AND_ABOVE"
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      // Navigate through the response to extract the "text" field
      final String extractedText = jsonResponse['candidates'][0]['content']['parts'][0]['text'];
      return extractedText;
    } else {
      throw Exception('Failed to load generated content');
    }
  }


  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const DashboardAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(solarSenseDashboardTitle, style: txtTheme.bodyMedium),
              Text(solarSenseDashboardHeading, style: txtTheme.displayMedium),
              const SizedBox(height: solarSenseDashboardPadding),


              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: OutlinedButton(
                      onPressed: () async {
                        try {
                          final generatedContent = await fetchGeneratedContent();
                          print(generatedContent); // For debug purposes
                          //await storeGeneratedContent(generatedContent);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Content stored successfully!")),
                          );
                        } catch (e) {
                          print(e); // For debug purposes
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Failed to generate or store content: $e")),
                          );
                        }
                      },
                      child: const Text(
                          "Generate Plan")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}