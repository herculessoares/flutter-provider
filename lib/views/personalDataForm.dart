import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/model/form.dart';
import 'package:provider_project/provider/formProvider.dart';

class PersonalDataForm extends StatefulWidget {
  const PersonalDataForm({super.key});

  @override
  State<PersonalDataForm> createState() => _PersonalDataFormState();
}

class _PersonalDataFormState extends State<PersonalDataForm> {
  late TextEditingController fullNameController;
  late TextEditingController dateOfBirthController;
  late TextEditingController genderController;
  late TextEditingController emailAddressController;
  late TextEditingController phoneNumberController;
  late TextEditingController nationalityController;
  late TextEditingController occupationController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    var formData = Provider.of<FormProvider>(context, listen: false).formData;

    // Inicialize os controladores com os valores de `FormProvider`
    fullNameController = TextEditingController(text: formData.fullName);
    dateOfBirthController = TextEditingController(text: formData.dateOfBirth);
    genderController = TextEditingController(text: formData.gender);
    emailAddressController = TextEditingController(text: formData.emailAddress);
    phoneNumberController = TextEditingController(text: formData.phoneNumber);
    nationalityController = TextEditingController(text: formData.nationality);
    occupationController = TextEditingController(text: formData.occupation);
    usernameController = TextEditingController(text: formData.username);
    passwordController = TextEditingController(text: formData.password);
  }

  @override
  void dispose() {
    // Libere recursos
    fullNameController.dispose();
    dateOfBirthController.dispose();
    genderController.dispose();
    emailAddressController.dispose();
    phoneNumberController.dispose();
    nationalityController.dispose();
    occupationController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var formData = Provider.of<FormProvider>(context).formData;
    // TextEditingController fullNameController = TextEditingController();
    // TextEditingController dateOfBirthController = TextEditingController();
    // TextEditingController genderController = TextEditingController();
    // TextEditingController emailAddressController = TextEditingController();
    // TextEditingController phoneNumberController = TextEditingController();
    // TextEditingController nationalityController = TextEditingController();
    // TextEditingController occupationController = TextEditingController();
    // TextEditingController usernameController = TextEditingController();
    // TextEditingController passwordController = TextEditingController();

    // Atualizar os valores dos atributos quando os campos de entrada forem alterados
    fullNameController.addListener(() {
      formData.fullName = fullNameController.text;
    });
    dateOfBirthController.addListener(() {
      // Convertendo a string para DateTime
      formData.dateOfBirth = dateOfBirthController.text;
    });
    genderController.addListener(() {
      formData.gender = genderController.text;
    });
    emailAddressController.addListener(() {
      formData.emailAddress = emailAddressController.text;
    });
    phoneNumberController.addListener(() {
      formData.phoneNumber = phoneNumberController.text;
    });
    nationalityController.addListener(() {
      formData.nationality = nationalityController.text;
    });
    occupationController.addListener(() {
      formData.occupation = occupationController.text;
    });
    usernameController.addListener(() {
      formData.username = usernameController.text;
    });
    passwordController.addListener(() {
      formData.password = passwordController.text;
    });

    return Material(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            title: const Text('Dados Pessoais')),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: fullNameController,
                  decoration: const InputDecoration(
                    labelText: 'Nome Completo',
                  ),
                ),
                TextField(
                  controller: dateOfBirthController,
                  decoration: const InputDecoration(
                    labelText: 'Data de Nascimento',
                  ),
                ),
                TextField(
                  controller: genderController,
                  decoration: const InputDecoration(
                    labelText: 'Sexo',
                  ),
                ),
                TextField(
                  controller: emailAddressController,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                  ),
                ),
                TextField(
                  controller: phoneNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Telefone',
                  ),
                ),
                TextField(
                  controller: nationalityController,
                  decoration: const InputDecoration(
                    labelText: 'Nacionalidade',
                  ),
                ),
                TextField(
                  controller: occupationController,
                  decoration: const InputDecoration(
                    labelText: 'Profissão',
                  ),
                ),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Usuário',
                  ),
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Provider.of<FormProvider>(context, listen: false)
                              .updatePersonalData(formData);
                          Navigator.pushNamed(context, '/address_data');
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors
                                .red, // Define a cor de fundo do botão para vermelho
                            foregroundColor: Colors
                                .white, // Define a cor do texto para branco
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            padding: const EdgeInsets.all(8)),
                        child: const Row(
                          children: [
                            Text('Endereço'),
                            Icon(Icons.arrow_forward_ios_sharp),
                          ],
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
