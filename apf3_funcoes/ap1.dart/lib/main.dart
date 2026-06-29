import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: const Scaffold(
      body: _Formulario(),
    ),
  ));
}

class _Formulario extends StatefulWidget {
  const _Formulario();

  @override
  State<_Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<_Formulario> {
  final _formState = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _idadeController = TextEditingController();

  var _inativo = false;

  String? _nomeSalvo;
  int? _idadeSalva;
  bool? _inativoSalvo;

  bool get _isFormularioSalvo => _nomeSalvo != null;

  void _enviarFormulario() {
    if (_formState.currentState!.validate()) {
      setState(() {
        _nomeSalvo = _nomeController.text;
        _idadeSalva = int.parse(_idadeController.text);
        _inativoSalvo = _inativo;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formState,
        child: Column(
          children: [
            TextFormField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: "Nome"),
              validator: (value) {
                if (value == null || value.isEmpty) return "Nome obrigatório";
                if (value.length < 3) return "Precisa ter no mínimo 3 letras";
                if (value[0] != value[0].toUpperCase()) {
                  return "Precisa começar com letra maiúscula";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _idadeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Idade"),
              validator: (value) {
                final idade = int.tryParse(value ?? '');
                if (idade == null || idade < 18) return "Deve ser maior ou igual a 18";
                return null;
              },
            ),
            Row(
              children: [
                Checkbox(
                  value: _inativo,
                  onChanged: (value) => setState(() => _inativo = value!),
                ),
                const Text("Indicador de inativo"),
              ],
            ),
            ElevatedButton(
              onPressed: _enviarFormulario,
              child: const Text("Salvar"),
            ),
            const SizedBox(height: 20),
            if (_isFormularioSalvo)
              _DadosSalvos(
                nome: _nomeSalvo!,
                idade: _idadeSalva!,
                inativo: _inativoSalvo!,
              ),
          ],
        ),
      ),
    );
  }
}

class _DadosSalvos extends StatelessWidget {
  final String nome;
  final int idade;
  final bool inativo;

  const _DadosSalvos({
    required this.nome,
    required this.idade,
    required this.inativo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: inativo ? Colors.grey : Colors.green,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nome: $nome"),
          Text("Idade: $idade"),
          Text("Status: ${inativo ? "Inativo" : "Ativo"}"),
        ],
      ),
    );
  }
}