# IA Flutter: Programação Assíncrona

Este arquivo documenta as interações e conceitos estudados sobre a programação assíncrona no Flutter e Dart.

## 1. Conceitos Fundamentais

* **Programação Assíncrona:** É fundamental para manter a interface do usuário (UI) responsiva enquanto o aplicativo aguarda a conclusão de tarefas externas, como chamadas de API.
* **Loop de Eventos (Event Loop):** O Flutter utiliza uma única thread de execução. O Event Loop gerencia as tarefas, alternando entre código síncrono e assíncrono para garantir que a UI não congele.
* **Futures:** Um `Future` representa o resultado de uma operação assíncrona que ainda não foi concluída. É essencialmente uma promessa de um valor futuro.
* **Async/Await:** São palavras-chave que simplificam a sintaxe de `Futures`. `async` declara uma função como assíncrona, e `await` pausa a execução até que o resultado esteja disponível.
* **Isolates:** São mecanismos de concorrência que não compartilham memória. Devem ser usados para tarefas de processamento pesado de CPU para evitar travamentos da UI.

## 2. Lidando com Erros e HTTP

* **Tratamento de Erros:** O uso de `try-catch` é a prática recomendada para interceptar exceções que ocorrem durante operações assíncronas.
* **Métodos HTTP:** Os principais verbos utilizados são `GET` (buscar), `POST` (enviar), `PUT/PATCH` (atualizar) e `DELETE` (remover).
* **Códigos de Resposta:** 
    * **200 (OK):** Sucesso na requisição.
    * **404 (Not Found):** Recurso não localizado.
    * **500 (Internal Server Error):** Falha no servidor.

## 3. Trabalhando com JSON e Classes

* **JSON:** É o formato padrão para troca de dados. Em Flutter, utilizamos `dart:convert` para processá-lo.
* **Mapeamento para Classes:** Converter JSON em objetos Dart (modelos) é uma boa prática que garante segurança de tipos e facilita a manutenção.
* **Factory Construtores:** O construtor `factory` é ideal para implementar o padrão `fromJson`, permitindo a criação de instâncias de forma eficiente.
* **toJson():** Método utilizado para converter objetos Dart de volta para um formato de mapa compatível com JSON.

## 4. Boas Práticas e UX

* **Indicadores de Carregamento:** Para melhorar a experiência do usuário, deve-se exibir componentes como `CircularProgressIndicator` enquanto a requisição estiver pendente.
* **Organização do Código:** É recomendável separar a lógica de acesso a dados (camada de serviços/repositórios) da camada de interface (Widgets).

## 5. Exemplo de Estrutura de Consumo de API

O fluxo ideal para consumir uma API consiste em:
1. Criar uma classe modelo com um método `fromJson`.
2. Implementar um método assíncrono que utiliza `http` para a requisição e `json.decode` para o processamento.
3. Utilizar o widget `FutureBuilder` na interface para gerenciar os estados de carregamento, erro e sucesso automaticamente.

---

### Observações sobre a interação com a IA
A interação com a IA permitiu compreender melhor como o Event Loop funciona em relação às operações assíncronas no Flutter. A distinção entre a função de `Future` e o uso de `Isolates` para tarefas de alta carga foi esclarecedora, assim como a importância de estruturar o código em camadas (Models e Services) para manter o projeto organizado e escalável.