<h1 align="center">FE Lab Clinicas</h1>

---

<h2>Tópicos 📋</h2>

   <p>

   - [📖 Sobre](#-sobre)
   - [📱 Preview](#-preview)
   - [📦 Assets](#-assets)
   - [🛠️ Funcionalidades e Tecnologias Estudadas](#%EF%B8%8F-funcionalidades-e-tecnologias-estudadas)
   - [🤯 Desafios e Aprendizados ao longo do caminho](#-desafios-e-aprendizados-ao-longo-do-caminho)
   - [🤔 Como usar](#-como-usar)
   - [💪 Como contribuir](#-como-contribuir)
   - [📝 Licença](#-licença)

   </p>

---

<h2>📖 Sobre</h2>

<p>
    Projeto desenvolvido no Flutter Experience | 1ª Edição, um evento de lançamento para a <a href="http://academiadoflutter.com.br/">Academia do Flutter (ADF)</a>, do <a href="https://github.com/rodrigorahman">Rodrigo Rahman</a>.<br><br>
    Durante todo este ultimas duas semans, por ser um aluno da ADF (desde Outubro/2022), consegui entender com mais facilidade certos conceitos que ainda estavam confusos para mim, como a parte do <a href="https://pub.dev/packages/signals_flutter">Signals Flutter</a>.<br>
	Atualizado em Maio/2026<br>
    <br>
</p>


---

<h2>📦 Assets</h2>

- <a href="https://github.com/caneto/fe_lab_clinicas/blob/main/FE%20LAB%20CLINICA.postman_collection.json">Coleção do PostMan</a>
- UI Design criado para o evento: <a href="https://github.com/caneto/fe_lab_clinicas/blob/main/FlutterExperienceLabClinicas.fig">**Flutter Experience**</a>
---   

<h2>🛠️ Funcionalidades e Tecnologias Estudadas</h2>
<p>
- FE_LAB_CLINICAS_CORE - <a href="https://github.com/caneto/fe_lab_clinicas/tree/main/fe_lab_clinicas_core">O A estrutura base do Projeto</a><br/>
- FE_LAB_CLINICAS_SELF_SERVICE - <a href="https://github.com/caneto/fe_lab_clinicas/tree/main/fe_lab_clinicas_self_service">Sistema de Auto Atendimento para a Clinica em Tablet</a><br/>
- FE_LAB_CLINICAS_ADM - <a href="https://github.com/caneto/fe_lab_clinicas/tree/main/fe_lab_clinicas_adm">Sistema de Atendimento ao Paciente, em Desktop usado pelos Guiches</a><br/>
- FE_LAB_CLINICAS_PANEL - <a href="https://github.com/caneto/fe_lab_clinicas/tree/main/fe_lab_clinicas_panel">Sistema de Visualização de Chamadas em TV</a><br/>   
</p>

<h2>🤯 Desafios e aprendizado ao longo do caminho</h2>

Sem dúvida, o maior aprendizado foi o Signals, Percebi que é muito interessante para gerenciar o estado de uma aplicação, indo além em pontos que podem ser cruciais (como poder ter vários provedores do mesmo tipo, realizar o descarte quando ela não for mais utilizada, entre outras coisas) .

Além disso, foi muito legal aprender mais sobre os poderes e usos do Dart 3.2 na prática, como o novo `switch` e o uso do `pattern match`; que se encaixam muito bem e tornam o código mais objetivo. Outro ponto que foi muito interessante foi o `Either` usado sem nenhuma dependência externa. Você pode usar programação funcional com `correspondência de padrões` para lidar com casos de erro e sucesso.

Vários outros aprendizados foram adquiridos e também reforçados; além de refatorações e melhorias de código feitas ao longo do caminho. Sempre há algo a ser melhorado e aprendido. 🚀
</p>

<h2>🤔 Como usar</h2>

   ```
   É necessário ter o Flutter instalado. Para configurar o ambiente de desenvolvimento na sua máquina:
   https://flutter.dev/docs/get-started/install

   O aplicativo consome os dados do backend desenvolvido pela comunidade ADF chamado json_rest_server:
   https://pub.dev/packages/json_rest_server

   - Clone o repositório:
    $ git clone https://github.com/caneto/fe_lab_clinicas

   - Entre no diretório:
   $ cd fe_lab_clinica\

   - Entre em cada um dos 4 projetos
   $ code .

   - Instale as dependências:
   $ flutter pub get

   - Instale o json_rest_server
   $ dart pub global activate json_rest_server

   - Abra a pasta em CMD, o backend
   $ cd fe_lab_clinicas\fe_lib_clinicas_api

   - Para inicializá-lo, execute o comando:
   $ jrs run

   - Em outro terminal, no diretório raiz do projeto, execute:
   $ flutter run
   ```

---

<h2>💪 Como contribuir</h2>

   ```
   - Gosto bastante de seguir a seguinte Style Guide de Commits 😊:
   https://udacity.github.io/git-styleguide/

   - Dê um fork no projeto 

   - Cria uma nova branch com suas mudanças:
   $ git checkout -b my-feature

   - Salve suas mudanças e faça uma mensagem de commit message sobre suas alterações:
   $ git commit -m "feat: My new feature"

   - Envie suas mudanças:
   $ git push origin my-feature
   ```

---

<h2>📝 Licença</h2>

<p>
   Esse repositório está sobre a Licença GNU General Public License v3.0, e você pode vê-la no arquivo <a href="https://github.com/caneto/darkweek9_vakinha_burger/blob/main/LICENSE">LICENSE</a> para mais detalhes. 😉
</p>


---

   >Esse projeto foi desenvolvido com ❤️ por **[@Carlos Alberto Pinto](https://www.linkedin.com/in/canetorj/)**, com o instrutor **[@Rodrigo Rahman](https://br.linkedin.com/in/rodrigo-rahman)**, no evento #DartWeek da **[Academia do Flutter]**.<br>
   Se isso te ajudou, dê uma ⭐, e contribua, isso irá me ajudar também 😉


