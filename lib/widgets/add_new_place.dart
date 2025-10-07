import 'dart:io';
import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places/providers/user_places.dart';
import 'package:favorite_places/widgets/inputs/image_input.dart';
import 'package:favorite_places/widgets/inputs/location_input.dart';

class AddNewPlace extends ConsumerStatefulWidget {
  const AddNewPlace({super.key});

  @override
  ConsumerState<AddNewPlace> createState() => _AddNewPlaceState();
}

class _AddNewPlaceState extends ConsumerState<AddNewPlace> {
  final _titleController = TextEditingController();
  File? _pickedImage;
  PlaceLocation? _pickedLocation;

  void _addPlace() {
    final enteredTitle = _titleController.text;
    if (enteredTitle.isEmpty || _pickedImage == null) {
      return;
    }

    ref
        .read(userPlacesProvider.notifier)
        .addPlace(enteredTitle, _pickedImage!, _pickedLocation!);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Título'),
            controller: _titleController,
          ),
          const SizedBox(height: 16),
          ImageInput(onPickImage: (image) => _pickedImage = image),
          const SizedBox(height: 16),
          LocationInput(
            onPickLocation: (location) => _pickedLocation = location,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text('Adicionar'),
            onPressed: _addPlace,
          ),
        ],
      ),
    );
  }
}
