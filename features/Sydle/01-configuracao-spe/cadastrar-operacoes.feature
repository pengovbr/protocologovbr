# language: pt

Funcionalidade: Cadastro de Operações

  Esquema do Cenário: Cadastrar operação obrigatória

    Dado que existe um serviço cadastrado
    Quando o administrador incluir a operação "<operacao>"
    Então a operação deve ficar disponível para integração

    Exemplos:
      | operacao                            |
      | Gerar Processo                      |
      | Consultar Processo                  |
      | Enviar Processo                     |
      | Reabrir Processo                    |
      | Concluir Processo                   |
      | Incluir Documento                   |
      | Adicionar Arquivo                   |
      | Adicionar Conteúdo Arquivo          |
      | Consultar Documento                 |
      | Listar Extensões Permitidas         |
