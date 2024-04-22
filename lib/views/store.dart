import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/provider/checkoutProvider.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  bool error = false;
  String status = '';

  @override
  Widget build(BuildContext context) {
    final String userLogged =
        ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: const Text(
          'Compras',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () => Navigator.pushNamed(context, '/checkout'),
                icon: Badge(
                  backgroundColor: Colors.blue,
                  label:
                      //Text('${context.watch<CheckoutProvider>().itemsCount}'),
                      Text(
                          '${Provider.of<CheckoutProvider>(context, listen: true).itemsCount}'),
                  child: const Icon(
                    Icons.shopping_cart,
                    size: 35,
                    color: Colors.white,
                  ),
                )),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Olá, ${userLogged.toUpperCase()}'),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Column(
                              children: [
                                Container(
                                    width: (MediaQuery.sizeOf(context).width) *
                                        0.40,
                                    height: (MediaQuery.sizeOf(context).width) *
                                        0.50,
                                    child: Column(children: [
                                      Image.asset('assets/brasileira.jpg'),
                                      const Text('Comida Brasileira')
                                    ])),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    width: (MediaQuery.sizeOf(context).width) *
                                        0.40,
                                    height: (MediaQuery.sizeOf(context).width) *
                                        0.50,
                                    child: Column(children: [
                                      Image.asset('assets/hamburger.jpg'),
                                      const Text('Hambúrguer')
                                    ])),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                            width: (MediaQuery.sizeOf(context).width) * 0.1),
                        Column(
                          children: [
                            Column(
                              children: [
                                Container(
                                    width: (MediaQuery.sizeOf(context).width) *
                                        0.40,
                                    height: (MediaQuery.sizeOf(context).width) *
                                        0.50,
                                    child: Column(children: [
                                      Image.asset('assets/pizza.jpg'),
                                      const Text('Pizza')
                                    ])),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    width: (MediaQuery.sizeOf(context).width) *
                                        0.40,
                                    height: (MediaQuery.sizeOf(context).width) *
                                        0.50,
                                    child: Column(children: [
                                      Image.asset('assets/churrasco.png'),
                                      const Text('Churrasco')
                                    ])),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red[600],
        child: Container(
          height: 30,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.plus_one, color: Colors.white),
        //onPressed: () => context.read<CheckoutProvider>().addItem(),
        onPressed: () =>
            Provider.of<CheckoutProvider>(context, listen: false).addItem(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
