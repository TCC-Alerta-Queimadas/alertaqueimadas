
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../input_field.dart';
import '../../model/usuario_model.dart';
import '../usuario/usuario_page.dart';


class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool ver = false;
  UsuarioModel usuario = UsuarioModel();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   
    
    return Scaffold(
      
      backgroundColor: Colors.black,
         body: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children: [ 
                   SizedBox(
                     child: Image.network("image/fogo.png")   
                   ),
                  InputField(
                    "Email",
                    Icons.email,
                    false,
                    onsaved: (email) => usuario.email = email,
                    
                  ),
                  InputField(
                    "Senha",
                    Icons.password,
                    true,
                    onsaved: (senha) => usuario.senha = senha,
                    
                  ),
                  SizedBox(
                    height: 20, 
                                       
                  ),
                  _botaoEntrar(),
                  _botaoCadastar(),
                ],
              ),
            ),
          ),
          );
  }

  _botaoEntrar() {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
              
          style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 245, 100, 4)
          
        ),
                onPressed: () async {
                  await _login();
                  Navigator.of(context).pop();
                },
                child: Text("Entrar"))),
      ],
    );
  }

  _botaoCadastar() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Não tem uma conta?  ",style: TextStyle(
          color: Colors.grey,
        ),),
        TextButton(
          
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => UsuarioPage()));
            },
            child: Text("Cadastre-se",
            style: TextStyle(
              color: Color.fromARGB(255, 245, 100, 4),
            )
            ))
      ]),
    );
  }

  Future<void> _login() async {
    _key.currentState!.save();

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: usuario.email!, password: usuario.senha!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Nenhum usuário com este email.');
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email desconhecido!")));
      } else if (e.code == 'wrong-password') {
        print('Senha incorreta.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Senha incorreta!")));

      }
    }
  }
}
