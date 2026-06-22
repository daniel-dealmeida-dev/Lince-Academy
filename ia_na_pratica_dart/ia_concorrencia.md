# Lince Tech Academy – Uso de IA como Apoio

## Módulo: Concorrência com Futures em Dart

Este documento registra os aprendizados, conceitos e interações com a IA sobre o funcionamento de programação assíncrona e concorrência na linguagem Dart.

---

## 1. O que são os termos "Síncrono" e "Assíncrono"?

### Síncrono (Synchronous)

As tarefas são executadas em fila, uma após a outra. O programa espera a linha de código atual terminar para só então passar para a próxima.

Se uma linha demorar (por exemplo, a leitura de um arquivo grande), todo o programa fica aguardando.

### Assíncrono (Asynchronous)

Permite que o programa inicie uma tarefa demorada e continue executando outras tarefas enquanto ela ocorre.

Quando a tarefa termina, o programa recebe o resultado e continua o processamento necessário.

---

## 2. O que é um `Future` em Dart?

Um `Future<T>` é um objeto que representa uma promessa de um valor que estará disponível em algum momento no futuro.

Quando você chama uma função assíncrona, ela retorna imediatamente um `Future`.

Esse objeto pode estar em dois estados:

1. **Incompleto (Uncompleted):**

   * A operação ainda está sendo executada.

2. **Completo (Completed):**

   * A operação terminou com sucesso, retornando um valor do tipo `T`.
   * Ou terminou com erro.

### Situações comuns para utilizar Futures

* Requisições HTTP (APIs).
* Operações em banco de dados.
* Leitura e escrita de arquivos.
* Temporizadores e delays.
* Processamento de recursos externos.

---

## 3. Formas de aguardar um Future e obter o resultado

### Abordagem A: `async` e `await`

A palavra-chave `await` pausa a execução da função atual até que o Future seja resolvido.

Para usar `await`, a função deve possuir o modificador `async`.

```dart
Future<void> buscarUsuario() async {
  print("Buscando usuário...");

  String nome = await simularDemora();

  print("Usuário encontrado: $nome");
}
```

### Abordagem B: `Future.then()`

Utiliza callbacks para tratar o resultado quando ele estiver disponível.

```dart
void buscarUsuarioFuncional() {
  print("Buscando usuário...");

  simularDemora().then((nome) {
    print("Usuário encontrado: $nome");
  });

  print("Esta linha roda ANTES do usuário ser encontrado!");
}
```

### Atenção ao esquecer o `await`

Se você chamar uma função que retorna um `Future` sem utilizar `await`, o Dart iniciará a operação e continuará executando as próximas linhas imediatamente.

Isso pode causar:

* Variáveis ainda sem valor.
* Dados incompletos.
* Ordem inesperada de execução.
* Bugs difíceis de identificar.

---

## 4. Simulando Delays e Erros

### Simulando demora com `Future.delayed`

```dart
Future<String> simularDemora() {
  return Future.delayed(Duration(seconds: 3), () {
    return "João Silva";
  });
}
```

Nesse exemplo, o valor só será retornado após três segundos.

### Simulando erros

```dart
Future<String> buscarDadosComErro() {
  return Future.delayed(Duration(seconds: 2), () {
    throw Exception("Falha na conexão com o servidor.");
  });
}
```

Nesse caso, o Future será concluído com falha.

---

## 5. Tratamento de Erros

### Utilizando `try-catch`

É a abordagem mais comum quando trabalhamos com `async` e `await`.

```dart
Future<void> executarTarefa() async {
  try {
    String dados = await buscarDadosComErro();

    print(dados);
  } catch (erro) {
    print("Ops, algo deu errado: $erro");
  } finally {
    print("Esse bloco sempre executa.");
  }
}
```

### Utilizando `catchError`

Alternativa para quem utiliza `.then()`.

```dart
void executarTarefaFuncional() {
  buscarDadosComErro()
      .then((dados) => print(dados))
      .catchError((erro) => print("Erro capturado: $erro"));
}
```

---

## 6. Executando Várias Tarefas em Paralelo com `Future.wait`

Quando várias tarefas são independentes entre si, podemos executá-las simultaneamente.

Sem paralelismo:

* Tarefa A: 2 segundos
* Tarefa B: 2 segundos
* Tarefa C: 2 segundos

Tempo total: aproximadamente 6 segundos.

Com `Future.wait`:

* Todas iniciam ao mesmo tempo.
* Tempo total: aproximadamente 2 segundos.

### Exemplo

```dart
Future<void> carregarPaginaInicial() async {
  print("Carregando dados da tela...");

  List<dynamic> resultados = await Future.wait([
    buscarPrecoDolar(),
    buscarNoticias(),
    buscarBannerPromo(),
  ]);

  var preco = resultados[0];
  var noticias = resultados[1];

  print("Tela carregada com sucesso!");
}
```

### Importante

Os resultados retornam na mesma ordem da lista informada ao `Future.wait`.

Se qualquer Future falhar, o `Future.wait` inteiro também falhará, a menos que os erros sejam tratados individualmente.

---

## Observações Pessoais de Estudo

Espaço reservado para conclusões, dúvidas e aprendizados próprios.

### Exemplos

* O uso de `async` e `await` torna o código mais legível e fácil de manter.
* `Future.wait` é muito útil para carregar múltiplos recursos ao mesmo tempo.
* Entender quando utilizar código síncrono e assíncrono é fundamental para evitar travamentos e melhorar a experiência do usuário.
* O tratamento adequado de erros evita falhas inesperadas na aplicação.
