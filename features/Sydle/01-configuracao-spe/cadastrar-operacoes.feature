# language: pt

Funcionalidade: Cadastro das Operações do Serviço

  Como Administrador do Sistema
  Quero cadastrar as operações exigidas pela integração
  Para permitir a comunicação completa entre o SPE e o Protocolo GOV.BR

  Regra de Negócio:
    - O serviço deve existir previamente.
    - Toda operação deve ser cadastrada individualmente.
    - Unidade deve possuir valor "Todas".
    - Tipo de Processo deve possuir valor "Todos".
    - Para operações de documento deve existir o campo Tipo de Documento.
    - Tipo de Documento deve possuir valor "Todos".

  Esquema do Cenário: Cadastrar operação obrigatória
    Dado que existe um serviço cadastrado
    Quando acessar "Operações"
    E clicar em "Novo"
    E selecionar "<Operacao>"
    E selecionar Unidade igual a "Todas"
    E selecionar Tipo de Processo igual a "Todos"
    E clicar em "Salvar"
    Então a operação deverá ser cadastrada com sucesso

    Exemplos:
      | Operacao                                 |
      | Gerar Processo                           |
      | Consultar Processo                       |
      | Enviar Processo                          |
      | Reabrir Processo                         |
      | Concluir Processo                        |
      | Incluir Documento                        |
      | Adicionar Arquivo                        |
      | Adicionar Conteúdo Arquivo               |
      | Consultar Documento                      |
      | Listar Extensões de Arquivo Permitidas   |

  Cenário: Cadastrar operação Incluir Documento
    Dado que o Administrador selecionou a operação "Incluir Documento"
    Quando o sistema exibir o campo "Tipo de Documento"
    E selecionar o valor "Todos"
    E salvar
    Então a operação deverá ser cadastrada

  Cenário: Cadastrar operação Consultar Documento
    Dado que o Administrador selecionou a operação "Consultar Documento"
    Quando o sistema exibir o campo "Tipo de Documento"
    E selecionar o valor "Todos"
    E salvar
    Então a operação deverá ser cadastrada
