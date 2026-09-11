# language: pt

Funcionalidade: Atendimento de solicitação na plataforma Sydle

  Como Atendente de Protocolo
  Quero acessar uma solicitação recebida
  Para realizar sua análise e encaminhamento

  Contexto:
    Dado que o usuário possui o perfil "Atendente de Protocolo"
    E acessou a plataforma Sydle autenticado

  Cenário: Atender uma solicitação recebida
    Quando acessar uma solicitação pendente
    E analisar as informações enviadas pelo cidadão
    Então o sistema deverá permitir a continuidade do atendimento
    E registrar a ação realizada pelo atendente
