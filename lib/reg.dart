import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  GlobalKey<FormState> _key = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  late FirebaseAuth _auth;
  bool isObscure = true;
  bool _isValid = true;

  @override
  Widget build(BuildContext context) {
    _auth = FirebaseAuth.instance;

    return Scaffold(
       backgroundColor: Colors.grey,
      body: SafeArea(
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
           const   SizedBox(
                height: 100,
              ),
              const Text(
                "Регистрация",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30,color: Color.fromARGB(255, 47,54,51)),
              ),
           const    SizedBox(
                    height: 160,
                  ),
              SizedBox(
                  width: 10,
              height: 30,
                child: TextFormField(
                  controller: _loginController,
                ),
              ),
             const       SizedBox(
                    height: 20,
                  ),
              SizedBox(
                  width: 200,
              height: 30,
                child: TextFormField(
                  controller: _passwordController,
                 
                ),
              ),
              const     SizedBox(
                    height: 20,
                  ),
              SizedBox(
                  width: 10,
              height: 30,
                    child: ElevatedButton(
                      
                             style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.all<Color>(Colors.white,),
                ),
                      child: const Text("Зарегистрироваться", style: TextStyle(fontSize: 15, color:Color.fromARGB(255,60,70,70)),),
                      onPressed: () => {
                        _isValid = true,
                        if (_key.currentState!.validate()) {reg()}
                      },
                    ),
                  
                  ),
               const   SizedBox(
                    height: 20,
                  ),
              SizedBox(
                  width: 200,
              height: 30,
                  child: ElevatedButton(
                           style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.all<Color>(Colors.white,),
                ),
                    child: const Text("Назад", style: TextStyle(fontSize: 15, color:Color.fromARGB(255,60,70,70)),),
                    onPressed: () => {
                      _loginController.clear(),
                      _passwordController.clear(),
                      _isValid = false,
                      _key.currentState!.validate(),
                      Navigator.pushNamed(context, 'home'),
                    },
                  ))
            ],
          ),
        ),
   
      ),
    );
  }

  reg() async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: _loginController.text, password: _passwordController.text);
      ScaffoldMessenger.of(context).showSnackBar(
    const    SnackBar(
          content: Text("Зарегистрировался"),
        ),
      );
      Navigator.pushNamed(context, 'home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
       const   SnackBar(
            content: Text("Пароль слабый"),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }
}