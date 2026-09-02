# language: pt

Funcionalidade: Configurar integração do Protocolo GOV.BR com SPE no Sydle
  Como configurador de integração do órgão
  Quero cadastrar e validar o webservice do SPE
  Para permitir a comunicação entre o Protocolo GOV.BR e o sistema de processo eletrônico

  Contexto:
    Dado que o usuário possui o perfil "Configurador de Integração"
    E possui acesso ao ambiente do Protocolo GOV.BR
    E o órgão aderiu ao Protocolo GOV.BR

  Cenário: Realizar login no Protocolo GOV.BR
    Quando acessar o endereço do Protocolo GOV.BR
    E autenticar utilizando uma conta GOV.BR válida
    Então o sistema deve permitir o acesso às funcionalidades de configuração

  Cenário: Criar um novo webservice de integração
    Dado que o usuário está autenticado
    Quando acessar a opção "Criar web service"
    E informar o órgão de atuação
    E informar o nome do órgão
    E informar a URL do webservice do SPE
    E informar a sigla do sistema
    E informar o identificador do serviço
    Então o sistema deve disponibilizar a opção de validação do webservice

  Cenário: Validar webservice com dados válidos
    Dado que os parâmetros do webservice foram preenchidos corretamente
    Quando o usuário acionar a opção "Validar webservice"
    Então o sistema deve apresentar mensagem de validação bem-sucedida

  Cenário: Validar webservice com dados inválidos
    Dado que existe pelo menos um parâmetro incorreto
    Quando o usuário acionar a opção "Validar webservice"
    Então o sistema deve apresentar mensagem de erro
    E não deve permitir a criação da integração

  Cenário: Criar integração após validação bem-sucedida
    Dado que o webservice foi validado com sucesso
    Quando o usuário clicar em "Criar web service"
    Então o sistema deve registrar a integração
    E exibir mensagem de confirmação

  Cenário: Configurar User-Agent quando exigido
    Dado que o órgão utiliza autenticação por User-Agent
    Quando o usuário informar que a integração utiliza User-Agent
    E preencher as informações necessárias
    Então o sistema deve considerar o parâmetro durante a validação do webservice
