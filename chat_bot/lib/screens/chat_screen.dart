import 'package:flutter/material.dart';
import '../services/togo_lm_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState()=>_ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  bool _isLoading = false;
  ScrollController scrollController = ScrollController();

  void _sendMessage() async {
    final prompt = _controller.text.trim();

    if (prompt.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('veuillez entrer une question sur le Togo')),
      );
      return;
    }
    setState(() {
      _messages.add({'question': prompt});
      _isLoading = true;
      _controller.clear();
    });

    final service = TogoLmService();
    final response = await service.query(prompt);
    setState(() {
      _messages.add({'answer': response});
      _isLoading = false;
      scrollController.jumpTo(
          scrollController.position.maxScrollExtent + 800);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Togo IA Chatbot',
            style: TextStyle(fontSize: 30),
          ),
          foregroundColor: Colors.white,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
          centerTitle: true,
          elevation: 10,
          backgroundColor: const Color.fromRGBO(0, 112, 82, 5),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 80,),
                          Expanded(
                            child: Card.outlined(
                              margin: const EdgeInsets.all(6),
                              child: ListTile(
                                title: Text("${_messages[index]['question']}"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Card.outlined(
                              margin: const EdgeInsets.all(6),
                              child: ListTile(
                                title: Text("${_messages[index]['answer']}"),
                              ),
                            ),
                          ),
                          const SizedBox(width: 80,),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            if (_isLoading) const LinearProgressIndicator(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Enter prompt...',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _isLoading ? null : _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
