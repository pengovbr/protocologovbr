#language: pt

Funcionalidade: Configuração da Integração do Protocolo GOV.BR com o SPE

  Como Configurador de Integração
  Quero configurar a integração entre o Protocolo GOV.BR e o SPE
  Para permitir a comunicação entre os sistemas por meio de webservice

  Contexto:
    Dado que estou autenticado no Protocolo GOV.BR
    E possuo o perfil "Configurador de Integração"

  Cenário: Acessar a funcionalidade de criação de webservice
    Quando acessar o menu "Protocolo GOV.BR"
    E selecionar a opção "Criar web service"
    Então o sistema deve apresentar o formulário de configuração do webservice

  Cenário: Criar integração com sucesso
    Dado que estou na tela "Criar web service"
    Quando informar os seguintes dados:
      | Órgão                     | Órgão Exemplo |
      | URL                       | https://orgao.gov.br/sei/ws/SeiWS.php |
      | Sigla do Sistema          | SEI |
      | Identificador do Serviço  | SERVICO_SEI |
      | Utiliza User-Agent        | Não |
    E clicar em "Validar webservice"
    Então o sistema deve validar a comunicação com o SPE
    E apresentar o resultado da validação com sucesso
    Quando clicar em "Criar web service"
    Então o sistema deve registrar a integração
    E apresentar mensagem de sucesso

  Esquema do Cenário: Validar campos obrigatórios
    Dado que estou na tela "Criar web service"
    Quando deixar o campo "<Campo>" em branco
    E clicar em "Validar webservice"
    Então o sistema deve exibir mensagem de preenchimento obrigatório para o campo "<Campo>"

    Exemplos:
      | Campo                     |
      | Órgão                     |
      | URL                       |
      | Sigla do Sistema          |
      | Identificador do Serviço  |

  Cenário: Impedir validação com URL inválida
    Dado que estou na tela "Criar web service"
    Quando informar uma URL inválida
    E clicar em "Validar webservice"
    Então o sistema deve informar que a URL é inválida
    E não deve permitir a criação da integração

  Cenário: Impedir validação com identificador de serviço inexistente
    Dado que estou na tela "Criar web service"
    Quando informar um identificador de serviço inexistente
    E clicar em "Validar webservice"
    Então o sistema deve apresentar erro de comunicação com o SPE
    E não deve permitir a criação da integração

  Cenário: Configurar integração utilizando User-Agent
    Dado que o órgão exige autenticação por User-Agent
    E estou na tela "Criar web service"
    Quando selecionar a opção "Sim" para utilização de User-Agent
    E informar os dados da integração
    E clicar em "Validar webservice"
    Então o sistema deve considerar o User-Agent no processo de validação
    E apresentar o resultado da validação

  Cenário: Tratar falha de comunicação com o SPE
    Dado que estou na tela "Criar web service"
    Quando realizar a validação do webservice
    E ocorrer uma falha de comunicação com o SPE
    Então o sistema deve exibir a causa do erro
    E não deve permitir a criação da integração
    
  Cenário: Impedir acesso sem perfil adequado
    Dado que estou autenticado no sistema
    Mas não possuo o perfil "Configurador de Integração"
    Quando tentar acessar a funcionalidade de integração
    Então o sistema deve negar o acesso
    E apresentar mensagem de permissão insuficiente
