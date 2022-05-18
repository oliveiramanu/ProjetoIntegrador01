-- Apaga o banco de dados caso exista.
DROP DATABASE IF EXISTS bookside;

-- Cria o banco de dados
CREATE DATABASE bookside CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Seleciona banco de dados.
USE bookside; 

-- Cria tabela de usuários/autores.
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(255),
    user_email VARCHAR(255),
    user_birth DATE,
    user_photo VARCHAR(255),
    user_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_profile TEXT,
    user_password VARCHAR(255),
    user_type ENUM('user', 'author', 'admin') DEFAULT 'user',
    user_status ENUM('on', 'off', 'deleted') DEFAULT 'on'
);

-- Cria tabela de artigos
CREATE TABLE articles (
    art_id INT PRIMARY KEY AUTO_INCREMENT,
    art_title VARCHAR(127),
    art_intro VARCHAR(255),
    art_thumb VARCHAR(255),
    art_content TEXT,
    art_author INT,
    art_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    art_status ENUM('on', 'off', 'deleted') DEFAULT 'on',
    FOREIGN KEY (art_author) REFERENCES users (user_id)
);

-- Cria tabela de comentários nos artigos
CREATE TABLE comments (
    cmt_id INT PRIMARY KEY AUTO_INCREMENT,
    cmt_article INT,
    cmt_author INT,
    cmt_comment TEXT,
    cmt_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cmt_status ENUM('on', 'off', 'deleted') DEFAULT 'on',
    FOREIGN KEY (cmt_article) REFERENCES articles (art_id),
    FOREIGN KEY (cmt_author) REFERENCES users (user_id)
);

-- Cria tabela com contatos do site
CREATE TABLE contacts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(127),
    email VARCHAR(255),
    subject VARCHAR(255),
    message TEXT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('on', 'off', 'deleted') DEFAULT 'on'
);

-- Insere dados em 'users'
INSERT INTO users (
    user_name,
    user_email,
    user_birth,
    user_photo,
    user_profile,
    user_password,
    user_type
) VALUES 
(
    'Carol Perdigão',
    'carolperdigao@gmail.com',
    '2001-02-19',
    '/img/carol.png',
    'Resenhista, Futura Programadora, Jogadora de League of Legends e Leitora nas horas vagas.',
    SHA1('Qw3rtyui0P'),
    'author'
),
(
    'Emanuelle Oliveira',
    'emanuelleoliveira@gmail.com',
    '2001-12-25',
    '/img/emanuelle.png',
    'Resenhista, Futura Programadora, Viciada em True Crime e (muito) Leitora nas horas vagas.',
    SHA1('Qw3rtyui0P'),
    'user'
),
(
    'Gabriel Santana',
    'gabrielsantana@gmail.com',
    '2004-03-28',
    '/img/gabriel.png',
    'Resenhista, Futuro Programador, Amante de Músicas e Leitor nas horas vagas.',
    SHA1('Qw3rtyui0P'),
    'admin'
);

