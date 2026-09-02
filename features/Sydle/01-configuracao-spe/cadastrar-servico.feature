# language: pt

Funcionalidade: Cadastro de Serviço do SPE

  Como Administrador do Sistema
  Quero cadastrar um serviço
  Para permitir que o Protocolo GOV.BR utilize as operações disponibilizadas pelo SPE

  Regra de Negócio:
    - O sistema deve existir previamente.
    - O serviço deve estar vinculado ao sistema.
    - Os campos obrigatórios devem ser preenchidos.
    - O serviço só poderá ser utilizado após o salvamento.

  Cenário: Cadastrar serviço com sucesso
    Dado que existe um sistema cadastrado
    Quando acessar "Administração > Sistemas > Listar"
    E selecionar o sistema cadastrado
    E acessar "Serviços"
    E clicar em "Novo"
    E preencher os campos obrigatórios
    E clicar em "Salvar"
    Então o serviço deverá ser criado com sucesso

  Cenário: Cadastrar serviço sem informar os dados obrigatórios
    Dado que o usuário está na tela de cadastro de serviço
    Quando não informar os campos obrigatórios
    E clicar em "Salvar"
    Então deverá ser exibida mensagem de erro
