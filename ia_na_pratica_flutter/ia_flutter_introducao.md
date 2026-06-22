# Relatório de Estudo: Introdução ao Flutter e Widgets

## 1. Estrutura Básica e MaterialApp
O `MaterialApp` é o widget raiz que configura o ambiente visual.
* **Função:** Configura navegação, temas e a direção do texto (`Directionality`).
* **Parâmetros Principais:** `home` (tela inicial), `theme` (estilo global), `title` (nome do app).

## 2. O Papel do Scaffold
O `Scaffold` é o widget de "esqueleto" de uma página no Material Design. 
* **Função:** Ele fornece a estrutura visual básica para uma tela.
* **Componentes principais:**
    * `appBar`: Define a barra superior.
    * `body`: Onde o conteúdo principal (seu layout) é exibido.
    * `floatingActionButton`: Botão flutuante para ações rápidas.
    * `drawer`: Menu lateral.

## 3. Widgets: Stateless vs. Stateful
A principal diferença entre eles é a capacidade de reagir a mudanças de dados.

### Widgets Stateless (Sem Estado)
São imutáveis. Uma vez renderizados, não alteram sua aparência.
* **Quando usar:** Interface estática (ex: textos fixos, ícones).

### Widgets Stateful (Com Estado)
São dinâmicos. Podem reconstruir sua interface em tempo de execução via `setState()`.
* **Gerenciamento de Estado:** Utiliza a classe `State`. O `setState()` é o mecanismo que avisa ao Flutter para rodar o `build()` novamente.



## 4. Diferenças Principais (Resumo)

| Característica | Stateless | Stateful |
| :--- | :--- | :--- |
| **Alteração** | Imutável | Mutável |
| **Atualização** | Não permite `setState` | Permite `setState` |
| **Uso** | Exibição de dados fixos | Interações e dados dinâmicos |

## 5. Observações sobre o Aprendizado
* **A importância do Pai:** Aprendi que widgets como `Text` e `RichText` não funcionam soltos; precisam de um ancestral (como `MaterialApp` ou `Directionality`) que defina o contexto.
* **Estrutura (Scaffold):** Entendi que o `Scaffold` é essencial para organizar a página, evitando que os elementos fiquem "jogados" no topo da tela.
* **Automação:** Desenvolvi um script em PowerShell para limpar processos (`taskkill`) e evitar conflitos de porta, otimizando o fluxo de debug.
* **Reatividade:** O `setState` é o ponto de entrada para criar apps que reagem ao usuário.

---
*Relatório gerado com suporte de IA como ferramenta de consulta para conceitos de arquitetura Flutter.*