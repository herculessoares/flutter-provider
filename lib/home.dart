import 'package:flutter/material.dart';
import 'package:provider_project/model/user.dart';
import 'package:signals/signals_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = signal('');
  final password = signal('');
  final passError = signal<String?>(null);

  //final TextEditingController _usernameController = TextEditingController();
  //final TextEditingController _passwordController = TextEditingController();
  late final isValid =
      computed(() => user().isNotEmpty && password().isNotEmpty);
  bool error = false;
  String status = '';

  validateForm() async {
    if (password().length > 6) {
      passError.value = null;
      User currentUser =
          User.verify(user.watch(context), password.watch(context));
      User? response = await User.verifyUser(currentUser);
      if (response?.username != null) {
        Navigator.pushNamed(context, '/store', arguments: response?.username);
      } else {
        passError.value = 'Usuário e/ou Senha Inválidos.';
      }
    } else {
      passError.value = 'A senha deve ter no mínimo 6 dígitos!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Image.asset(
                    'assets/hfood_logo.png',
                    height: 200,
                    width: 200,
                  ),
                ),
                Container(
                    child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/personal_data');
                      },
                      child: const Text(
                        'Cadastre-se aqui ',
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    const Text('ou digite seus dados abaixo.')
                  ],
                )),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    onChanged: user.set,
                    //controller: _usernameController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Usuário',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.person,
                        color: error ? Colors.red : const Color(0xFF142E55),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextField(
                    onChanged: password.set,
                    //controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Digite sua senha',
                      errorText: passError.watch(context),
                      filled: true,
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: error ? Colors.red : const Color(0xFF142E55),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                const Center(
                  child: Text(
                    "Esqueceu login/senha?",
                    style: TextStyle(
                        color: Color(0xFF142E55),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30.0),
                Container(
                  height: 50.0,
                  decoration: const BoxDecoration(color: Colors.red),
                  child: FilledButton(
                    onPressed: isValid.watch(context) ? validateForm : null,
                    style: FilledButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text(
                      'Entrar',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: Text(
                    status,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
