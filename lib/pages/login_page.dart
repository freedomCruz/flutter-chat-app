import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xfff2f2f2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            // ignore: sized_box_for_whitespace
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  
                  const Logo(titulo: 'Messenger',),
                    
                  _Form(),
                    
                  const Labels(
                    titulo: '¿No tienes cuenta?',
                    textLink: '¡Crea una ahora!',
                    ruta: 'signup',
                  ),
                    
                  const Text('Términos y condiciones de uso', style: TextStyle(fontWeight: FontWeight.w200),),
                    
                ],
              ),
            ),
          ),
        )
       ),
    );
  }
}

class _Form extends StatefulWidget {
  
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
          
             CustomInput(
              icon: Icons.email_outlined,
              hint: 'Email',
              keyboardType: TextInputType.emailAddress,
              textController: emailCtrl,
             ),
             
             CustomInput(
              icon: Icons.lock_outline,
              hint: 'Password',
              textController: passCtrl,
              isPassword: true,
             ),

              
             ElevatedButton(
              onPressed: (){
                  
              }, 
              child: const Text('Sign In'))

             
          
          ],
        ),
      ),
    );
  }
}



 