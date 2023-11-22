import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/modules/login/controller.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            TextFormField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              validator: (String? value) {
                if (value != null && value.isEmpty) {
                  return 'Informe o seu email';
                }

                if (value != null && !value.contains('@')) {
                  return 'Informe um email válido';
                }

                return null;
              },
            ),
            TextFormField(
              controller: controller.passwordController,
              decoration: const InputDecoration(
                labelText: 'Senha',
              ),
              obscureText: true,
              validator: (String? value) {
                if (value != null && value.isEmpty) {
                  return 'Informe a sua senha';
                }

                return null;
              },
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      onPressed: controller.login,
                      child: const Text('Entrar'),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('Criar conta'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
