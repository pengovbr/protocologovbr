# language: pt

Funcionalidade: Configuração de Solicitação no Protocolo GOV.BR (Sydle)

  Como configurador de solicitação
  Quero cadastrar e configurar uma solicitação
  Para que os cidadãos possam protocolar documentos via Protocolo GOV.BR

  Contexto:
    Dado que o usuário possui o perfil "Configurador de Solicitação"
    E acessou o sistema Sydle autenticado via gov.br
    E acessou o menu "Protocolo GOV.BR > Configuração de Solicitação"

  @cadastro
  Cenário: Cadastrar um novo tipo de solicitação
    Quando clicar na opção "Cadastrar tipo de solicitação"
    E informar o nome da solicitação
    E selecionar o órgão responsável
    E definir a solicitação como ativa
    E salvar o cadastro
    Então a solicitação deverá ser criada com sucesso
    E deverá ser exibida na lista de solicitações cadastradas

  @ativacao
  Cenário: Ativar solicitação para disponibilização ao cidadão
    Dado que existe uma solicitação cadastrada
    Quando marcar o campo "Ativo" como "Sim"
    E salvar a configuração
    Então a solicitação deverá ficar visível para os cidadãos

  @inativacao
  Cenário: Inativar solicitação
    Dado que existe uma solicitação cadastrada
    Quando marcar o campo "Ativo" como "Não"
    E salvar a configuração
    Então a solicitação não deverá ser exibida aos cidadãos

  @multiorgao
  Cenário: Definir avaliação destinada ao órgão provido
    Dado que o órgão possui estrutura multiórgãos
    Quando marcar "A avaliação será destinada ao órgão provido?" como "Sim"
    E selecionar o órgão provido
    Então as avaliações deverão ser direcionadas ao órgão selecionado

  @multiorgao
  Cenário: Definir triagem destinada ao órgão provido
    Dado que o órgão possui estrutura multiórgãos
    Quando marcar "A triagem será destinada ao órgão provido?" como "Sim"
    E selecionar o órgão provido
    Então apenas usuários do órgão provido deverão visualizar as solicitações recebidas

  @prazo-ajuste
  Esquema do Cenário: Configurar prazo para atendimento de ajustes
    Quando selecionar o prazo "<prazo>"
    E salvar a configuração
    Então o prazo deverá ser registrado com sucesso

    Exemplos:
      | prazo |
      | 7     |
      | 15    |
      | 30    |
      | 60    |

  @orientacao
  Cenário: Informar link de orientação ao cidadão
    Quando preencher o campo "Link de orientação"
    E salvar a solicitação
    Então o link deverá ser associado à solicitação

  @orientacao
  Cenário: Cadastrar orientações da solicitação
    Quando informar instruções ao solicitante
    E salvar a configuração
    Então as orientações deverão ser apresentadas no formulário da solicitação

  @triagem
  Cenário: Solicitação com triagem pelo protocolo
    Quando selecionar "Será realizada triagem pelo Protocolo?" como "Sim"
    Então a solicitação deverá ser direcionada para ambiente de triagem
    E deverá ser disponibilizada a configuração de envio ao SPE

  @sem-triagem
  Cenário: Solicitação sem triagem pelo protocolo
    Quando selecionar "Será realizada triagem pelo Protocolo?" como "Não"
    Então a solicitação deverá ser enviada diretamente ao SPE
    E deverá ser exibida a opção de manter a solicitação aberta ou fechada

  @aberta
  Cenário: Manter solicitação aberta com módulo resposta habilitado
    Dado que a solicitação não possui triagem
    Quando selecionar "Aberta"
    E habilitar o módulo de resposta
    Então a solicitação deverá permanecer aberta até o envio da resposta ao cidadão

  @fechada
  Cenário: Encerrar solicitação automaticamente
    Dado que a solicitação não possui triagem
    Quando selecionar "Fechada"
    Então a solicitação deverá ser concluída após o envio ao SPE

  @integracao-spe
  Cenário: Configurar integração com SPE
    Quando selecionar um Web Service
    E informar uma unidade de destino
    E selecionar um tipo de processo
    E selecionar um tipo de documento de recibo
    Então os parâmetros da integração deverão ser salvos

  @nup-existente
  Cenário: Permitir informar processo existente
    Quando marcar "O solicitante poderá informar protocolo anterior?" como "Sim"
    Então o sistema deverá disponibilizar a configuração de reabertura de processo

  @reabertura
  Cenário: Configurar unidade de reabertura
    Dado que a indicação de protocolo anterior está habilitada
    Quando marcar "Configurar unidade de reabertura?" como "Sim"
    E selecionar uma unidade
    Então a unidade deverá ser utilizada para reabertura do processo

  @sincronizacao
  Cenário: Sincronizar parâmetros do SPE
    Quando clicar no botão "Atualizar"
    Então os parâmetros do SPE deverão ser sincronizados com a Sydle

  @pesquisa-processo
  Cenário: Configurar link de acompanhamento processual
    Quando informar o link de pesquisa de processos
    E salvar a solicitação
    Então o link deverá ser disponibilizado ao cidadão

  @documentacao-obrigatoria
  Cenário: Adicionar documento obrigatório
    Quando incluir um documento obrigatório
    E definir extensões permitidas
    E definir tamanho máximo em MB
    Então o documento deverá ser cadastrado como obrigatório

  @documentacao-opcional
  Cenário: Adicionar documento opcional
    Quando incluir um documento opcional
    E definir extensões permitidas
    E definir tamanho máximo em MB
    Então o documento deverá ser cadastrado como opcional

  @documentacao-adicional
  Cenário: Permitir anexação de documentação adicional
    Quando habilitar documentação adicional
    E definir extensões permitidas
    E definir limite de tamanho
    Então o cidadão poderá anexar documentos complementares

  @validacao
  Cenário: Validar limite máximo de anexos
    Quando configurar anexos para uma solicitação
    Então o tamanho total permitido não deverá ultrapassar 600 MB

  @procuracao
  Cenário: Exigir procuração para representação de terceiros
    Quando habilitar a exigência de procuração
    Então o cidadão deverá anexar procuração ao protocolar em nome de terceiros

  @informacoes-adicionais
  Cenário: Permitir inclusão de informações adicionais
    Quando marcar a opção de informações adicionais como "Sim"
    Então o formulário deverá exibir um campo para complementação pelo cidadão

  @notificacoes
  Cenário: Personalizar templates de notificação
    Quando editar um template de notificação
    E salvar as alterações
    Então a notificação personalizada deverá ser utilizada nas comunicações ao cidadão

  @conclusao
  Cenário: Finalizar cadastro da solicitação
    Dado que todas as configurações obrigatórias foram preenchidas
    Quando clicar em concluir cadastro
    Então o sistema deverá exibir mensagem de confirmação
    E a solicitação deverá ficar disponível para geração do link de acesso
