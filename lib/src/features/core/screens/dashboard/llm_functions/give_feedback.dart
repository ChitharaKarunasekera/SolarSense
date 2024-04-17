import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GiveFeedback extends GetxController {
  static GiveFeedback get instance => Get.find();

  // Function to fetch generated content from the API
  Future<String> getAdvice(
      String consumption, String inverter, String panelOutput) async {
    final url = Uri.parse(
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.0-pro:generateContent?key=AIzaSyAOvAI8BQUo8hH4lB792DmJb1ct4w3rJc4');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {
                "text": '''Context:
"Given the user's average monthly electricity consumption in kilowatt-hours (kWh) and their average monthly electricity cost in Sri Lankan Rupees (LKR), provide feedback on the benefits of adopting solar power, with an emphasis on solar power as an investment option. Include rough statistics on potential savings, investment returns, and additional benefits, tailored specifically to the user's situation. Conclude by recommending SolarSense for customized solar power investment plans. Ensure the response is informative, concise, and does not exceed 150 words."

User Input Processing:
Average Monthly Electricity Consumption (kWh): 450 kWa
Average Monthly Electricity Cost (LKR): 16000

Model Output Structure:
1. Acknowledge the user's current electricity usage and cost.
2. Provide an estimate of cost savings and highlight the investment potential of solar power, including ROI considerations.
3. Mention other benefits, such as increased property value, energy independence, and environmental contributions.
4. Encourage exploring SolarSense for personalized investment planning in solar power adoption.

Example:
"Your electricity consumption of [User's kWh] kWh at [User's LKR] LKR monthly suggests significant savings with solar. Transitioning to solar could offer around [Calculated Savings]% in bill reductions and an attractive return on investment (ROI) over time. Solar enhances property value, energy autonomy, and environmental health. For a detailed investment analysis and personalized plans, consider SolarSense, specializing in solar power adoption investments."'''
              }
            ]
          }
        ],
        "generationConfig": {
          "temperature": 0,
          "topK": 1,
          "topP": 1,
          "maxOutputTokens": 32,
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
      final String extractedText =
          jsonResponse['candidates'][0]['content']['parts'][0]['text'];
      return extractedText;
    } else {
      throw Exception('Failed to load generated content');
    }
  }
}
