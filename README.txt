Banco de Dados da Oficina Mecânica

O Banco de Dados da Oficina Mecânica é uma representação lógica do sistema de gerenciamento de uma oficina mecânica. Este banco de dados foi projetado para armazenar informações sobre clientes, veículos, peças, serviços, ordens de serviço e seus respectivos itens.
Tabelas

O banco de dados é composto pelas seguintes tabelas:

    Clientes: Armazena os dados dos clientes da oficina, como nome, telefone e e-mail.

    Veiculos: Contém informações sobre os veículos dos clientes, incluindo modelo, marca e ano. Possui uma chave estrangeira que referencia a tabela de clientes.

    Pecas: Registra os detalhes das peças disponíveis na oficina, como nome e preço.

    Servicos: Mantém os serviços oferecidos pela oficina, com descrição e preço.

    OrdensServico: Guarda os dados das ordens de serviço realizadas, como data e observações. Possui chaves estrangeiras que referenciam as tabelas de clientes e veículos.

    ItensOrdemServico: Registra os itens de cada ordem de serviço, como peças utilizadas e serviços prestados, juntamente com as quantidades. Possui chaves estrangeiras que relacionam as tabelas de ordens de serviço, peças e serviços.

Funcionalidades Principais

O banco de dados da Oficina Mecânica permite:

    Registrar informações dos clientes e seus veículos.
    Cadastrar e consultar peças disponíveis na oficina.
    Gerenciar os serviços oferecidos e seus respectivos preços.
    Registrar ordens de serviço, com data e observações.
    Associar peças e serviços a cada ordem de serviço, registrando as quantidades utilizadas/prestadas.
    Realizar consultas para obter informações detalhadas sobre os clientes, veículos, ordens de serviço e valores envolvidos.

O esquema do banco de dados foi projetado de forma a permitir a relação entre os diferentes elementos da oficina, possibilitando consultas eficientes e fornecendo uma visão completa do histórico de serviços prestados a cada cliente.
