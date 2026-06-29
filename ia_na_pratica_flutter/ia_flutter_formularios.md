# Estudo: Formulários em Flutter

Este documento resume os conceitos fundamentais explorados sobre a manipulação de formulários e entrada de dados no Flutter.

---

## 1. Entrada de Dados: TextField e TextFormField

### O que é o TextField?
O **TextField** é o widget básico do Flutter para coletar entrada de texto do usuário. Ele permite que o usuário digite, edite e interaja com o teclado do dispositivo.

### Diferença: TextField vs. TextFormField
* **TextField:** É um widget de baixo nível, ideal para casos simples onde não há necessidade de integração com o ecossistema de formulários do Flutter.
* **TextFormField:** É um "wrapper" (invólucro) do *TextField* que se integra ao widget **Form**. Sua grande vantagem é o suporte a validações nativas e o controle de estado via `FormFieldState`.

### Obtenção de Dados
Para capturar o que o usuário digita:
1.  **TextEditingController:** Você cria uma instância de `TextEditingController` e a associa ao campo. Com ele, você pode acessar `controller.text` a qualquer momento.
2.  **Callback onChanged:** Uma função que dispara a cada tecla pressionada, útil para atualizações em tempo real.

### Customização e Parâmetros
Para tornar a interface mais amigável, utilizamos o `InputDecoration`:
* **Limitar caracteres:** Propriedade `inputFormatters` com `LengthLimitingTextInputFormatter`.
* **Tipo de teclado:** Propriedade `keyboardType` (ex: `TextInputType.emailAddress`, `TextInputType.number`).
* **Ícones:** Propriedades `prefixIcon` ou `suffixIcon` dentro do `InputDecoration`.

---

## 2. Validação de Campos

Validar um campo é o processo de garantir que os dados inseridos pelo usuário atendam às regras de negócio antes de serem processados.

* **Validação Síncrona:** A resposta acontece instantaneamente (ex: verificar se um campo está vazio).
* **Validação Assíncrona:** Ocorre quando é necessário consultar uma fonte externa, como uma API ou banco de dados (ex: verificar se um nome de usuário já existe no servidor).



---

## 3. Seleção: CheckBox e Radio

Estes widgets são essenciais para coletar escolhas binárias ou de seleção única.

### CheckBox
Usado para opções booleanas (Verdadeiro/Falso). 
* **Aplicabilidade:** "Aceitar termos de uso", "Lembrar-me".
* **Customização:** A cor pode ser alterada via `fillColor` ou `checkColor`. Para mudar a forma, pode-se envolver o checkbox em um `Theme` ou utilizar pacotes externos, visto que o padrão segue o Material Design.

### Radio
Usado para permitir que o usuário escolha apenas **uma** opção de um conjunto.
* **Aplicabilidade:** Escolhas exclusivas, como "Gênero" ou "Método de Pagamento".
* **Funcionamento:** É necessário um grupo de widgets `Radio` que compartilham a mesma variável de estado (`groupValue`). Quando um é selecionado, os outros são desmarcados automaticamente.

---

## Observações sobre o Estudo

Ao interagir com a IA para compreender estes componentes, notei que:
1.  **O uso de controladores é vital:** Sem o `TextEditingController`, a manipulação de dados em formulários complexos torna-se muito ineficiente.
2.  **Formulários exigem Estado:** A validação e a captura de dados de *Radio* e *CheckBox* dependem quase inteiramente de gerenciar o estado da tela (usando `setState` ou gerenciadores mais complexos).
3.  **Boas práticas:** A validação dentro do `TextFormField` (via `validator`) é muito mais robusta do que tentar validar manualmente cada `TextField` isolado.

---

