import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/provider/formProvider.dart';

class AddressDataForm extends StatefulWidget {
  const AddressDataForm({super.key});

  @override
  State<AddressDataForm> createState() => _AddressDataFormState();
}

class _AddressDataFormState extends State<AddressDataForm> {
  @override
  Widget build(BuildContext context) {
    var formData = Provider.of<FormProvider>(context).formData;
    TextEditingController streetAddressController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController stateProvinceController = TextEditingController();
    TextEditingController zipCodeController = TextEditingController();
    TextEditingController countryController = TextEditingController();

    streetAddressController.addListener(() {
      formData.streetAddress = streetAddressController.text;
    });
    cityController.addListener(() {
      formData.city = cityController.text;
    });
    stateProvinceController.addListener(() {
      formData.stateProvince = stateProvinceController.text;
    });
    zipCodeController.addListener(() {
      formData.zipCode = zipCodeController.text;
    });
    countryController.addListener(() {
      formData.country = countryController.text;
    });

    return Material(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          title: const Text('Endereço')),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: streetAddressController,
              decoration: const InputDecoration(
                labelText: 'Rua/Av/Beco',
              ),
            ),
            TextField(
              controller: cityController,
              decoration: const InputDecoration(
                labelText: 'Cidade',
              ),
            ),
            TextField(
              controller: stateProvinceController,
              decoration: const InputDecoration(
                labelText: 'UF',
              ),
            ),
            TextField(
              controller: zipCodeController,
              decoration: const InputDecoration(
                labelText: 'CEP',
              ),
            ),
            TextField(
              controller: countryController,
              decoration: const InputDecoration(
                labelText: 'País',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ButtonBar(children: [
              ElevatedButton(
                  onPressed: () =>
                      {Navigator.pushNamed(context, '/payment_data')},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .red, // Define a cor de fundo do botão para vermelho
                      foregroundColor:
                          Colors.white, // Define a cor do texto para branco
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      padding: const EdgeInsets.all(8)),
                  child: const Row(
                    children: [
                      Text('Pagamento'),
                      Icon(Icons.arrow_forward_ios_sharp),
                    ],
                  ))
            ])
          ],
        ),
      )),
    ));
  }
}
