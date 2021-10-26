import 'package:flutter/material.dart';
import 'package:flutter_app/controlers/loginControler.dart';
import 'package:flutter_app/controlers/registroControler.dart';
import 'package:flutter_app/modelos/usuario.dart';
import 'package:flutter_app/db.dart';
import 'package:flutter_app/pages/login.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = new GlobalKey<FormState>();

  final _conUserId = TextEditingController();
  final _conUserName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();
  final _contel = TextEditingController();
  final _condir = TextEditingController();
  final _congen = TextEditingController();
  final _conCPassword = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  signUp() async {
    String uid = _conUserId.text;
    String uname = _conUserName.text;
    String email = _conEmail.text;
    String telefono = _contel.text;
    String direccion = _condir.text;
    String genero = _congen.text;
    String passwd = _conPassword.text;
    String cpasswd = _conCPassword.text;

    if (_formKey.currentState.validate()) {
      if (passwd != cpasswd) {
        alertDialog(context, 'Password No coinciden');
      } else {
        _formKey.currentState.save();

        Usuario uModel = Usuario(
            uid, uname, telefono, direccion, genero, email, passwd, cpasswd);
        await dbHelper.saveData(uModel).then((userData) {
          alertDialog(context, "Registro Exitoso");
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => LoginForm()));
        }).catchError((error) {
          print(error);
          alertDialog(context, "Error: datos no guardados");
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  genLoginSignupHeader('Registro'),
                  getTextFormField(
                      controller: _conUserId,
                      icon: Icons.person,
                      hintName: 'User ID'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      controller: _conUserName,
                      icon: Icons.person_outline,
                      inputType: TextInputType.name,
                      hintName: 'Nombre'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      controller: _contel,
                      icon: Icons.person_outline,
                      inputType: TextInputType.phone,
                      hintName: 'Telefono'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      controller: _condir,
                      icon: Icons.person_outline,
                      inputType: TextInputType.streetAddress,
                      hintName: 'Direccion'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      controller: _congen,
                      icon: Icons.person_outline,
                      inputType: TextInputType.name,
                      hintName: 'Genero'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                      controller: _conEmail,
                      icon: Icons.email,
                      inputType: TextInputType.emailAddress,
                      hintName: 'Correo'),
                  SizedBox(height: 10.0),
                  getTextFormField(
                    controller: _conPassword,
                    icon: Icons.lock,
                    hintName: 'Password',
                    isObscureText: true,
                  ),
                  SizedBox(height: 10.0),
                  getTextFormField(
                    controller: _conCPassword,
                    icon: Icons.lock,
                    hintName: 'Confirm Password',
                    isObscureText: true,
                  ),
                  Container(
                    margin: EdgeInsets.all(30.0),
                    width: double.infinity,
                    child: FlatButton(
                      child: Text(
                        'Registrar',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: signUp,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('ya tienes un Usuario? '),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text('Login'),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => LoginForm()),
                                (Route<dynamic> route) => false);
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
