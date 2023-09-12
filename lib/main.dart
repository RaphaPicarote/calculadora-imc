import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controllerPeso = TextEditingController();

  TextEditingController controllerAltura = TextEditingController();

  String resultado = " ";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('SEU IMC')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: controllerPeso,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelText: 'Peso',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: controllerAltura,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  labelText: 'Altura',
                  hintText: 'Ex: 1.80',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                resultado,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      num imc = (num.parse(controllerPeso.text) /
                          (num.parse(controllerAltura.text) *
                              (num.parse(controllerAltura.text))));

                      resultado = imc.toStringAsFixed(2);
                    });
                  },
                  child: const Text('Calcular'))
            ],
          ),
        ),
      ),
    );
  }
}
