# Interação com IA: Orientação a Objetos Avançada em Dart

Este documento reúne a exploração conceitual sobre tópicos avançados de Programação Orientada a Objetos (POO) em Dart, cobrindo herança, interfaces, encapsulamento, membros estáticos e enumeradores, focando em como esses conceitos gerenciam a estrutura do código e a memória.

---

# 1. Herança, Sobrescrita e Classes Abstratas

## O que significa sobrescrever (*override*) um método em Dart e por que eu faria isso?

Sobrescrever (*override*) significa redefinir na classe filha um método que já foi criado na classe pai.

Você faz isso para especializar o comportamento. A assinatura do método continua a mesma (nome e parâmetros), mas a implementação interna muda para se adequar à realidade da classe filha.

---

## Como posso chamar o método original de uma classe pai em um método sobrescrito?

Utiliza-se a palavra-chave `super`.

Isso é útil quando você não quer descartar completamente o comportamento da classe pai, mas sim estendê-lo ou adicionar lógica antes ou depois da execução original.

```dart id="7o3w6a"
class Funcionario {
  void baterPonto() =>
      print("Ponto registrado no sistema central.");
}

class Gerente extends Funcionario {
  @override
  void baterPonto() {
    super.baterPonto();

    print(
      "Enviando notificação adicional para a diretoria.",
    );
  }
}
```

---

## O que é uma classe abstrata e como ela difere de uma classe normal?

Uma classe abstrata é um molde puramente conceitual que **não pode ser instanciado diretamente**.

Sua principal diferença para uma classe concreta é que ela pode possuir **métodos abstratos**, ou seja, métodos declarados sem implementação.

A responsabilidade de implementar esses métodos fica para as classes filhas.

### Exemplo conceitual

```dart id="n4l5kd"
abstract class ContaBancaria {
  void sacar(double valor);
}

class ContaCorrente extends ContaBancaria {
  @override
  void sacar(double valor) {
    print("Sacando R\$ $valor");
  }
}
```

---

## Quando devo usar classes abstratas em vez de classes concretas?

Use classes abstratas quando quiser representar um conceito genérico que não faz sentido existir sozinho.

Exemplo:

* ContaBancaria → conceito genérico
* ContaCorrente → implementação concreta
* ContaPoupanca → implementação concreta

Faz sentido criar uma conta corrente.

Não faz sentido criar diretamente uma conta bancária genérica.

---

# 2. Encapsulamento: Getters e Setters

## Como posso criar um getter e um setter para acessar e modificar um atributo privado?

No Dart, atributos iniciados com `_` são privados ao arquivo.

Getters e setters permitem controlar o acesso a esses dados.

```dart id="d0hkxz"
class Conta {
  double _saldo = 0.0;

  // Getter
  double get saldo => _saldo;

  // Setter
  set saldo(double valor) {
    if (valor >= 0) {
      _saldo = valor;
    } else {
      print(
        "Operação inválida: saldo não pode ser negativo.",
      );
    }
  }
}
```

---

## Em quais situações é melhor usar getters e setters?

### Validação de Dados

Impedem estados inválidos.

Exemplo:

* Saldo negativo
* Idade negativa
* Quantidade menor que zero

### Atributos Computados

Permitem calcular informações sem armazená-las.

```dart id="lpl5je"
String get nomeCompleto => "$nome $sobrenome";
```

### Encapsulamento

Se a lógica interna mudar futuramente, quem usa a classe continua utilizando a mesma interface pública.

---

# 3. Contratos de Comportamento: Herança vs Interface vs Composição

## O que é uma interface em Dart e como ela define um contrato?

Dart não possui uma palavra-chave específica chamada `interface`.

Toda classe define automaticamente uma interface formada por seus membros públicos.

Quando utilizamos `implements`, estamos usando essa classe apenas como contrato.

A classe implementadora deve recriar toda a lógica dos membros definidos.

---

## Qual a diferença entre herança (`extends`) e implementação de interfaces (`implements`)?

### Herança (`extends`)

Representa uma relação de:

> "É um"

A classe filha herda comportamento e implementação da classe pai.

```dart id="t8ghmj"
class Animal {}

class Cachorro extends Animal {}
```

