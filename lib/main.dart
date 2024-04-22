import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/checkout.dart';
import 'package:provider_project/home.dart';
import 'package:provider_project/provider/checkoutProvider.dart';
import 'package:provider_project/provider/formProvider.dart';
import 'package:provider_project/views/addressDataForm.dart';
import 'package:provider_project/views/paymentDataForm.dart';
import 'package:provider_project/views/personalDataForm.dart';
import 'package:provider_project/views/showFormData.dart';
import 'package:provider_project/views/store.dart';
import 'package:provider_project/views/successSignUp.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CheckoutProvider()),
        ChangeNotifierProvider(create: (context) => FormProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
          '/checkout': (context) => const Checkout(),
          '/personal_data': (context) => ChangeNotifierProvider.value(
                value: Provider.of<FormProvider>(context),
                child: const PersonalDataForm(),
              ),
          '/address_data': (context) => ChangeNotifierProvider.value(
                value: Provider.of<FormProvider>(context),
                child: const AddressDataForm(),
              ),
          '/payment_data': (context) => ChangeNotifierProvider.value(
                value: Provider.of<FormProvider>(context),
                child: const PaymentDataForm(),
              ),
          '/show_form_data': (context) => const ShowFormData(),
          '/store': (context) => const Store(),
          '/successSignUp': (context) => const SuccessSignUp()
        },
      ),
    );
  }
}
