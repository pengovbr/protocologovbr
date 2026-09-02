# language: pt

Funcionalidade: Cadastro do Sistema no SPE

  Como administrador do SPE
  Quero cadastrar o sistema Protocolo GOV.BR
  Para permitir sua integração com o ambiente do órgão

  Cenário: Cadastrar sistema com sucesso
    Dado que o administrador acessou o menu Administração > Sistemas
    Quando informar a sigla do sistema
    E informar o nome do sistema
    E salvar o cadastro
    Então o sistema deve ser cadastrado com sucesso

  Cenário: Impedir cadastro sem sigla
    Dado que o administrador iniciou um cadastro
    Quando deixar a sigla em branco
    E solicitar o salvamento
    Então o sistema deve exibir mensagem de validação