---

### Interface (`implements`)

Representa uma relação de:

> "Se comporta como"

A classe não herda implementação.

Ela apenas assume o compromisso de implementar todos os membros definidos.

```dart id="vml6yu"
class Impressora {
  void imprimir() {}
}

class ImpressoraLaser implements Impressora {
  @override
  void imprimir() {
    print("Imprimindo...");
  }
}
```

---

## Qual a diferença entre herança e composição?

### Herança

A classe recebe características de outra classe.

```dart id="w4w4md"
class Animal {}

class Cachorro extends Animal {}
```

---

### Composição

A classe possui outro objeto internamente.

```dart id="if7l56"
class Motor {
  void ligar() => print("Vrummm!");
}

class Carro {
  final Motor motor;

  Carro(this.motor);
}
```

Nesse caso:

> O carro TEM um motor.

Enquanto na herança:

> O cachorro É um animal.

---

## Por que composição costuma ser considerada uma prática melhor?

A composição gera menos acoplamento.

Ela permite trocar comportamentos em tempo de execução sem modificar a hierarquia de classes.

Por isso existe o princípio:

> Prefira composição à herança.

---

# 4. Membros Estáticos e Enumeradores (Enums)

## O que são métodos estáticos ou métodos de classe?

Métodos marcados com `static` pertencem à classe e não aos objetos criados a partir dela.

Eles não possuem acesso ao `this`, pois não estão associados a nenhuma instância específica.

---

## Quais cenários devo usar métodos estáticos e como acessá-los?

Utilize métodos estáticos quando a operação não depende do estado de um objeto.

Exemplos:

* Conversores
* Utilitários matemáticos
* Validações genéricas

```dart id="m2z5zl"
class Calculadora {
  static const double pi = 3.1415;

  static double calcularAreaCirculo(double raio) {
    return pi * raio * raio;
  }
}

void main() {
  double area =
      Calculadora.calcularAreaCirculo(5);

  print(area);
}
```

Observe que não foi necessário criar:

```dart id="17vszf"
var calculadora = Calculadora();
```

O acesso ocorreu diretamente pela classe.

---

## O que são enumeradores (Enums) em Dart e para que servem?

Enums são tipos especiais usados para representar um conjunto fixo e limitado de valores possíveis.

Eles substituem o uso de:

* Strings mágicas
* Números arbitrários
* Constantes espalhadas pelo sistema

---

## Em quais situações é melhor usar enums?

Quando existe um conjunto fechado de opções.

Exemplos:

* Status de pedido
* Dias da semana
* Tipos de pagamento
* Níveis de acesso

---

### Exemplo

```dart id="x0r3ru"
enum StatusPedido {
  aguardando,
  pago,
  enviado,
  entregue
}

void verificarStatus(StatusPedido status) {
  if (status == StatusPedido.pago) {
    print("Preparando para envio.");
  }
}
```

O compilador garante que apenas valores válidos do enum sejam utilizados.

---

# Observações Pessoais de Aprendizado

## Interfaces Implícitas no Dart

O entendimento de que qualquer classe pode atuar como interface através de `implements` simplifica bastante a arquitetura.

Isso evita a necessidade de estruturas separadas para contratos e implementações.

---

## Uso Consciente do `static`

Membros estáticos são excelentes para utilitários e constantes globais.

Por outro lado, o uso excessivo pode dificultar testes automatizados e aumentar o acoplamento do sistema.

---

## Composição Sobre Herança

A herança cria uma ligação forte entre classes.

Já a composição oferece mais flexibilidade e permite trocar comportamentos sem alterar a estrutura da aplicação.

---

# Conclusão

Os conceitos avançados de POO em Dart expandem significativamente a capacidade de modelar sistemas complexos.

Herança, interfaces, classes abstratas, encapsulamento, membros estáticos e enums fornecem mecanismos para criar código reutilizável, seguro e organizado.

Entre os aprendizados mais relevantes, destaca-se a preferência por composição em vez de herança excessiva, o uso consciente de membros estáticos e a compreensão de que interfaces em Dart são implícitas, tornando a linguagem mais simples sem perder poder arquitetural.
