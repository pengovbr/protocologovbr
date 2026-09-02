# language: pt

Funcionalidade: Configurar Integração Sydle com SPE

  Como configurador da integração
  Quero conectar o Protocolo GOV.BR ao SPE
  Para permitir troca de informações entre os sistemas

  Cenário: Validar webservice
    Dado que os parâmetros foram preenchidos
    Quando solicitar a validação
    Então o webservice deve ser validado

  Cenário: Criar integração
    Dado que a validação foi realizada com sucesso
    Quando confirmar a criação
    Então a integração deve ser registrada
