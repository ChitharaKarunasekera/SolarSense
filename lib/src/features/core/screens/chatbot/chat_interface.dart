import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solarsense/src/constants/colors.dart';

import 'package:google_generative_ai/google_generative_ai.dart';

import 'package:http/http.dart' as http;

class ChatInterface extends StatefulWidget {
  const ChatInterface({Key? key}) : super(key: key);

  @override
  _ChatInterfaceState createState() => _ChatInterfaceState();
}

class _ChatInterfaceState extends State<ChatInterface> {
  final List<Message> messages = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Start the conversation with a greeting from the bot
    _addMessage("Hello there! I am SolarSense, and I am a here to assist you with solar power adoption. How may I help you today?",
        isBot: true);
  }

  void _sendMessage(String text) {
    if (text.isNotEmpty) {
      // Add user message to the chat
      _addMessage(text, isBot: false);

      // Clear input field
      _controller.clear();

      // Generate and add bot response
      _generateBotResponse(text);
    }
  }

  void _addMessage(String text, {required bool isBot}) {
    setState(() {
      messages.add(Message(text: text, isBot: isBot));
    });
  }

  Future<void> _generateBotResponse(String userMessage) async {
    // final url = Uri.parse(
    //     'https://generativelanguage.googleapis.com/v1beta3/tunedModels/solar-sense-palm-001:generateText');
    //
    // // Assuming you have a method to obtain the access token, replace 'your_access_token' with the actual method call
    // const accessToken =
    //     'ya29.a0Ad52N38UmpqlqYtWzDh2m0PrzS0bVnNN4wPTUOsFa0xnWA8Xvna-wtcpCfciSzNNMwZ1tR4ieIIJffy-AcMuSt_vx3U3OBI90yBmh1d_uBFQmxY9y0I-HnwHfO7uqgvS5zMHiYaJwBgbO3ZGkBM_EwNw-r4MIF_laRNmaCgYKASUSARESFQHGX2Mi07L8QSu8FgFhrvoUOpVvGw0171'; // You should replace this with the actual method to obtain the access token.
    //
    // final response = await http.post(
    //   url,
    //   headers: {
    //     'Authorization': 'Bearer $accessToken',
    //     'Content-Type': 'application/json'
    //   },
    //   body: jsonEncode({
    //     "prompt": {
    //       "text":
    //           userMessage
    //     },
    //     "temperature": 0.7,
    //     "top_k": 40,
    //     "top_p": 0.95,
    //     "candidate_count": 1,
    //     "max_output_tokens": 8192,
    //     "stop_sequences": [],
    //     "safety_settings": [
    //       {
    //         "category": "HARM_CATEGORY_DEROGATORY",
    //         "threshold": "BLOCK_LOW_AND_ABOVE"
    //       },
    //       {
    //         "category": "HARM_CATEGORY_TOXICITY",
    //         "threshold": "BLOCK_LOW_AND_ABOVE"
    //       },
    //       {
    //         "category": "HARM_CATEGORY_VIOLENCE",
    //         "threshold": "BLOCK_MEDIUM_AND_ABOVE"
    //       },
    //       {
    //         "category": "HARM_CATEGORY_SEXUAL",
    //         "threshold": "BLOCK_MEDIUM_AND_ABOVE"
    //       },
    //       {
    //         "category": "HARM_CATEGORY_MEDICAL",
    //         "threshold": "BLOCK_MEDIUM_AND_ABOVE"
    //       },
    //       {
    //         "category": "HARM_CATEGORY_DANGEROUS",
    //         "threshold": "BLOCK_MEDIUM_AND_ABOVE"
    //       }
    //     ]
    //   }),
    // );
    //
    // if (response.statusCode == 200) {
    //   final jsonResponse = jsonDecode(response.body);
    //   // Assuming the response structure is similar, navigate through the response to extract the desired text
    //   final String extractedText = jsonResponse['candidates'][0]['output']; // Adjust this based on the actual response structure
    //   _addMessage(extractedText, isBot: true);
    // } else {
    //   throw Exception('Failed to load generated content');
    // }

    final url = Uri.parse(
      //'https://generativelanguage.googleapis.com/v1beta/tunedModels/solar-sense-gemini-3602:generateContent?key=AIzaSyAOvAI8BQUo8hH4lB792DmJb1ct4w3rJc4');
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.0-pro:generateContent?key=AIzaSyAOvAI8BQUo8hH4lB792DmJb1ct4w3rJc4');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": "You are a solar energy expert in Sri Lanka, and you are helping a customer with a solar system adoption in Sri Lanka. Make the output shorter than 50 words."}
            ],

            "role": "user",
            "parts": [
              {"text": "hello"}
            ]
          },
          {
            "role": "model",
            "parts": [
              {
                "text":
                "Hello there! I am SolarSense, and I am a here to assist you with solar power adoption. How may I help you today?"
              }
            ]
          },
          {
            "role": "user",
            "parts": [
              {"text": "what is the best location for solar panels?"}
            ]
          }
        ],
        "generationConfig": {
          "temperature": 1,
          "topK": 1,
          "topP": 1,
          "maxOutputTokens": 512,
          "stopSequences": []
        },
        "safetySettings": []
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final String extractedText =
          jsonResponse['candidates'][0]['content']['parts'][0]['text'];
      // Use the extracted text as the bot's response
      _addMessage(extractedText, isBot: true);
    } else {
      throw Exception('Failed to load generated content');
    }

    /// #####################################################################

    // Access your API key as an environment variable (see "Set up your API key" above)
    // final apiKey = 'AIzaSyAOvAI8BQUo8hH4lB792DmJb1ct4w3rJc4';
    // if (apiKey == null) {
    //   print('No \$API_KEY environment variable');
    //   exit(1);
    // }
    //
    // // For text-only input, use the gemini-pro model
    // final model = GenerativeModel(
    //     model: 'gemini-pro',
    //     apiKey: apiKey,
    //     generationConfig: GenerationConfig(maxOutputTokens: 100));
    // // Initialize the chat
    // final chat = model.startChat(history: [
    //   Content.text('You are a solar energy expert, and you are helping a customer with a solar panel installation. The customer asks you about the best location for the solar panels. What do you tell them?'),
    //   Content.model([TextPart('Hello there! I am SolarSense, and I am a here to assist you with solar power adoption. How may I help you today?')])
    // ]);
    // var content = Content.text(userMessage);
    // var response = await chat.sendMessage(content);
    // print(response.text);
    // _addMessage(response.text as String, isBot: true);
  }

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                for (Message message in messages)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Align(
                      alignment: message.isBot
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: message.isBot
                                ? SolarSenseColors.primaryColor.withOpacity(0.8)
                                : SolarSenseColors.primaryColor
                                    .withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Text(message.text, style: txtTheme.bodyText1),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: "Type your message here...",
              suffixIcon: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => _sendMessage(_controller.text),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class Message {
  final String text;
  final bool isBot;

  Message({required this.text, required this.isBot});
}
