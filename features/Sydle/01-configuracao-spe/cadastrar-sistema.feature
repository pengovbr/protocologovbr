# language: pt

Funcionalidade: Cadastro do Sistema para integração com o Protocolo GOV.BR

  Como Administrador do Sistema
  Quero cadastrar o sistema Protocolo GOV.BR no SPE
  Para permitir a integração via webservice

  Regra de Negócio:
    - Apenas Administradores podem cadastrar sistemas.
    - O nome e sigla do sistema são obrigatórios.
    - O órgão deve ser informado.
    - O cadastro deve ser persistido após salvar.

  Cenário: Cadastrar sistema com sucesso
    Dado que o Administrador acessou "Administração > Sistemas > Novo"
    Quando informar o Órgão
    E informar a Sigla "PGOV"
    E informar o Nome "Protocolo GOV.BR"
    E clicar em "Salvar"
    Então o sistema deverá ser cadastrado com sucesso
    E deverá ficar disponível para configuração dos serviços

  Cenário: Tentar salvar sem preencher campos obrigatórios
    Dado que o Administrador acessou a tela de cadastro
    Quando deixar o Nome do Sistema vazio
    E clicar em "Salvar"
    Então deverá ser exibida mensagem de validação
    E o sistema não deverá ser cadastrado
