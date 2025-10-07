import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: const Text(
            'Localização não definida',
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.location_on),
              label: const Text('Obter localização atual'),
              onPressed: () {},
            ),
            TextButton.icon(
              icon: const Icon(Icons.map),
              label: const Text('Selecionar no mapa'),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
