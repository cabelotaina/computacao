* Inteligencia Artificial

Softeware para gerar ... 
http://protege.stanford.edu/support.php#documentationSupport

Desc sobre base de conhecimento
https://en.wikipedia.org/wiki/Knowledge_base

Leitores de pensamentos
https://github.com/tofl/Simple-mind-reader
https://github.com/search?p=2&q=mind+reader&type=Repositories&utf8=%E2%9C%93
https://github.com/jmxpearson/mindreader
http://alternativeto.net/software/entitycube-mind-reader/
http://pt.akinator.com/

Web Semantica
https://www.w3.org/standards/semanticweb/data

Ler os textos sobre inteligencia artificial:

https://moodle.ufsc.br/course/view.php?id=71225

Fazer o trabalho 2 além de olhar o codigo que esta no sistema visitar o aluno do professor na sala 505


** Tarefas
pegar o codigo que o juliao escreveu e fazer um merge com a minha inteface:

Merge do código pode ser visto em https://github.com/cabelotaina/porrinha

** Professor pediu para olhar esse material em uma aula
http://www.inf.ufsc.br/grafos/temas/travessia/potes.htm

** Mais infos sobre a disciplina de IA:
http://www.inf.ufsc.br/~mauro.roisenberg/ine5371/5371.html
https://en.wikipedia.org/wiki/Minimax#/media/File:Plminmax.gif
https://es.wikipedia.org/wiki/%C3%81rbol_de_juego
https://es.wikipedia.org/wiki/Backgammon
https://www.ime.usp.br/~slago/slago-jogos.pdf
https://web.fe.up.pt/~eol/IA/IA0809/APONTAMENTOS/Alunos_MiniMax.pdf
https://github.com/cabelotaina/grafo/blob/master/grafo.rb
https://www.youtube.com/watch?v=6ELUvkSkCts
https://pt.wikipedia.org/wiki/Minimax
algoritmo da poda em arvore com minmax
http://www3.ntu.edu.sg/home/ehchua/programming/java/javagame_tictactoe_ai.html
http://www.geeksforgeeks.org/minimax-algorithm-in-game-theory-set-3-tic-tac-toe-ai-finding-optimal-move/
https://gist.github.com/MatthewSteel/3158579
https://www.codeproject.com/Articles/43622/Solve-Tic-Tac-Toe-with-the-MiniMax-algorithm
https://pt.wikipedia.org/wiki/Teoria_combinat%C3%B3ria_dos_jogos

** Massa
http://aimotion.blogspot.com.br/2009/01/aprenda-aplicar-inteligencia-artificial.html
http://neverstopbuilding.com/minimax
http://www.maawko.com/blog/freecodecamp/jogo-da-velha-entendendo-o-algoritimo-minimax/
http://perfecttictactoe.herokuapp.com/

** Aprendendo a fazer jogos

def __init__(self):
  global game_state
  #A fim de manter na memória o estado do jogo, utilizamos uma matriz preenchida de:
  #0 se o quadrado estiver vazio, 1 se o quadrado for ocupado por uma jogada do Fone 
  #e 2 se o quadrado for ocupado por uma jogada do jogador. (3 x 3)
  game_state=[[0,0,0],[0,0,0],[0,0,0]]
  
  #Variável que armazena todas as possíveis sequências de posições que levam à vitória do jogo.
  self.end_game_state = [[(0,0),(0,1),(0,2)],[(1,0),(1,1),(1,2)],[(2,0),(2,1),(2,2)],
          [(0,0),(1,0),(2,0)],[(0,1),(1,1),(2,1)],[(0,2),(1,2),(2,2)],
          [(0,0),(1,1),(2,2)],[(0,2),(1,1),(2,0)]]
 
  (...)
 
 (...)


jogada do telefone

6 palitos no total (posso fazer com que os outros jogadores sejam jogadores aleatórios)

Total de 7 jogadas na primeira rodada (tirando os inversos e impedindo o jogo com a mão vazia) e 13 possiveis jogadas nas rodadas subsequentes

No caso a maquina é o Max e o Humano seria o Min

Escolher um numero de palitos que seja o mais diferente possivel do numero de palitos na ultima jogada, principalmente se o jogador humano errou

como implementar o blefe?
 	
** Mensagem que o professor descreve a tarefa do jogo da porrinha


Olá XXXX

vamos às dúvidas:

Trabalho sobre Métodos de busca
Jogo de palitos (porrinha)
 
