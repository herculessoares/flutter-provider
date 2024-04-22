import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/provider/formProvider.dart';

class PaymentDataForm extends StatefulWidget {
  const PaymentDataForm({super.key});

  @override
  State<PaymentDataForm> createState() => _PaymentDataFormState();
}

class _PaymentDataFormState extends State<PaymentDataForm> {
  @override
  Widget build(BuildContext context) {
    var formData = Provider.of<FormProvider>(context).formData;
    TextEditingController creditCardNumberController = TextEditingController();
    TextEditingController expirationDateController = TextEditingController();
    TextEditingController cvvController = TextEditingController();
    TextEditingController billingAddressController = TextEditingController();
    TextEditingController paymentMethodController = TextEditingController();

    creditCardNumberController.addListener(() {
      formData.creditCardNumber = creditCardNumberController.text;
    });
    expirationDateController.addListener(() {
      formData.expirationDate = expirationDateController.text;
    });
    cvvController.addListener(() {
      formData.cvv = cvvController.text;
    });
    billingAddressController.addListener(() {
      formData.billingAddress = billingAddressController.text;
    });
    paymentMethodController.addListener(() {
      formData.paymentMethod = paymentMethodController.text;
    });

    return Material(
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                title: const Text('Dados de Pagamento')),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                      child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: creditCardNumberController,
                          decoration: const InputDecoration(
                            labelText: 'Número do Cartão',
                          ),
                        ),
                        TextField(
                          controller: expirationDateController,
                          decoration: const InputDecoration(
                            labelText: 'Data de Expiração',
                          ),
                        ),
                        TextField(
                          controller: cvvController,
                          decoration: const InputDecoration(
                            labelText: 'CVV/CVC',
                          ),
                        ),
                        TextField(
                          controller: billingAddressController,
                          decoration: const InputDecoration(
                            labelText: 'Nome do Titular',
                          ),
                        ),
                        TextField(
                          controller: paymentMethodController,
                          decoration: const InputDecoration(
                            labelText: 'Forma de Pagamento',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ButtonBar(children: [
                          ElevatedButton(
                              onPressed: () async {
                                int control = await Provider.of<FormProvider>(
                                        context,
                                        listen: false)
                                    .formData
                                    .insertRegister();
                                if (control > 0) {
                                  Navigator.pushNamed(context, '/successSignUp',
                                      arguments: formData);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors
                                      .green, // Define a cor de fundo do botão para vermelho
                                  foregroundColor: Colors
                                      .white, // Define a cor do texto para branco
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  padding: const EdgeInsets.all(8)),
                              child: const Row(
                                children: [
                                  Text('Salvar'),
                                  SizedBox(width: 5),
                                  Icon(Icons.save),
                                ],
                              ))
                        ])
                      ],
                    ),
                  )),
                ),
              ],
            )));
  }
}