-- Insere dados em 'articles'
INSERT INTO articles (
    art_title,
    art_intro,
    art_thumb,
    art_content,
    art_author
) VALUES
(
    'Uma Sombra na Escuridão',
    'Robert Bryndza o novo queridinho do gênero suspense',
    '/img/articles/1.jpg',
    '<p>Erika Foster tem agora um desafio aterrorizante.“A sombra respirou fundo, saiu da escuridão e subiu as escadas silenciosamente. Para observar. Para aguardar. Para colocar em prática a vingança que há tanto tempo planejava.”Em uma noite de verão, a Detetive Erika Foster é convocada para trabalhar em uma cena de homicídio. A vítima: um médico encontrado sufocado na cama. Seus pulsos estão presos e através de um saco plástico transparente amarrado firmemente sobre sua cabeça é possível ver seus olhos arregalados.Poucos dias depois, outro cadáver é encontrado, assassinado exatamente nas mesmas circunstâncias. As vítimas são sempre homens solteiros, bem-sucedidos e, pelo que tudo indica, há algo misterioso em suas vidas.</p><p> Mas, afinal, qual é o segredo desses homens? Qual é a ligação entre as vítimas e o assassino?Erika e sua equipe se aprofundam na investigação e descobrem um serial killer calculista que persegue seus alvos até achar o momento certo para atacá-los.Agora, Erika Foster fará de tudo para deter aquela sombra e evitar mais vítimas, mesmo que isso signifique arriscar sua carreira e também sua própria vida. </p><p> <a href=https://www.amazon.com.br/Uma-sombra-escurid%C3%A3o-Robert-Bryndza/dp/8582354304/ref=sr_1_1?keywords=uma+sombra+na+escurid%C3%A3o&qid=1652896827&sprefix=uma+som%2Caps%2C269&sr=8-1”=> • Link para copra do livro</a></p>',
    '2'
),
(
    'Quem é Você Alaska?',
    'Estaria John Green em uma ressaca literária?',
    '/img/articles/2.jpg',
    '<p>Miles Halter estava em busca de um Grande Talvez. Alasca Young queria descobrir como sair do labirinto. Suas vidas colidiram na Escola Culver Creek, e nada nunca mais foi o mesmo. Miles Halter levava uma vidinha sem graça e sem muitas emoções (ou amizades) na Flórida. Ele tinha um gosto peculiar: memorizar as últimas palavras de grandes personalidades da história. Uma dessas personalidades, François Rabelais, um poeta do século XV, disse no leito de morte que ia “em busca de um Grande Talvez”. Para não ter que esperar a morte para encontrar seu Grande Talvez, Miles decide fazer as malas e partir. Ele vai para a Escola Culver Creek, um internato no ensolarado Alabama. </p><p>Lá, ele conhece Alasca Young. Ela tem em seu livro preferido, O general em seu labirinto , de Gabriel García Márquez, a pergunta para a qual busca incessantemente uma resposta: “Como vou sair desse labirinto?” Inteligente, engraçada, louca e incrivelmente sexy, Alasca vai arrastar Miles para seu labirinto e catapultá-lo sem misericórdia na direção do Grande Talvez. Miles se apaixona por Alasca, mesmo sem entendê-la, mesmo tentando sem sucesso decifrar o enigma de seus olhos verde-esmeralda. </p><p><a href=”https://www.amazon.com.br/Quem-Voc%C3%AA-Alasca-Green-John/dp/8580576830/ref=sr_1_5?keywords=quem+%C3%A9+voc%C3%AA+alasca&qid=1652897168&sprefix=quem+%2Caps%2C228&sr=8-5”=> • Link para compra do livro</a></p>',
    '3'
),
(
    'A Seleção',
    'O livro que a netflix esqueceu a adaptação no churrasco',
    '/img/articles/3.jpg',
    '<p>Para trinta e cinco garotas, a Seleção é a chance de uma vida. É a oportunidade de ser alçada a um mundo de vestidos deslumbrantes e joias valiosas. De morar em um palácio, conquistar o coração do belo príncipe Maxon e um dia ser a rainha. America Singer, no entanto, estar entre as Selecionadas é um pesadelo. Significa deixar para trás o rapaz que ama. Abandonar sua família e seu lar para entrar em uma disputa ferrenha por uma coroa que ela não quer. E viver em um palácio sob a ameaça constante de ataques rebeldes.</p><p>Então America conhece pessoalmente o príncipe - e percebe que a vida com que sempre sonhou talvez não seja nada comparada ao futuro que nunca tinha ousado imaginar.</p><p><a href=”https://www.amazon.com.br/sele%C3%A7%C3%A3o-Kiera-Cass/dp/8565765016/ref=sr_1_1_sspa?keywords=a+sele%C3%A7%C3%A3o&qid=1652895622&sprefix=a+sele%2Caps%2C172&sr=8-1-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUExNlhLMjJFVVA1WlIxJmVuY3J5cHRlZElkPUEwMDIxNjEwMUNEQlFLODhXSDEyNiZlbmNyeXB0ZWRBZElkPUEwNTQ4MDAxM1ZVUVlNWVdLMzBUWCZ3aWRnZXROYW1lPXNwX2F0ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU"=>• Link para compra do livro</a></p>',
    '1'
),
(
    'Duna',
    'Romance e Sci-fi de Frank Herbert conquista corações após lançamento de adaptação',
    '/img/articles/4.jpg',
    '<p><p>Doze anos se passaram desde que Paul Atreides ascendeu ao trono e acumulou os títulos de imperador e messias. Líder do maior império que a humanidade já viu, Paul está terrivelmente consciente do peso de suas decisões. Arrakis tornou-se o centro do Imperium, de onde os fremen se propagaram a fim de levar sua filosofia e forma de governar aos planetas por eles conquistados. Os inevitáveis conflitos gerados por essa expansão fazem importantes facções contrárias ao imperador reunirem forças para detê-lo. Uma grande disputa está prestes a ter início nos bastidores do poder, e apenas MuadDib pode decidir o destino de todos. Messias de Duna é o segundo volume da série criada por frank herbert. Ele revela um lado mais humano de seus personagens, além de aprofundar e estender o universo de Duna, aliando discussões políticas, filosóficas e religiosas à épica história de poder, vingança e redenção. </p><p>O Imperium vive um interregno após Paul Atreides abdicar de seu título de imperador e entregar-se ao deserto. Sua irmã, Alia, ascende ao poder como regente enquanto os filhos de MuadDib não são capazes de assumir o Trono do Leão. Herdeiros não só do poder político e econômico de seu pai, os gêmeos também carregam em suas veias toda a carga genética manipulada por séculos pela Irmandade Bene Gesserit. Mas a hegemonia dos Atreides está ameaçada. </p><p><a href="https://www.amazon.com.br/Box-Duna-Primeira-Trilogia-Arrakis/dp/6586064414/ref=sr_1_4?__mk_pt_BR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=T6DX5B1V982F&keywords=duna&qid=1652900154&sprefix=duna%2Caps%2C218&sr=8-4&ufe=app_do%3Aamzn1.fos.6a09f7ec-d911-4889-ad70-de8dd83c8a74"=> • Link para a compra do livro </a></p>',
    '2'
),
(
    'Cruel',
    'Autora Bianca Ribeiro lança mais uma obra literária pra conquistar os corações de leitores que amam histórias românticas e de tirar o fôlego',
    '/img/articles/5.jpg',
    '<p>Cruel narra a história de Rose Vallahar, uma garota de 17 anos que perde os pais num incêndio misterioso e se vê obrigada a viver sob a tutela do egocêntrico e mundialmente famoso estilista Cruel DeVil. Atraída pela beleza e mistério que o envolvem, Rose começa a conhecer a verdadeira personalidade de Cruel e se apaixona por ele, tendo que lidar com os altos e baixos do rapaz que parece ser muito mais o vilão do que o mocinho da história. Em meio a esse relacionamento conturbado, Rose se depara com a verdade sobre a morte de seus pais, sobre sua real identidade e descobre que sua vida está entrelaçada à vida de Cruel de uma maneira que ela nunca poderia ter imaginado.</p><p>Após ultrapassar marca de 10 milhões de leituras na plataforma online Wattpad, "Cruel" agora conquista cada vez mais corações de leitores vorazes que amam histórias românticas, envolventes e de tirar o fôlego. </p><p><a href="https://www.amazon.com.br/Cruel-Bianca-Ribeiro-ebook/dp/B08667M7BM/ref=sr_1_5?__mk_pt_BR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=20CDGNFCV9MR9&keywords=cruel&qid=1652894969&sprefix=cruel%2Caps%2C310&sr=8-5"=> •Link para a compra do livro</a></p>',
    '3'
),
(
    'A Doméstica',
    'Autora Débora Vieira lança mais uma obra literária pra conquistar os corações de leitores que amam histórias românticas e de tirar o fôlego',
    '/img/articles/6.jpg',
    '<p>Malu foi criada por um família humilde do interior, apesar disso, sempre valorizou e aproveitou a sua liberdade. Tem uma tia que mora na capital,então, aos 20 anos decide mudar o rumo de sua vida e vai em busca de um emprego na cidade grande. Com a ajuda de uma amiga de sua tia, Malu acaba conseguindo o emprego de empregada doméstica na casa de um empresário viúvo. </p><p>Erik sempre foi um homem centrado e obsessivo por trabalho. Confia somente em seu avô, pois, Leva consigo marcas de um passado obscuro, sendo assim,  evita sentimentos e somente se envolve com acompanhantes de luxo. É um homem frio, arrogante, esnobe e desprezível com as pessoas que o cercam.</p><p><a href="https://www.wattpad.com/story/173218163-dom%C3%A9stica"=> • Link para compra do livro</a></p>',
    '1'
);
