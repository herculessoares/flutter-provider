import 'package:flutter/material.dart';
import 'package:provider_project/model/form.dart';

class ShowFormData extends StatefulWidget {
  const ShowFormData({super.key});

  @override
  State<ShowFormData> createState() => _ShowFormDataState();
}

class _ShowFormDataState extends State<ShowFormData> {
  Future<List<SignUpForm?>>? _futureFormData = SignUpForm.findFirst();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Expanded(
        child: FutureBuilder<List<SignUpForm?>>(
          future: _futureFormData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Erro: ${snapshot.error}'),
              );
            } else {
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: const Color.fromARGB(255, 59, 176, 239),
                      child: ListTile(
                        textColor: Colors.white,
                        title: Text(snapshot.data![index]!.fullName!),
                        subtitle: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  snapshot.data![index]!.username!,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  snapshot.data![index]!.username!,
                                ),
                              ],
                            ),
                          ],
                        ),
                        onTap: () => {},
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text('Nenhum registro encontrado.'),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
