# Interação com IA: Introdução a Funções em Dart
**Curso:** Lince Tech Academy  
**Estudante:** Daniel de Almeida  
**Objetivo:** Compreender os conceitos de funções, parâmetros, retornos e funções como objetos no Dart utilizando IA como suporte de aprendizado.

---

## 1. Respostas aos Prompts de Estudo

### Quais cuidados devo ter ao criar funções em Dart?
* **Princípio da Responsabilidade Única (SRP):** Uma função deve resolver apenas um problema. Se ela começa a fazer muitas coisas, deve ser dividida em funções menores.
* **Tipagem Clara:** Sempre declare o tipo de retorno e o tipo dos parâmetros. Evitar o uso indiscriminado de `dynamic` ajuda o compilador a encontrar erros antes do código rodar.
* **Nomes Descritivos:** Use o padrão `camelCase` e comece com verbos que indiquem claramente a ação da função (ex: `calcularTotal`, `buscarUsuario`).

### Posso chamar minha função dentro dela mesma?
Sim, isso é chamado de **Recursão**. É uma técnica muito útil para resolver problemas que podem ser divididos em subproblemas idênticos (como navegar em estruturas de pastas ou cálculos matemáticos sequenciais).
* **Atenção:** Toda função recursiva precisa obrigatoriamente de um **caso base** (condição de parada). Sem isso, ela entra em loop infinito e estoura a memória do sistema, gerando um `StackOverflowError`.

```dart
int calcularFatorial(int n) {
  if (n <= 1) return 1; // Condição de parada (Caso Base)
  return n * calcularFatorial(n - 1); // Chamada recursiva
}