import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  _ChatState createState() => _ChatState();
}

class Message {
  final String text;
  final bool isSentByUser;

  Message({required this.text, required this.isSentByUser});
}

class _ChatState extends State<Chat> {
  List<Message> messages = [];
  final TextEditingController _controller = TextEditingController();
  bool isLoading = false;

  final String apiKey = "AIzaSyDsxVjwTKDjslCsiz5B0iTniCSCqo9Fbsk";
  Future<void> sendMessage(String userInput) async {
    setState(() {
      messages.add(Message(text: userInput, isSentByUser: true));
      isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse(
          "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey",
        ),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": userInput},
              ],
            },
          ],
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final String reply =
            data["candidates"][0]["content"]["parts"][0]["text"];

        // نضيف رسالة فاضية أولاً
        setState(() {
          messages.add(Message(text: "", isSentByUser: false));
        });

        // نعرضها كلمة كلمة
        for (var word in reply.split(" ")) {
          await Future.delayed(Duration(milliseconds: 80));
          setState(() {
            messages[messages.length - 1] = Message(
              text: "${messages.last.text} $word",
              isSentByUser: false,
            );
          });
        }
      } else {
        setState(() {
          messages.add(
            Message(text: "خطأ: ${response.body}", isSentByUser: false),
          );
        });
      }
    } catch (e) {
      setState(() {
        messages.add(Message(text: "فشل الاتصال: $e", isSentByUser: false));
      });
    } finally {
      setState(() {
        isLoading = false;
        _controller.clear();
      });
    }
  }

  void _send() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      sendMessage(text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat', style: TextStyle(color: const Color(0xFFb3de00))),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[messages.length - 1 - index];
                return Align(
                  alignment: message.isSentByUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: message.isSentByUser
                          ? const Color(0xFFb3de00)
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(message.text),
                  ),
                );
              },
            ),
          ),
          if (isLoading)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Form(
                  child: Expanded(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      cursorColor: Color(0xFFb3de00),
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'اكتب سؤالك هنا...',
                        hintStyle: const TextStyle(color: Color(0xFFb3de00)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                          borderSide: BorderSide(
                            color: const Color(0xFFb3de00),
                            width: 1.w,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(
                            color: const Color(0xFFb3de00),
                            width: 1.5.r,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFb3de00),
                  ),
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.send),
                    onPressed: _send,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
