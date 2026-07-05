import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Produto {
  final String titulo;
  final String descricao;
  final double preco;
  final String imagem;

  Produto({
    required this.titulo,
    required this.descricao,
    required this.preco,
    required this.imagem,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      titulo: json['titulo'],
      descricao: json['descricao'],
      preco: (json['preco'] as num).toDouble(),
      imagem: json['imagem'],
    );
  }
}


class MinhaListaDeProdutos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Produtos")),
      body: FutureBuilder<List<Produto>>(
        future: seuMetodoQueBuscaDados(), // Certifique-se de que esse método existe!
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum produto encontrado'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final produto = snapshot.data![index];

              return ListTile(
                leading: Image.network(
                  produto.imagem,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  produto.titulo,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                isThreeLine: true,
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      produto.descricao.length > 30
                          ? '${produto.descricao.substring(0, 30)}...'
                          : produto.descricao,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'R\$ ${produto.preco.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
  
  Future<List<Produto>> seuMetodoQueBuscaDados() async {
     return []; 
  }
}