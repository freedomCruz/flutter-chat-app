import 'package:flutter/material.dart';

class Labels extends StatelessWidget {

  final String titulo;
  final String textLink;
  final String ruta;

  const Labels({super.key, required this.ruta, required this.titulo, required this.textLink});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        Text(titulo, style: const TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300 ),),
        const SizedBox(height: 5,),
        GestureDetector(
          child: Text(textLink, style: TextStyle(color: Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold ),),
          onTap: () {
            Navigator.pushReplacementNamed(context, ruta);
          } 
        ),
      ],
    );
 
  }
}