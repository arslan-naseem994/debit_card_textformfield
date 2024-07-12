import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController cardController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cvcController = TextEditingController();

  final String _formattedText = '';

  @override
  void initState() {
    super.initState();
    cardController.addListener(_formatText);
  }

  @override
  void dispose() {
    cardController.dispose();
    super.dispose();
  }

  void _formatText() {
    final enteredText =
        cardController.text.replaceAll('-', ''); // Remove existing dashes
    final sanitizedText = enteredText.replaceAll(
        RegExp(r'\D'), ''); // Remove non-digit characters
    final formattedText = StringBuffer();

    for (int i = 0; i < sanitizedText.length; i++) {
      if (i % 5 == 0 && i != 0) {
        formattedText.write('-');
      }
      formattedText.write(sanitizedText[i]);
    }

    cardController.value = TextEditingValue(
      text: formattedText.toString(),
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: 300,
                width: 500,
                child: Stack(
                  fit: StackFit.expand, // Ensures the Stack fills the Container
                  children: [
                    Image(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.fill, // Ensures the image fills the Stack
                      image: cardController.text.startsWith('4')
                          ? const AssetImage('assets/images/car.png')
                          : const AssetImage('assets/images/card.png'),
                    ),
                    Positioned(
                      left: 90,
                      top: 85,
                      child: Text(
                        cardController.text.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    Positioned(
                      left: 90,
                      bottom: 100,
                      child: Text(
                        nameController.text.toString().toUpperCase(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    Positioned(
                      right: 85,
                      bottom: 100,
                      child: Text(
                        cvcController.text.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                maxLength: 25,
                onChanged: (value) {
                  setState(() {});
                },
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Name',
                  counterText: '',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: null,
                maxLength: 20,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  setState(() {});
                },
                controller: cardController,
                decoration: const InputDecoration(
                  hintText: 'Card Number',
                  counterText: '',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLength: 3,
                onChanged: (value) {
                  setState(() {});
                },
                controller: cvcController,
                decoration: const InputDecoration(
                  hintText: 'CVC',
                  counterText: '',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
