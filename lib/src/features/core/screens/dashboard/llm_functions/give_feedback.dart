import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AnalyzeStatistics extends GetxController {
  static AnalyzeStatistics get instance => Get.find();


  // Function to fetch generated content from the API
  Future<String> fetchRecommendedEquipment(String consumption, String inverter, String panelOutput) async {

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
                "text":
                '''Objective: The task is to select the most suitable solar panel and inverter from an array of options based on expected solar panel output wattage and expected inverter capacity. This decision-making process should prioritize compatibility, efficiency, and capacity to meet or exceed the given expectations and the actual electricity production required.
                Input Specifications:
                Required Annual Electricity Production: $consumption,
                Expected Solar Panel Output Wattage: $panelOutput,
                Expected Inverter Capacity: $inverter.
                
                
                Available Solar Panels:
                List of panels: PanelModel(productId: panel_001, brand: JA Solar, efficiency: 19.5%, technology: Monocrystalline, warranty: 12 years, performance: 25 years, wattage: 460W, cost: 68,500), PanelModel(productId: panel_002, brand: SAKO, efficiency: 21%, technology: Monocrystalline, warranty: 12 years, performance: 25 years, wattage: 550W, cost: 55,000), PanelModel(productId: panel_003, brand: JA Solar, efficiency: 19.5%, technology: Monocrystalline, warranty: 12 years, performance: 25 years, wattage: 540W, cost: 80,000), PanelModel(productId: panel_004, brand: REC Solar, efficiency: 21%, technology: Polycrystalline, warranty: 12 years, performance: 25 years, wattage: 150W, cost: 65,000), PanelModel(productId: panel_005, brand: SAKO, efficiency: 20%, technology: Monocrystalline, warranty: 10 years, performance: 20 years, wattage: 450W, cost: 49,000),
                
                Available Inverters:
                List of inverters: InverterModel(productId: inverter_008, brand: SAKO, capacity: 8kW, efficiency: 96%, warranty: 10 years, cost: 320,000, hybridCompatibility: no), InverterModel(productId: inverter_001, brand: SMA, capacity: 3kW, efficiency: 97%, warranty: 5 years, cost: 130,000, hybridCompatibility: yes), InverterModel(productId: inverter_002, brand: Growatt, capacity: 1kW, efficiency: 95%, warranty: 5 years, cost: 50,000, hybridCompatibility: no), InverterModel(productId: inverter_003, brand: Fronius, capacity: 5kW, efficiency: 98%, warranty:  7 years, cost: 210,000, hybridCompatibility: yes), InverterModel(productId: inverter_004, brand: Huawei, capacity: 7.5kW, efficiency: 96.5%, warranty: 10 years, cost: 320,000, hybridCompatibility: yes), InverterModel(productId: inverter_006, brand: Fronius, capacity: 3kW, efficiency: 97%, warranty: 7 years, cost: 130,000, hybridCompatibility: yes), InverterModel(productId: inverter_005, brand: Schneider Electric, capacity: 20kW, efficiency: 85.5%, warranty: 5 years, cost: 430,000, hybridCompatibility: yes), InverterModel(productId: inverter_007, brand: SMA, capacity: 10kW, efficiency: 98.5%, warranty: 10 years, cost: 430,000, hybridCompatibility: yes), 
                
                Task Steps:
                Match Solar Panel Output with Inverter Capacity:
                Identify which solar panels meet or exceed the expected output wattage.
                From these, select the solar panel(s) with the highest efficiency.
                Ensure the total potential output does not exceed the capacity of the chosen inverter.
                
                Inverter Selection:
                Based on the chosen solar panel(s), select an inverter that can handle the output efficiently without being underutilized or overloaded.
                Consider the efficiency of the inverter and its compatibility with the selected solar panel(s).
                
                Recommendation:
                Provide a recommendation for the most suitable solar panel and inverter combination, only output the inverterID, panelID, and the noOfPanles.
                
                Constraints and Considerations:
                The selected solar panel and inverter must not only meet the specified requirements but also maximize efficiency and longevity.
                Consider potential future expansions or limitations in your selection process.
                
                Output Format:
                \"Recommended panelId: [Insert choice, e.g., panel_004], Recommended InverterId: [Insert choice, e.g.,  inverter_008], Recommended noOfPanels: [Insert choice, e.g., 8 panels]\"
                
                Do NOT provide explanations, only provide the expected output.'''
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