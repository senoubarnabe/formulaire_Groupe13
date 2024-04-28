// add_candidat_page.dart
import 'package:flutter/material.dart';
import 'candidat.dart';

class AddCandidatPage extends StatefulWidget {
  @override
  _AddCandidatPageState createState() => _AddCandidatPageState();
}

class _AddCandidatPageState extends State<AddCandidatPage> {
  final _formKey = GlobalKey<FormState>();
  final _candidat = Candidat(
    name: '',
    firstName: '',
    sex: '',
    party: '',
    description: '',
    photo: '',
  );

  final _nameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _sexController = TextEditingController();
  final _partyController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _photoController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _firstNameController.dispose();
    _sexController.dispose();
    _partyController.dispose();
    _descriptionController.dispose();
    _photoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un candidat'),
        backgroundColor: Colors.indigo[400], // couleur de l'app bar
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un nom';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'Prénom'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un prénom';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _sexController,
                decoration: InputDecoration(labelText: 'Sexe'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un sexe';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _partyController,
                decoration: InputDecoration(labelText: 'Parti'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un parti';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _photoController,
                decoration: InputDecoration(labelText: 'Veuillez entrer le lien de votre photo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _candidat.name = _nameController.text;
                    _candidat.firstName = _firstNameController.text;
                    _candidat.sex = _sexController.text;
                    _candidat.party = _partyController.text;
                    _candidat.description = _descriptionController.text;
                    Navigator.pop(context, _candidat);
                  }
                },
                child: Text('Ajouter'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo[400], // couleur du bouton
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white, // couleur de fond
    );
  }
}