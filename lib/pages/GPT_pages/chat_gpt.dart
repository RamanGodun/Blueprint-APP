// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';

// class ChatPage extends StatefulWidget {
//   const ChatPage({super.key});

//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   final TextEditingController _controller = TextEditingController();
//   String _response = 'No response yet';
//   final Dio _dio = Dio();

//   void _sendMessage() async {
//     final String text = _controller.text;
//     try {
//       final response = await _dio.post(
//         'URL_API_CHAT_GPT', // Замініть URL вашим URL API
//         data: {
//           'question': text,
//         },
//         options: Options(
//           headers: {
//             'Content-Type': 'application/json',
//           },
//         ),
//       );

//       setState(() {
//         _response = response.data['answer'] ?? 'No answer provided by API';
//       });
//     } on DioException catch (e) {
//       setState(() {
//         _response = 'Error: ${e.response?.statusCode ?? 'No status code'}';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Chat with GPT'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: _controller,
//               decoration: const InputDecoration(
//                 labelText: 'Enter your question',
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _sendMessage,
//               child: const Text('Send'),
//             ),
//             const SizedBox(height: 20),
//             Text(_response),
//           ],
//         ),
//       ),
//     );
//   }
// }