Esta parte do texto explica o jogo de um modo geral (como costuma ser jogado por seres humanos)

    Usam-se palitos ou qualquer outro material que possa ficar dentro da palma da mão.
    Pode ser jogado de 2 a várias pessoas. Cada pessoa terá 3 palitoso e terá de escolher uma quantidade a colocar na mão sem que os .adversários saibam
    Você quer que o jogo seja jogado entre 2 e infinitas pessoas e/ou IA's?
    Temos que misturar pessoas com IA's ou podem ser somente IA's jogando?
    Fica a critério de vocês. A sugestão é que o usuário defina, no início o número de jogadores. Mas o bom senso indica que um número muito grande de jogadores não é uma boa idéia. Podem limitar o número máximo se preferirem. A idéia principal é que todos os jogadores sejam robots, mas podem incluir a opção de um jogador humano poder participar (não é obrigatório)
    Depois todos deixam a mão fechada sobre a mesa, então cada jogador apostara quanto dara a soma de todos os palitos que esta na mão de cada um.

    Quem acerta o total elimina um palito e segue o jogo com nova rodada e, em cada nova rodada,, o jogador que acertou o lance anterior é sempre o primeiro a fazer a aposta.

    Ganha aquele que ficar sem nenhum palito, apos ter acertado repetidas vezes seu palpite.

    Pode-se estabelecer que, na primeira rodada não é permitido sair como a mão vazia, isso elimina algumas possibilidades, tornando a primeira rodada menos difícil, por exemplo, num jogo com 5 participantes o mínimo é 5 (um para cada), ou seja, não será apostado “lona” (zero) na primeira rodada. As rodadas seguintes tendem a ficar mais emocionantes.
    Você diz que pode-se, mas você quer que implementemos isso ou é opcional?
    Ou deve ser uma configuração do programa usar ou não essa regra?
    Isto não é necessário no trabalho

    Existe uma variação onde, a cada rodada diminui um participante e o perdedor da última rodada (onde participam 2) deverá pagar a conta da rodada.

    Tudo bem, existem essa variação, mas você quer que:
    1. Nós implementemos essa variação, junto com a outra acima que diz:
    `Ganha aquele que ficar sem nenhum palito, apos ter acertado repetidas vezes seu palpite.`
    Assim isso é uma configuração do jogo, entre escolher essa variação ou o jogo normal, quando iniciamos o programa?
    2. Ou nós podemos escolher entre implementar essa variação ou a primeiro opção

Podem escolher

    Implementar um agente jogador do jogo de palitos que interaja com um grupo de até cinco adversários, decidindo quantos palitos, em um máximo de 3, ele vai jogar no lance e, quando for a sua vez de jogar, decida, a partir de uma matriz com o número de palitos máximo que cada adversário ainda possui e o número apostado por cada adversário, ele decida a sua aposta.
    No requisito logo acima diz que pode ser de 2 a infinitas pessoas, mas aqui diz que a IA deve trabalhar com até 5 pessoas. Então que dizer que o jogo deve suportar somente entre 2 e 5 pessoas e/ou IA’s adversárias, e não de 2 até infinitas pessoas e/ou IA’s adversárias?

No começo do texto refere-se ao jogo, de modo geral. Na implentação é recomendado limitar o número de participantes em 5 pessoas

    Na próxima rodada ele recebe a informação de que algum dos jogadores tenha acertado o lance e atualiza o número de palitos que cada adversário tem no jogo.

A ENTREGA DO TRABALHO DEVE SER FEITA ATRAVÉS DO MOODLE EM FORMA DE UM RELATÓRIO EM PDF E O ARQUIVO EXECUTÁVEL

Um arquivo executável para qual plataforma? Windows 'joqo.exe', Linux 'jogo'
Então no caso se o jogo é em Java, você quer receber o arquivo executável 'jogo.class' e não o código fonte 'jogo.java'?
E no caso de python que é dependente do interpretador python, você quer que eu compile o python `jogo.py` em um 'joqo.exe'?http://stackoverflow.com/questions/203487/creating-self-contained-python-applications

Como eu deixei a critério de voces a ferramenta de implementação, a idéia de " executável " é que o professor nao tenha que fazer malabarismos para testar o aplicativo tendo que compilar codigo fonte ou instalar ambientes pouco comuns de run time. Eu uso Mac, Ubuntu e Windows nesta ordem de preferencia. Idealmente, o programa deve funcionar em uma destas plataformas com o menor esforço possível. Alguns alunos costumam, por exemplo, entregar trabalhos que só funcionam dentro do Eclipse ou outra IDE similar, que muitas vezes depende de configurações e bibliotecas auxiliares específicas para o programa rodar. É isso que peço que evitem. No caso de Python, Java, Lua ou Prolog, por exemplo, posso instalar um interpretador ou VM se me indicarem qual foi usado.

E no `RELATÓRIO EM PDF`, o que se espera de conteúdo, Introdução, Sumário, Algoritmos, Detalhes de Implementação, Trabalhos Futuros, Conclusão?

Sim, mas pode ser bem sucinto, focando detalhes dos algoritmos e implementação e testes.

