import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttergetxlogin/auth_controller.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController;
    TextEditingController senhaController;

    List images = [
      "g.png",
      "t.png",
      "f.png",
    ];

    double customWidth = MediaQuery.of(context).size.width;
    double customHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: customWidth,
            height: customHeight * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/signup.png"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                SizedBox(height: customHeight * 0.16),
                const CircleAvatar(
                  backgroundColor: Colors.white70,
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/profile1.png"),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            width: customWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2)),
                    ],
                  ),
                  child: TextField(
                    controller: emailController = TextEditingController(),
                    decoration: const InputDecoration(
                      hintText: " E-mail",
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.deepOrangeAccent,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2)),
                    ],
                  ),
                  child: TextField(
                    controller: senhaController = TextEditingController(),
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: " Senha",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.deepOrangeAccent,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              AuthController.authControllerInstance.cadastrar(
                  emailController.text.trim(), senhaController.text.trim());
            },
            child: Container(
              width: customWidth * 0.8,
              height: customHeight * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                    image: AssetImage("assets/images/loginbtn.png"),
                    fit: BoxFit.cover),
              ),
              child: const Center(
                child: Text(
                  "Criar Conta",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(
              recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
              text: " Já tem conta?",
              style: const TextStyle(color: Colors.grey, fontSize: 19),
            ),
          ),
          SizedBox(
            height: customWidth * 0.15,
          ),
          RichText(
            text: const TextSpan(
              text: " Ou Entre",
              style: TextStyle(color: Colors.grey, fontSize: 19),
            ),
          ),
          Wrap(
            children: List<Widget>.generate(3, (index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        AssetImage("assets/images/" + images[index]),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
