import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/state.dart'; // Ajuste conforme o nome real do seu arquivo de provider
import '../utils/helpers.dart'; // Aquele arquivo que você criou com as cores
import 'person_form_screen.dart';

class PeopleListScreen extends StatelessWidget {
  const PeopleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Pessoas")),
      body: Column(
        children: [
          // Campo de busca
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: "Buscar por nome",
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) =>
                  context.read<PersonProvider>().setSearchQuery(value),
            ),
          ),
          
          //parte q escuta o provider
          Expanded(
            child: Consumer<PersonProvider>(
              builder: (context, provider, child) {
                final people = provider.filteredPeople;

                if (people.isEmpty) {
                  return const Center(
                    child: Text("Nenhuma pessoa encontrada."),
                  );
                }

                return ListView.builder(
                  itemCount: people.length,
                  itemBuilder: (context, index) {
                    final person = people[index];
                    return Card(
                      color: getBloodColor(person.bloodType),
                      child: ListTile(
                        title: Text(
                          person.name,
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        subtitle: Text(
                          "Email: ${person.email}\n"
                          "Telefone: ${person.phone}\n"
                          "GitHub: ${person.github}\n"
                          "Tipo: ${person.bloodType.label}",
                          style: const TextStyle(color: Colors.black),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Botão de editar
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      PersonFormScreen(personToEdit: person),
                                ),
                              ),
                            ),
                            // Botão de excluir
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => provider.removePerson(person.id),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
