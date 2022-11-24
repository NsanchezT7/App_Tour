import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mis_libros/pages/register.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email= TextEditingController();
  final _password= TextEditingController();

  @override
  void initState(){
    //_getUser();
    super.initState();
  }

  void _showMsg(String msg){
    final scaffold =ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(content: Text(msg),
        action: SnackBarAction(
            label: 'Aceptar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
  void _validateuser() async {
    if (_email.text.isEmpty || _password.text.isEmpty) {
      _showMsg("debe digitar el correo y la contraseña");
    }else{
      var result = await _firebaseApi.logInUser(_email.text, _password.text);
      String msg ="";
      if (result=="invalid-email"){msg="el correo electronico esta mal escrito ";}
      else if (result=="wrong-password"){msg="correo o contraseña invalido";}
      else if (result=="network-request-failed"){msg="Revise su conexion a internet";}
      else{
        msg="Bienvenido";
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomePage()));
      }
      _showMsg(msg);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Image(image: AssetImage('assets/images/logo.png'),),
              const SizedBox(height: 16.0,),
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Correo Electronico'
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0,),
              TextFormField(
                controller: _password,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Contraseña'
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0,
              ),
              ElevatedButton(
                  onPressed: (){
                    _validateuser();
                  }, child: const Text('Iniciar sesión')),
              TextButton(
                style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.blue)
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: const Text('Registrese'),
              ),
            ],
          ),),
      ),
    );
  }
}
