import 'dart:io';

import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {

  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  List<ChatMessage> _message = [];
  bool _isWriting = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            const CircleAvatar(
              minRadius: 14,
              child: Text('Te', style: TextStyle(fontSize: 12),),
            ),
            Text('Sandra Bulok', style: TextStyle(fontSize: 14, color: Colors.grey[700]),)
          ],
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _message.length,
                itemBuilder: (_, i) => _message[i],
                reverse: true,
              )
            ),
            Divider(height: 1,),

            Container(
              color: Colors.white,
              child: _inputChat(),

            ),

          ],
        ),
      )
   );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (String texto){
                  setState(() {
                    texto.trim().isNotEmpty
                    ? _isWriting = true
                    :_isWriting = false;
                  });
                },
                decoration: const InputDecoration.collapsed(
                  hintText: 'Enviar Mensaje'
                ),
                focusNode: _focusNode,
              )
            ),

            // Botón de enviar
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS
              ? CupertinoButton(
                onPressed: _isWriting
                  ? () => _handleSubmit(_textController.text.trim())
                  : null,
                child: const Text('Enviar'),
              )
              : Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IconTheme(
                  data: IconThemeData(color: Colors.blue[400]),
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: _isWriting
                      ? () => _handleSubmit(_textController.text.trim())
                      : null, 
                    icon: const Icon(Icons.send,)
                  ),
                ),
              )
              
            )
          ]
        ),
      )
    );

  }
    _handleSubmit(String texto){

      if(texto.isEmpty) {
        
        return;

      }
     
      _textController.clear();
      _focusNode.requestFocus();

      final newMessage = ChatMessage(
        texto: texto, 
        uid: '123',
        animationController: AnimationController(vsync: this, duration: const Duration(milliseconds: 400)),
      );
      _message.insert(0, newMessage);
      newMessage.animationController.forward();

      setState(() {
        _isWriting = false; 
      });
    }

    @override
  void dispose() {
    // TODO: off socket
    for(ChatMessage message in _message){
      message.animationController.dispose();
    }
    super.dispose();
  }
}