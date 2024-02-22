# fe_lab_clinicas_core

# Projeto Flutter Core - Fevereiro de 2024
Um projeto Flutter para ser usado em todos os projetos do ecossistema funcionando como um package próprio.
Cliente/Paciente efetua cadastro diretamente no sistema utilizando a coleta de informações pelo tablet.
Aparece os dados e senhas diretamente na tela de senhas em uma SmartTV.


## Sobre o projeto

Este projeto foi desenvolvido durante o evento Flutter Experience da academia do Flutter de Rodrigo Rahman.
Durante uma semana pude aprender através de aulas gratuitas no youtube muitas técnicas de programação.
Foi muito conhecimento adquirido ao longo do evento.

# O projeto em si consiste num sistema para clínicas de exames laboratoriais Multiplataforma. 
- Versão Mobile/Tablet: auto atendimento onde o próprio cliente faz cadastro no sistema com upload da carteirinha e pedidos médicos.
- Versão Desktop/Windows: Admin do projeto. Aqui os atendentes cadastram número do guichê que será exibido na tela a TV. Também atendem e chamam os pacientes cadastrados no auto atendimento, além visualizar a carteirinha e pedidos médicos do atendimentos.
- Versão Web: Exibe e Chama a senha e direciona para qual guichê vai ser. isso se dá em tempo real graças a utilização de Web Socket.

## Conhecimentos adquiridos e empregados

Conheci algumas funcionalizades novas do Dart e Flutter e aperfeiçoei minhas habilidades em lógica de programação.
Durante o evento pude notar uma evelução expressiva em meu nível de raciocínio e meu mindset de dev mobile.

## Packages utilizados nessa aplicação.

- environment:
-  sdk: '>=3.2.6 <4.0.0'
-  flutter: ">=1.17.0"

- dependencies:
-  flutter:
-   sdk: flutter
-  signals_flutter: ^3.0.0
-  top_snackbar_flutter: ^3.1.0
-  asyncstate: ^2.1.1-dev.1
-  loading_animation_widget: ^1.2.0+4
-  dio: ^5.4.0
-  pretty_dio_logger: ^1.3.1 
-  shared_preferences: ^2.2.2
-  flutter_getit: ^2.0.0

- dev_dependencies:
-  flutter_test:
-    sdk: flutter
-  flutter_lints: ^3.0.1