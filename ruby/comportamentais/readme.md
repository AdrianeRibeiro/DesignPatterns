### 🤷‍♀️ Sobre 

- Repositório com exemplos práticos de Padrões de projeto. 
- O intuito do repositório é mais educativo, dessa forma, os exemplos de código não são complexos.

> Referências: chatGPT, [Refactoring.Guru](https://refactoring.guru).
  
<br>

### [🏗️ Padrões comportamentais](https://github.com/AdrianeRibeiro/DesignPatternsRuby/blob/main/comportamentais/)

<details>
<summary>Chain of Responsibility 🔗</summary>
  <br>

  - O padrão `Chain of Responsibility` (Corrente de Responsabilidade) permite que você passe uma solicitação através de uma cadeia de handlers. 
    - Cada handler decide se processa a solicitação ou a passa para o próximo handler na hierarquia. Isso cria uma sequência de handlers, onde cada um tem a oportunidade de processar a solicitação ou encaminhá-la para o próximo na cadeia.

  - A estrutura básica do padrão `Chain of Responsibility` inclui três componentes principais:

    - Handler (Manipulador): define uma interface para manipular solicitações e mantém uma referência para o próximo manipulador na cadeia. Geralmente, é uma classe abstrata ou uma interface.

    - ConcreteHandler (Manipulador Concreto): implementa a interface do Handler e fornece a implementação para processar a solicitação. Também pode decidir se passa a solicitação para o próximo manipulador na cadeia.

    - Client (Cliente): inicia a solicitação e a envia para o primeiro manipulador na cadeia. O cliente não precisa conhecer todos os detalhes da cadeia de manipuladores, apenas inicia a solicitação.

  - O padrão `Chain of Responsibility` é útil quando você tem vários objetos que podem lidar com uma solicitação, mas não sabe qual deles será responsável até o tempo de execução. 

  - Um exemplo comum de aplicação do `Chain of Responsibility` é em sistemas de processamento de eventos, validação de entrada ou em cenários em que existem várias etapas de manipulação de dados. Cada manipulador na cadeia pode representar uma etapa específica no processamento.

  <a href="https://github.com/AdrianeRibeiro/DesignPatternsRuby/blob/main/comportamentais/cor/">👩🏼‍💻 Show me the code</a>
</details>

<br>
<details>
<summary>Command</summary>
  <br>

  - O command transforma um pedido em um objeto independente que contém toda a informação sobre o pedido.

  - Vamos imaginar um restaurante como uma analogia para entender o padrão de design Command.

  > Analogia

  - Pedido do Cliente (Command): Um cliente decide o que deseja do cardápio (comando).

  - Garçom (Invoker): O garçom recebe o pedido do cliente e o entrega à cozinha sem saber como o prato será preparado.

  - Cozinheiro (Receptor): O cozinheiro sabe como preparar cada prato e executa a ação associada ao pedido.

  - Cardápio (Command): O cardápio representa a lista de comandos disponíveis. Cada prato no cardápio é um comando concreto que pode ser executado.
  
  > Benefícios

  - Desacoplamento: O garçom não precisa saber como cada prato é preparado. Ele simplesmente passa os pedidos para a cozinha. 

  - Atraso na Execução: Os pedidos são atrasados até que sejam necessários.

  - Suporte a Operações Desfazer/Refazer: Se houver um erro no pedido, o cliente pode solicitar uma correção. 

  <a href="https://github.com/AdrianeRibeiro/DesignPatternsRuby/blob/main/comportamentais/command/">👩🏼‍💻 Show me the code</a>
</details>