import 'package:flutter/material.dart';
import 'package:flutter_hortifruti/app/modules/register/controller.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar conta')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.nameController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                ),
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return 'Preencha o seu nome';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: controller.emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return 'Preencha o seu e-mail';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: controller.phoneController,
                decoration: const InputDecoration(
                  labelText: 'Telefone',
                ),
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return 'Preencha o seu telefone para contato';
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
                  if (value != null && (value.isEmpty || value.length < 8)) {
                    return 'Informe uma senha válida maior do que 8 caracteres';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: controller.submit,
                        child: const Text('Criar conta'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
