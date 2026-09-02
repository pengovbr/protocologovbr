
# language: pt

Funcionalidade: Triagem pela Equipe de Protocolo

  Como atendente da equipe de Protocolo
  Quero analisar e tratar as solicitações recebidas
  Para encaminhar corretamente as demandas dos cidadãos

  Contexto:
    Dado que o atendente realizou login no sistema com credenciais válidas
    E acessou o menu "Protocolo GOV.BR > Protocolar documentos Gov.Br"
    E existem solicitações cadastradas no sistema

 
  Cenário: Visualizar detalhes de uma solicitação recebida
    Quando selecionar uma solicitação na lista central
    Então o sistema deve exibir os detalhes da solicitação
    E deve apresentar os dados do solicitante
    E deve apresentar os documentos anexados
    E deve exibir as opções de tratamento da solicitação

 
  Esquema do Cenário: Exibir status das atividades da solicitação
    Dado que a solicitação possui o status "<status>"
    Quando o atendente visualizar a solicitação
    Então o sistema deve apresentar o card correspondente ao status "<status>"

    Exemplos:
      | status        |
      | Pendente      |
      | Em andamento  |
      | Concluído     |


  Cenário: Iniciar atendimento de uma solicitação
    Dado que existe uma solicitação pendente de triagem
    Quando o atendente clicar no botão "Atender"
    Então o formulário da solicitação deve ser aberto
    E todas as informações cadastradas devem ser exibidas

 
  Cenário: Finalizar solicitação com resposta personalizada
    Dado que o atendente está atendendo uma solicitação
    Quando selecionar a opção "Enviar resposta personalizada"
    E informar uma resposta ao solicitante
    E anexar o documento de resultado da análise
    E confirmar a operação
    Então o sistema deve encaminhar a resposta ao cidadão
    E a solicitação deve ser concluída


  Cenário: Solicitar ajustes ao cidadão
    Dado que o atendente identificou inconsistências na solicitação
    Quando selecionar a opção "Solicitar ajustes"
    E informar as orientações necessárias para correção
    E confirmar a operação
    Então o sistema deve enviar a solicitação de ajuste ao cidadão
    E a solicitação deve permanecer pendente
    E o status deve ser atualizado para "Em Ajustes"


  Cenário: Enviar solicitação para o SPE gerando novo processo
    Dado que a solicitação está apta para protocolização
    Quando o atendente selecionar a opção "Subir para o SPE"
    E confirmar o envio
    Então o sistema deve criar um processo no SPE
    E deve gerar um Número Único de Protocolo (NUP)
    E deve enviar o NUP ao solicitante por e-mail


  Cenário: Enviar anexos para processo já existente no SPE
    Dado que existe um NUP previamente cadastrado
    Quando o atendente selecionar a opção "Subir para o SPE"
    E informar o NUP existente
    E confirmar o envio
    Então os documentos da solicitação devem ser associados ao processo informado

 
  Cenário: Manter solicitação aberta após envio ao SPE
    Dado que o atendente está enviando a solicitação para o SPE
    Quando optar por manter a solicitação aberta
    Então a solicitação deve permanecer disponível para utilização do módulo Resposta


  Esquema do Cenário: Pesquisar solicitações por informações básicas
    Quando o atendente pesquisar pelo campo "<criterio>"
    Então o sistema deve retornar as solicitações correspondentes

    Exemplos:
      | criterio                     |
      | Número da solicitação        |
      | Número do processo no SPE    |
      | Data                         |
      | Tipo de solicitação          |
      | Nome do solicitante          |
      | Nome do atendente            |


  Esquema do Cenário: Filtrar solicitações por status
    Quando o atendente aplicar o filtro "<filtro>"
    Então o sistema deve exibir apenas as solicitações compatíveis

    Exemplos:
      | filtro                                   |
      | Todas                                    |
      | Caixa de Entrada                         |
      | Em Aberto                                |
      | Aguardando Triagem                       |
      | Aguardando resposta da equipe técnica    |
      | Em Ajustes                               |
      | Concluídas                               |
      | Canceladas pelo Cidadão                  |
      | Erro de Integração                       |


  Esquema do Cenário: Utilizar buscas salvas
    Quando o atendente selecionar a busca salva "<tipoBusca>"
    Então o sistema deve apresentar os resultados correspondentes

    Exemplos:
      | tipoBusca                              |
      | Solicitações aguardando triagem        |
      | Solicitações devolvidas para ajustes   |
      | Solicitações por período               |
      | Solicitações triadas e enviadas ao SPE |
