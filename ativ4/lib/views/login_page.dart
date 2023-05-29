import 'package:flutter/material.dart';
import 'package:ativ4/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';

// ignore: camel_case_types
class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

// ignore: camel_case_types
class _Login_PageState extends State<Login_Page> {
  final _form = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appbar = AppBar();
    var size = MediaQuery.of(context).size;
    var comprimento = size.width;
    var altura = (size.height - appbar.preferredSize.height) -
        MediaQuery.of(context).padding.top;

    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: <Widget>[
// 
//  TEXTO SIGN IN
//
        Container(
          margin: EdgeInsets.only(top: altura * 0.25, left: comprimento * 0.35),
          height: altura * 0.06,
          width: comprimento * 0.3,
          alignment: Alignment.center,
          child: const Text("Log in",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              )),
        ),
// 
//  FIM TEXTO SIGN UP
//

// 
//  CAMPO EMAIL
//
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3f000000),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
            color: Colors.white,
          ),
          margin:
              EdgeInsets.only(top: altura * 0.40, left: comprimento * 0.0725),
          height: altura * 0.085,
          width: comprimento * 0.85,
        ),
        Form(
          key: _form,
          child: Stack(children: <Widget>[
            Container(
              child: Icon(
                Icons.email_rounded,
                color: Colors.pink,
                size: altura * 0.04,
              ),
              margin: EdgeInsets.only(
                  top: altura * 0.405, left: comprimento * 0.09),
              height: altura * 0.075,
              width: comprimento * 0.13,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0x19f67952),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              margin:
                  EdgeInsets.only(top: altura * 0.40, left: comprimento * 0.23),
              height: altura * 0.085,
              width: comprimento * 0.690,
              child: TextFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Digite o email";
                  } else if (!EmailValidator.validate(value, true)) {
                    return "Digite um email válido";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email',
                ),
              ),
            ),
// 
//  FIM CAMPO EMAIL
//

// 
//  CAMPO SENHA
//
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3f000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
                color: Colors.white,
              ),
              margin: EdgeInsets.only(
                  top: altura * 0.505, left: comprimento * 0.0725),
              height: altura * 0.085,
              width: comprimento * 0.85,
            ),
            Container(
              child: Icon(
                Icons.lock_rounded,
                color: Colors.pink,
                size: altura * 0.04,
              ),
              margin: EdgeInsets.only(
                  top: altura * 0.509, left: comprimento * 0.09),
              height: altura * 0.075,
              width: comprimento * 0.13,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0x19f67952),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              margin: EdgeInsets.only(
                  top: altura * 0.503, left: comprimento * 0.23),
              height: altura * 0.085,
              width: comprimento * 0.690,
              child: TextFormField(
                obscureText: true,
                controller: _senha,
                autofocus: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'O campo não pode ficar vazio';
                  }
                  if (value.length < 8) {
                    return 'O campo rua deve ter pelo menos 8 caracteres';
                  } else
                    return null;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Senha',
                ),
              ),
            ),
// 
//  FIM CAMPO SENHA
//
          ]),
        ),
// 
// BOTAO LOG IN
//
        Container(
            margin:
                EdgeInsets.only(top: altura * 0.69, left: comprimento * 0.2),
            height: altura * 0.09,
            width: comprimento * 0.6,
            child: ElevatedButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.pink),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Colors.pink),
                    borderRadius: BorderRadius.circular(25.0),
                  ))),
              onPressed: () {
                if (_form.currentState!.validate()) {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _email.text, password: _senha.text)
                      .then((value) {
                    Navigator.of(context).pushNamed(AppRoutes.HOME);
                  }).onError((error, stackTrace) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Conta nao existente')),
                    );
                  });
                }
              },
              child: const Text("Log in",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  )),
            )),
// 
//  FIM DO BOTAO LOG IN
//

// 
//  BOTAO TEXTO SIGN UP
//
        Container(
            margin: EdgeInsets.only(top: altura * 0.8, left: comprimento * 0.4),
            height: altura * 0.05,
            alignment: Alignment.center,
            width: comprimento * 0.2,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CADASTRAR);
              },
              child: const Text("Sign up",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  )),
            )),
// 
//  FIM BOTAO TEXTO SIGN UP
//
      ]),
    ));
  }
}
