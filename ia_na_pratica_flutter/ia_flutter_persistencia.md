# ia_flutter_persistencia.md

## 1. Introdução
Esta atividade teve como objetivo compreender a persistência de dados em aplicativos Flutter, focando no uso do pacote `SharedPreferences` para armazenamento local de informações simples e na estruturação de projetos utilizando o padrão `Provider`.

## 2. Conceitos Estudados
Através de interação com IA, foram esclarecidos os seguintes pontos fundamentais sobre persistência:

* **O que é persistência de dados**: É o processo de salvar o estado de um aplicativo em um meio de armazenamento não volátil (como a memória flash do dispositivo), garantindo que os dados persistam após o encerramento do aplicativo.
* **Tipos de dados persistíveis**: Podem ser desde preferências simples do usuário (configurações, temas) até bancos de dados relacionais complexos (SQLite) ou documentos NoSQL.
* **O que é o SharedPreferences**: Um pacote para Flutter que armazena dados em pares de chave-valor. É ideal para configurações simples e pequenas quantidades de dados.
* **Limitações do SharedPreferences**: Não possui criptografia nativa, não é adequado para grandes volumes de dados e não suporta consultas complexas como um banco de dados relacional.
* **Quando usar**: Deve-se optar pelo `SharedPreferences` para dados de configuração, estados simples ou tokens de autenticação leves. Para dados estruturados e complexos, recomenda-se SQLite ou Isar.
* **Melhores práticas**: Instanciar o `SharedPreferences` uma vez, utilizar `async/await` para operações de I/O e sempre fornecer valores padrão ao ler dados, evitando erros de nulidade.

## 3. Observações sobre a implementação e o projeto
Durante o desenvolvimento do gerenciador de pessoas, observei que:

* **Estrutura de Estado**: O uso do `Provider` (com `ChangeNotifier`) é a forma mais eficaz de centralizar a lógica de dados, permitindo que a UI apenas escute as mudanças (`Consumer`).
* **Widgets Essenciais**: 
    * `Expanded`: Fundamental para evitar erros de renderização (overflow) em listas.
    * `TextEditingController`: A ponte necessária para capturar input do usuário de forma controlada.
    * `trailing`: Facilita a organização de botões de ação em listas.
* **Próximos passos**: Para persistir a lista de objetos `Person` criada no projeto, o próximo passo seria serializar a lista para formato `JSON` e armazenar essa string no `SharedPreferences`.

## 4. Conclusão
A atividade permitiu entender que a persistência de dados vai além de apenas salvar uma variável; trata-se de arquitetar o app para que ele seja resiliente e eficiente na gestão das informações que ele manipula.