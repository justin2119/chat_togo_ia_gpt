import 'package:flutter/material.dart';
import '../services/togo_lm_service.dart';
import '../services/chat_history_service.dart';
import 'about_screen.dart';

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

  Widget _buildTogoFlag() {
    return Container(
      width: 40,
      height: 30,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white24, width: 1),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(child: Container(color: const Color(0xFF006A4E))), // Green
              Expanded(child: Container(color: const Color(0xFFFFCE00))), // Yellow
              Expanded(child: Container(color: const Color(0xFF006A4E))), // Green
              Expanded(child: Container(color: const Color(0xFFFFCE00))), // Yellow
              Expanded(child: Container(color: const Color(0xFF006A4E))), // Green
            ],
          ),
          Container(
            width: 15,
            height: 15,
            color: const Color(0xFFD21034), // Red square
            child: const Center(
              child: Icon(Icons.star, color: Colors.white, size: 10),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: _buildTogoFlag(),
          ),
          title: const Text(
            'Togo IA Chatbot',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutScreen()),
                );
              },
              icon: const Icon(Icons.info_outline),
              tooltip: 'À propos',
            ),
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
                            child: Card(
                              margin: const EdgeInsets.all(6),
                              color: const Color.fromRGBO(0, 112, 82, 1),
                              child: ListTile(
                                title: Text(msg['question'] ?? '',style: const TextStyle(color: Colors.white),),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              margin: const EdgeInsets.all(6),
                              child: ListTile(
                                title: Text(msg['answer'] ?? ''),
                              ),
                            ),
                          ),
                          const SizedBox(width: 80),
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
                      onSubmitted: (_) => _isLoading ? null : _sendMessage(),
                      decoration: const InputDecoration(
                        hintText: 'Posez votre question...',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))),
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
