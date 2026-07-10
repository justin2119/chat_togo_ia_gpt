import 'package:flutter/material.dart';
import '../services/togo_lm_service.dart';
import '../services/chat_history_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  bool _isLoading = false;
  final ScrollController _scrollController = ScrollController();
  final ChatHistoryService _historyService = ChatHistoryService();

  @override
  void initState() {
    super.initState();
    _loadChatHistory();
  }

  Future<void> _loadChatHistory() async {
    final history = await _historyService.loadHistory();
    setState(() {
      _messages.addAll(history);
    });
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  void _sendMessage() async {
    final prompt = _controller.text.trim();

    if (prompt.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('veuillez entrer une question sur le Togo')),
      );
      return;
    }

    final userMessage = {'question': prompt, 'answer': '...'};
    setState(() {
      _messages.add(userMessage);
      _isLoading = true;
      _controller.clear();
    });
    _scrollToBottom();

    final service = TogoLmService();
    final response = await service.query(prompt);

    setState(() {
      _messages.last['answer'] = response;
      _isLoading = false;
    });
    
    await _historyService.saveHistory(_messages);
    _scrollToBottom();
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
            IconButton(
              onPressed: () async {
                await _historyService.clearHistory();
                setState(() {
                  _messages.clear();
                });
              },
              icon: const Icon(Icons.delete_sweep),
              tooltip: 'Effacer l\'historique',
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
          centerTitle: true,
          elevation: 10,
          backgroundColor: const Color.fromRGBO(0, 112, 82, 1),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final msg = _messages[index];
                  return Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 80),
                          Expanded(
                            child: Card.outlined(
                              margin: const EdgeInsets.all(6),
                              color: const Color.fromRGBO(0, 112, 82, 1),
                              child: ListTile(
                                title: Text("${_messages[index]['question']}",
                                  style: const TextStyle(color: Colors.white,fontSize: 20),),
                              ),
                            ),
                          ),
                        ],
                      ),
                      _messages[index]['answer'] == null ?
                          const SizedBox():
                          Row(
                            children: [
                              Expanded(
                                child: Card.outlined(
                                  color: Colors.white,
                                  margin: const EdgeInsets.all(6),
                                  child: ListTile(
                                    title: Text(_messages[index]['answer']??"",
                                      style: const TextStyle(color: Colors.black,fontSize: 20),),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 80,),
                            ],
                          )
                    ],
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Posez votre question sur le Togo...',
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        maxLines: null,
                      ),
                    ),
                    IconButton(
                      icon: _isLoading
                          ? const CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Color.fromRGBO(0, 112, 82, 1),
                            )
                          : const Icon(Icons.send_rounded,
                              color: Color.fromRGBO(0, 112, 82, 1)),
                      onPressed: _isLoading ? null : _sendMessage,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
