import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import '../models/person.dart';
import '../providers/state.dart'; 

class PersonFormScreen extends StatefulWidget {
  final Person? personToEdit;
  const PersonFormScreen({super.key, this.personToEdit});

  @override
  State<PersonFormScreen> createState() => _PersonFormScreenState();
}

class _PersonFormScreenState extends State<PersonFormScreen> {
  final _nameController = TextEditingController(); 
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _githubController = TextEditingController();
  BloodType _selectedBloodType = BloodType.aPositive;

  @override
  void initState() {
    super.initState();
    if (widget.personToEdit != null) {
      _nameController.text = widget.personToEdit!.name;
      _emailController.text = widget.personToEdit!.email;
      _phoneController.text = widget.personToEdit!.phone;
      _githubController.text = widget.personToEdit!.github;
      _selectedBloodType = widget.personToEdit!.bloodType;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.personToEdit == null ? 'Adicionar Pessoa' : 'Editar Pessoa'),
      ), 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: 'Nome')),
            TextField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email')),
            TextField(controller: _phoneController, decoration: const InputDecoration(labelText: 'Telefone')),
            TextField(controller: _githubController, decoration: const InputDecoration(labelText: 'GitHub')),
            
            //selecionar o tipo sanguíneo
            DropdownButtonFormField<BloodType>(
              value: _selectedBloodType,
              items: BloodType.values.map((type) {
                return DropdownMenuItem(value: type, child: Text(type.label));
              }).toList(),
              onChanged: (value) => setState(() => _selectedBloodType = value!),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newPerson = Person(
                  id: widget.personToEdit?.id ?? DateTime.now().toString(),
                  name: _nameController.text,
                  email: _emailController.text,
                  phone: _phoneController.text,
                  github: _githubController.text,
                  bloodType: _selectedBloodType,
                );
                
                if (widget.personToEdit == null) {
                  context.read<PersonProvider>().addPerson(newPerson);
                } else {
                  context.read<PersonProvider>().updatePerson(newPerson);
                }
                Navigator.pop(context);
              },
              child: const Text("Salvar"),
            )
          ],
        ),
      ),
    );
  }
}