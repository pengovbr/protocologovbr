# language: pt

Funcionalidade: Cadastro de Serviço do Protocolo GOV.BR

  Como administrador do SPE
  Quero cadastrar um serviço
  Para disponibilizar operações para integração

  Cenário: Cadastrar serviço
    Dado que existe um sistema previamente cadastrado
    Quando acessar os serviços do sistema
    E incluir um novo serviço
    E informar os campos obrigatórios
    Então o serviço deve ser salvo

  Cenário: Alterar serviço existente
    Dado que existe um serviço cadastrado
    Quando alterar seus dados
    E salvar
    Então as informações devem ser atualizadas
