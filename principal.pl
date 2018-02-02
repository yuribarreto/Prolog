:-module(menu,[menu/0]).
:-dynamic menu/0.
:-dynamic genero/4.
:-dynamic cliente/19.
:-dynamic dependente/5.
:-dynamic empresa/11.
:-dynamic fornecedor/14.
:-dynamic funcionario/14.
:-dynamic contapagar/5.
:-dynamic contasreceber/8.
:-dynamic reserva/8.
:-dynamic locacao/6.
:-dynamic midia/4.
:-dynamic itemlocacao/6.
:-dynamic exemplar/9.
:-dynamic filme/10.
:-dynamic categoria/4.
:-dynamic despesa/6.
:-dynamic sangria/7.
:-dynamic caixa/6.
:-dynamic preco/7.
:-dynamic movimento/6.
:-dynamic pagamento/7.

menu:-
    write(' MENU PRINCIPAL ' ),nl,
    write(' 1 - Menu Clientes e Dependentes '),nl,
    write(' 2 - Menu Empresa, Fornecedores e Funcionarios '),nl,
    write(' 3 - Menu Contas a Pagar e a Receber'),nl,
    write(' 4 - Menu Reserva e Locacao '),nl,
    write(' 5 - Menu item, Exemplar e Midia '),nl,
    write(' 6 - Menu Filme, Genero e Categoria '),nl,
    write(' 7 - Menu Preco, Pagamento e Movimento '),nl,
    write(' 8 - Menu Sangria, Despesa e Caixa '),nl,
    write(' 9 - Sair'),nl,
	write(' Entre com o menu que deseja acessar '),nl,
	read(Opcao),
	processa(Opcao).

processa(1):-
	write(' MENU CLIENTES E DEPENDENTES '),nl,
	write('1 - Cadastrar Clientes '),nl,
	write('2 - Consultar Clientes '),nl,
	write('3 - Alterar Cadastro de Cliente '),nl,
	write('4 - Excluir Cliente '),nl,
	write('5 - Cadastrar Dependente '),nl,
	write('6 - Consultar Dependentes '),nl,
	write('7 - Alterar Cadastro de Dependente '),nl,
	write('8 - Excluir Dependente '),nl,
	write('9 - Voltar ao menu principal '),nl,
	write(' Entre com a opcao desejada '),nl,
	read(OpcaoM1),
	processaM1(OpcaoM1).


processa(2):-
    consult('empresa.pl'),
    consult('fornecedor.pl'),
    consult('funcionario.pl'),
    write(' MENU EMPRESA, FORNECEDORES E FUNCIONARIOS '),nl,
    write(' 1 - Cadastrar Empresa '),nl,
    write(' 2 - Consultar Empresa '),nl,
    write(' 3 - Cadastrar Fornecedor '),nl,
    write(' 4 - Consultar Fornecedor '),nl,
    write(' 5 - Cadastrar Funcionario '),nl,
    write(' 6 - Consultar Funcionario '),nl,
    write(' 7 - Voltar ao menu principal '),nl,
    write(' Entre com a opcao desejada '),nl,
    read(OpcaoM2),
    processaM2(OpcaoM2).


processa(3):-
    consult('contasreceber.pl'),
    consult('conta_pagar.pl'),
    write(' MENU CONTAS A PAGAR E CONTAS A RECEBER '),nl,
    write(' 1 - Cadastrar Conta a Pagar '),nl,
    write(' 2 - Conultar Conta a Pagar'),nl,
    write(' 3 - Cadastrar Conta a Receber '),nl,
    write(' 4 - Consultar Conta a Receber'),nl,
    write(' 5 - Voltar ao Menu Principal '),nl,
    write(' Entre com a opcao desejada '),nl,
    read(OpcaoM3),
    processaM3(OpcaoM3).

processa(4):-
    consult('locacao.pl'),
    consult('reserva.pl'),
    write(' MENU RESERVA E LOCACAO '),nl,
    write('1 - Cadastrar Reserva'),nl,
    write('2 - Consultar Reserva'),nl,
    write('3 - Cadastrar Locacao '),nl,
    write('4 - Consultar Locacao'),nl,
    write('5 - Voltar ao menu Principal'),nl,
    write(' Entre com a opcao desejada '),nl,
    read(OpcaoM4),
    processaM4(OpcaoM4).


processa(5):-
	consult('itemlocacao.pl'),
	consult('exemplar.pl'),
	consult('midia.pl'),
    write(' MENU ITEM, EXEMPLAR E MIDIA '),nl,
    write(' 1 - Cadastrar Item '),nl,
    write(' 2 - Consultar Item '),nl,
    write(' 3 - Cadastrar Exemplar '),nl,
    write(' 4 - Consultar Exemplar '),nl,
    write(' 5 - Cadastrar Midia '),nl,
    write(' 6 - Consultar Midia '),nl,
    write(' 7 - Voltar ao menu Principal '),nl,
    write(' Entre com a opcao desejada '),nl,
    read(OpcaoM5),
    processaM5(OpcaoM5).



processa(6):-
	consult('filme.pl'),
	consult('categoria.pl'),
	write(' MENU FILME, GENERO E CATEGORIA '),nl,
	write('1- Cadastrar Filme '),nl,
	write('2- Consultar Filme '),nl,
	write('3- Cadastrar Genero '),nl,
	write('4- Consultar Genero '),nl,
	write('5- Excluir Genero '),nl,
	write('6- Alterar Genero '),nl,
	write('7- Cadastrar Categoria'),nl,
	write('8- Consultar Categoria'),nl,
	write('9- Retornar ao menu principal'),nl,
	write(' Entre com a opcao desejada '),nl,
	read(OpcaoM6),
	processaM6(OpcaoM6).

processa(7):-
	consult('preco.pl'),
	consult('pagamento.pl'),
	consult('movimento.pl'),
    write(' MENU PRECO, PAGAMENTO E MOVIMENTO'),nl,
    write('1- Cadastrar Preco '),nl,
    write('2- Consultar Preco '),nl,
    write('3- Cadastrar Pagamento '),nl,
    write('4- Consultar Pagamento '),nl,
    write('5- Cadastrar Movimento '),nl,
    write('6- Consultar Movimento '),nl,
    write('7- Voltar ao menu principal '),nl,
    write(' Entre com a opcao desejada '),nl,
    read(OpcaoM7),
    processaM7(OpcaoM7).

processa(8):-
	consult('sangria.pl'),
	consult('despesa.pl'),
	consult('caixa.pl'),
	write(' SANGRIA, DESPESA E CAIXA '),nl,
	write('1- Cadastrar Sangria '),nl,
	write('2- Consultar Sangria '),nl,
	write('3- Cadastrar Despesa '),nl,
	write('4- Consultar Despesa '),nl,
	write('5- Cadastrar Caixa '),nl,
	write('6- Consultar Caixa '),nl,
	write('7- Voltar ao menu principal'),nl,
	write(' Entre com a opcao desejada '),nl,
	read(OpcaoM8),
	processaM8(OpcaoM8).

processa(9):-
	halt.


processaM1(1):-
	        write(' Cadastrar novo cliente '),nl,
	        write('Entre com os dados:'),nl,
		write('Nome:'),nl,
		read(B),
		write('Endereco:'),nl,
		read(C),
		write('Complemento:'),nl,
		read(D),
		write('Cidade:'),nl,
		read(E),
		write('Telefone:'),nl,
		read(F),
		write('Celular:'),nl,
		read(G),
		write('Estado Civil:'),nl,
		read(H),
		write('RG:'),nl,
		read(I),
		write('CPF:'),nl,
		read(J),
		write('Data de Nascimento:'),nl,
		read(K),
		write('Mae:'),nl,
		read(L),
		write('Pai:'),nl,
		read(M),
		write('Sexo:'),nl,
		read(N),
		write('E-mail:'),nl,
		read(O),
		write('Ref. Comercial:'),nl,
		read(P),
		write('Data cadastro:'),nl,
		read(Q),
		write('Status:'),nl,
		read(R),
		write('Codigo do funcionario:'),nl,
		read(S),nl,
		contador_cliente(X),
		open('cliente.pl', append, Fluxo),
		write(Fluxo,cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S)),
		write(Fluxo,'. '),
		close(Fluxo),
		processa(1).


processaM1(2):-
	consult('cliente.pl'),
    write(' Consulta Cliente '),nl,
    write(' Entre com o codigo do cliente '),nl,
    read(X),
    cliente(X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_),
	setof(X,cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),T),
	write(' Codigo: '),
	write(T),nl,
	setof(B,cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),U),
	write(' Nome: '),
	write(U),nl,
	setof(C,cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),V),
	write(' Endereco: '),
	write(V),nl,
	setof(D,cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),W),
	write(' Complemento: '),
	write(W),nl,
	setof(E,cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),Y),
	write(' Cidade: '),
	write(Y),nl,
	setof(F,cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),Z),
	write(' Telefone: '),
	write(Z),nl,
	setof(G,cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),A),
	write(' Celular: '),
	write(A),nl,
	setof(H,cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),AA),
	write(' Estado Civil: '),
	write(AA),nl,
	setof(I,cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),AB),
	write(' RG: '),
	write(AB),nl,
	setof(J,cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),AC),
	write(' CPF: '),
	write(AC),nl,
	setof(K,cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),AD),
	write(' Data de Nascimento: '),
	write(AD),nl,
	setof(L,cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),AE),
	write(' Mae: '),
	write(AE),nl,
	setof(M,cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),AF),
	write(' Pai: '),
	write(AF),nl,
	setof(N,cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),AG),
	write(' Sexo: '),
	write(AG),nl,
	setof(O,cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),AH),
	write(' E-mail: '),
	write(AH),nl,
	setof(P,cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),AI),
	write(' Ref. Comercial: '),
	write(AI),nl,
	setof(Q,cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),AJ),
	write(' Data de Cadastro: '),
	write(AJ),nl,
	setof(R,cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),AK),
	write(' Status: '),
	write(AK),nl,
	setof(S,cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),AL),
	write(' Cod. Funcionario: '),
	write(AL),nl,
	processa(1).

processaM1(3):-
	write(' ALTERACAO DE CLIENTE '),nl,
	write(' 1 - Alterar Nome '),nl,
	write(' 2 - Alterar Endereco '),nl,
	write(' 3 - Alterar Complemento '),nl,
	write(' 4 - Alterar Cidade '),nl,
	write(' 5 - Alterar Telefone '),nl,
	write(' 6 - Alterar Celular '),	nl,
	write(' 7 - Alterar Estado Civil '),nl,
	write(' 8 - Alterar RG '),nl,
	write(' 9 - Alterar CPF '),nl,
	write(' 10 - Alterar Data Nascimento '),nl,
	write(' 11 - Alterar Mae '),nl,
	write(' 12 - Alterar Pai '),nl,
	write(' 13 - Alterar Sexo '),nl,
	write(' 14 - Alterar E-mail '),nl,
	write(' 15 - Alterar Ref. Comercial '),nl,
	write(' 16 - Alterar Data de Cadastro '),nl,
	write(' 17 - Alterar Status '),nl,
	write(' 18 - Alterar Cod. Funcionario '),nl,
	write(' 19 - Voltar ao menu Clientes e Dependentes '),nl,
	read(AlteraCliente),
	processaCliente(AlteraCliente).

processaM1(4):-
	consult('cliente.pl'),
	write(' REMOVER CLIENTE '),nl,
	write(' Entre com o codigo do cliente: '),
	read(X),
	cliente(X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_),
	retractall(cliente(X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_)),
	tell('cliente.pl'),
	listing(cliente),
	told,
	processa(1).


processaM1(5):-
       	write(' CADASTRO DE DEPENDENTE '),nl,
        write('Entre com os dados:'),nl,
       	write('Codigo do cliente'),nl,
       	read(B),
       	write('Nome do dependente'),nl,
       	read(C),
       	write('Descricao do dependente'),nl,
       	read(D),
       	write('Status'),nl,
       	read(E),nl,
       	contador_dependente(X),
        open('dependente.pl', append, Fluxo),
	write(Fluxo,dependente(X,B,C,D,E)),
	write(Fluxo,'. '),
	close(Fluxo),
	processa(1).

processaM1(6):-
 	consult('dependente.pl'),
    write(' CONSULTA DEPENDENTE '),nl,
    write(' Entre com o codigo do dependente: '),nl,
    read(X),
    dependente(X,_,_,_,_),
	setof(X,dependente(X,B,C,D,E),F),
	write(' Codigo: '),
	write(F),nl,
	setof(B,dependente(X,B,C,D,E),G),
	write(' Codigo Cliente: '),
	write(G),nl,
	setof(C,dependente(X,B,C,D,E),J),
	write(' Nome do dependente: '),
	write(J),nl,
	setof(D,dependente(X,B,C,D,E),H),
	write(' Descricao: '),
	write(H),nl,
	setof(E,dependente(X,B,C,D,E),I),
	write(' Status: '),
	write(I),nl,
	processa(1).

processaM1(7):-
	write(' ALTERACAO DE DEPENDENTE '),nl,
	write(' 1 - Alterar Cod. Cliente '),nl,
	write(' 2 - Alterar Nome '),nl,
	write(' 3 - Alterar Descricao '),nl,
	write(' 4 - Alterar Status '),nl,
	write(' 5 - Voltar ao menu Clientes e Dependentes '),nl,
	write(' Entre com a opaco desejada '),nl,
	read(AlteraDependente),
	processaDependente(AlteraDependente).

processaM1(8):-
	consult('dependente.pl'),
	write(' EXCLUIR DEPENDENTE '),nl,
	write(' Entre com o codigo do dependente '),nl,
	read(X),
	dependente(X,_,_,_,_),
	retractall(dependente(X,_,_,_,_)),
	tell('dependente.pl'),
	listing(dependente),
	told,
	processa(1).

processaM1(9):-
	menu.

processaM2(1):-
	    write('CADASTRO DE EMPRESA'),nl,
	    write('Entre com os dados:'),nl,
		write('Nome:'),nl,
		read(B),
		write('Data:'),nl,
		read(C),
		write('Endereco:'),nl,
		read(D),
		write('Cidade:'),nl,
		read(E),nl,
		write('Telefone:'),nl,
		read(F),nl,
		write('Fax:'),nl,
		read(G),nl,
		write('Cgc:'),nl,
		read(H),nl,
		write('Email:'),nl,
		read(I),nl,
		write('Status:'),nl,
		read(J),nl,
		write('Cep:'),nl,
		read(K),nl,
		contador_empresa(X),
	open('empresa.pl', append, Fluxo),
	write(Fluxo,empresa(X,B,C,D,E,F,G,H,I,J,K)),
	write(Fluxo,'. '),
	close(Fluxo),
	processa(2).

processaM2(2):-
	write(' Consulta Empresa '),nl,
	write(' Entre com o codigo da empresa '),nl,
	read(X),
	empresa(X,_,_,_,_,_,_,_,_,_,_),
	setof(X,empresa(X,B,C,D,E,F,G,H,I,J,K),L),
	write(' Codigo: '),
	write(L),nl,
	setof(B,empresa(X,B,C,D,E,F,G,H,I,J,K),M),
	write(' Nome: '),
	write(M),nl,
	setof(C,empresa(X,B,C,D,E,F,G,H,I,J,K),N),
	write(' Data: '),
	write(N),nl,
	setof(D,empresa(X,B,C,D,E,F,G,H,I,J,K),O),
	write(' Endereco: '),
	write(O),nl,
	setof(E,empresa(X,B,C,D,E,F,G,H,I,J,K),P),
	write(' Cidade: '),
	write(P),nl,
	setof(F,empresa(X,B,C,D,E,F,G,H,I,J,K),Q),
	write(' Telefone: '),
	write(Q),nl,
	setof(G,empresa(X,B,C,D,E,F,G,H,I,J,K),R),
	write(' FAX: '),
	write(R),nl,
	setof(H,empresa(X,B,C,D,E,F,G,H,I,J,K),S),
	write(' CGC: '),
	write(S),nl,
	setof(I,empresa(X,B,C,D,E,F,G,H,I,J,K),T),
	write(' E-mail: '),
	write(T),nl,
	setof(J,empresa(X,B,C,D,E,F,G,H,I,J,K),U),
	write(' Status: '),
	write(U),nl,
	setof(K,empresa(X,B,C,D,E,F,G,H,I,J,K),V),
	write(' CEP: '),
	write(V),nl,
	processa(2).

processaM2(3):-
	    write('CADASTRO DE FORNECEDOR'),nl,
        write('Entre com os dados:'),nl,
		write('Nome:'),nl,
		read(B),
		write('Data:'),nl,
		read(C),
		write('Razao Social:'),nl,
		read(D),nl,
		write('Endereco:'),nl,
		read(E),nl,
		write('Cidade:'),nl,
		read(F),nl,
		write('Cep:'),nl,
		read(G),nl,
		write('Telefone:'),nl,
		read(H),nl,
		write('Fax:'),nl,
		read(I),nl,
		write('Cgc:'),nl,
		read(J),nl,
		write('Email:'),nl,
		read(K),nl,
		write('Contato:'),nl,
		read(L),nl,
		write('Status:'),nl,
		read(M),nl,
		write('Tel. contato:'),nl,
		read(A),
		contador_fornecedor(X),
	open('fornecedor.pl', append, Fluxo),
	write(Fluxo,fornecedor(X,B,C,D,E,F,G,H,I,J,K,L,M,A)),
	write(Fluxo,'. '),
	close(Fluxo),
	processa(2).

processaM2(4):-
	write(' CONSULTA FORNECEDOR '),nl,
	write(' Entre com o codigo do fornecedor '),nl,
	read(X),
	fornecedor(X,_,_,_,_,_,_,_,_,_,_,_,_,_),
	setof(X,fornecedor(X,B,C,D,E,F,G,H,I,J,K,L,M,A),N),
	write('Codigo: '),
	write(N),
	setof(B,fornecedor(X,B,C,D,E,F,G,H,I,J,K,L,M,A),O),
	write('Nome: '),
	write(O),
	setof(C,fornecedor(X,B,C,D,E,F,G,H,I,J,K,L,M,A),P),
	write('Data: '),
	write(P),
	setof(D,fornecedor(X,B,C,D,E,F,G,H,I,J,K,L,M,A),Q),
	write('Razao Social: '),
	write(Q),
	setof(E,fornecedor(X,B,C,D,E,F,G,H,I,J,K,L,M,A),R),
	write('Endereco: '),
	write(R),
	setof(F,fornecedor(X,B,C,D,E,F,G,H,I,J,K,L,M,A),S),
	write('Cidade: '),
	write(S),
	setof(G,fornecedor(X,B,C,D,E,F,G,H,I,J,K,L,M,A),T),
	write('CEP: '),
	write(T),
	setof(H,fornecedor(X,B,C,D,E,F,G,H,I,J,K,L,M,A),U),
	write('Telefone: '),
	write(U),
	setof(I,fornecedor(X,B,C,D,E,F,G,H,I,J,K,L,M,A),V),
	write('FAX: '),
	write(V),
	setof(J,fornecedor(X,B,C,D,E,F,G,H,I,J,K,L,M,A),W),
	write('CGC: '),
	write(W),
	setof(K,fornecedor(X,B,C,D,E,F,G,H,I,J,K,L,M,A),Y),
	write('E-Mail: '),
	write(Y),
	setof(L,fornecedor(X,B,C,D,E,F,G,H,I,J,K,L,M,A),Z),
	write('Contato: '),
	write(Z),
	setof(M,fornecedor(X,B,C,D,E,F,G,H,I,J,K,L,M,A),A1),
	write('Status '),
	write(A1),
	setof(A,fornecedor(X,B,C,D,E,F,G,H,I,J,K,L,M,A),A2),
	write('Tel. Contato '),
	write(A2),
	processa(2).

processaM2(5):-
	    write('CADASTRO DE FUNCIONARIO'),nl,
        write('Entre com os dados:'),nl,
		write('Nome:'),nl,
		read(B),
		write('Endereco:'),nl,
		read(C),
		write('Cidade:'),nl,
		read(D),nl,
		write('Telefone:'),nl,
		read(E),nl,
		write('Cep:'),nl,
		read(F),nl,
		write('Celular:'),nl,
		read(G),nl,
		write('Nascimento:'),nl,
		read(H),nl,
		write('Admissao:'),nl,
		read(I),nl,
		write('Rg:'),nl,
		read(J),nl,
		write('Cpf:'),nl,
		read(K),nl,
		write('Email:'),nl,
		read(L),nl,
		write('Status:'),nl,
		read(M),nl,
		write('Login:'),nl,
		read(N),nl,
		contador_funcionario(X),
	open('funcionario.pl', append, Fluxo),
	write(Fluxo,funcionario(X,B,C,D,E,F,G,H,I,J,K,L,M,N)),
	write(Fluxo,'. '),
	close(Fluxo),
	processa(2).

processaM2(6):-
	write(' CONSULTA FUNCIONARIO '),nl,
	write(' Entre com o codigo do funcionario: '),nl,
	read(X),nl,
	funcionario(X,_,_,_,_,_,_,_,_,_,_,_,_,_),
	setof(X,funcionario(X,B,C,D,E,F,G,H,I,J,K,L,M,N),O),
	write('Codigo: '),
	write(O),nl,
	setof(B,funcionario(X,B,C,D,E,F,G,H,I,J,K,L,M,N),P),
	write('Nome: '),
	write(P),nl,
	setof(C,funcionario(X,B,C,D,E,F,G,H,I,J,K,L,M,N),Q),
	write('Endereco: '),
	write(Q),nl,
	setof(D,funcionario(X,B,C,D,E,F,G,H,I,J,K,L,M,N),R),
	write('Cidade: '),
	write(R),nl,
	setof(E,funcionario(X,B,C,D,E,F,G,H,I,J,K,L,M,N),S),
	write('Telefone: '),
	write(S),nl,
	setof(F,funcionario(X,B,C,D,E,F,G,H,I,J,K,L,M,N),T),
	write('CEP: '),
	write(T),nl,
	setof(G,funcionario(X,B,C,D,E,F,G,H,I,J,K,L,M,N),U),
	write('Celular: '),
	write(U),nl,
	setof(H,funcionario(X,B,C,D,E,F,G,H,I,J,K,L,M,N),V),
	write('D. Nascimento: '),
	write(V),nl,
	setof(I,funcionario(X,B,C,D,E,F,G,H,I,J,K,L,M,N),W),
	write('Admissao: '),
	write(W),nl,
	setof(J,funcionario(X,B,C,D,E,F,G,H,I,J,K,L,M,N),A),
	write('RG: '),
	write(A),nl,
	setof(K,funcionario(X,B,C,D,E,F,G,H,I,J,K,L,M,N),A2),
	write('CPF: '),
	write(A2),nl,
	setof(L,funcionario(X,B,C,D,E,F,G,H,I,J,K,L,M,N),A3),
	write('E-mail: '),
	write(A3),nl,
	setof(M,funcionario(X,B,C,D,E,F,G,H,I,J,K,L,M,N),A4),
	write('Status: '),
	write(A4),nl,
	setof(N,funcionario(X,B,C,D,E,F,G,H,I,J,K,L,M,N),A5),
	write('Login: '),
	write(A5),nl,
	processa(2).

processaM2(7):-
	menu.

processaM3(1):-
	    write('Cadastro de conta a pagar'),nl,
        write('Entre com os dados:'),nl,
		write('Codigo do fornecedor:'),nl,
		read(A),
		write('Data:'),nl,
		read(B),
		write('Status:'),nl,
		read(C),
		write('Valor:'),nl,
		read(D),
		contador_contapagar(X),
	open('conta_pagar.pl', append, Fluxo),
	write(Fluxo,contapagar(X,A,B,C,D)),
	write(Fluxo,'. '),
	close(Fluxo),
	processa(3).

processaM3(2):-
	write(' CONSULTA CONTAS A PAGAR'),nl,
	write(' CODIGO DA CONTA: '),nl,
	read(X),
	contapagar(X,_,_,_,_),
	setof(X,contapagar(X,A,B,C,D),E),
	write(' Codigo: '),
	write(E),nl,
	setof(A,contapagar(X,A,B,C,D),F),
	write(' Fornecedor '),
	write(F),nl,
	setof(B,contapagar(X,A,B,C,D),G),
	write(' Data '),
	write(G),nl,
	setof(C,contapagar(X,A,B,C,D),H),
	write(' Status: '),
	write(H),nl,
	setof(D,contapagar(X,A,B,C,D),I),
	write(' Valor: '),
	write(I),nl,
	processa(3).


processaM3(3):-
	    write('CADASTRO DE CONTAS A RECEBER'),nl,
        write('Entre com os dados:'),nl,
		write('Codigo da locacao:'),nl,
		read(A),
		write('Vencimento:'),nl,
		read(B),
		write('Valor'),nl,
		read(C),
		write('Desconto'),nl,
		read(D),
		write('Status pagamento:'),nl,
		read(E),
		write('Status'),nl,
		read(F),
		write('Acrescimo'),nl,
		read(G),
	       contador_receber(X),
	open('contasreceber.pl', append, Fluxo),
	write(Fluxo,contasreceber(X,A,B,C,D,E,F,G)),
	write(Fluxo,'. '),
	close(Fluxo),
	processa(3).

processaM3(4):-
	write(' CONSULTA CONTAS A RECEBER '),nl,
	write(' Codigo da conta: '),nl,
	read(X),
	contasreceber(X,_,_,_,_,_,_,_),
	setof(X,contasreceber(X,A,B,C,D,E,F,G),H),
	write(' Codigo: '),
	write(H),nl,
	setof(A,contasreceber(X,A,B,C,D,E,F,G),I),
	write(' Codigo da Locacao: '),
	write(I),nl,
	setof(B,contasreceber(X,A,B,C,D,E,F,G),J),
	write(' Vencimento: '),
	write(J),nl,
	setof(C,contasreceber(X,A,B,C,D,E,F,G),K),
	write(' Valor: '),
	write(K),nl,
	setof(D,contasreceber(X,A,B,C,D,E,F,G),L),
	write(' Desconto: '),
	write(L),nl,
	setof(E,contasreceber(X,A,B,C,D,E,F,G),M),
	write(' Status Pagamento: '),
	write(M),nl,
	setof(F,contasreceber(X,A,B,C,D,E,F,G),N),
	write(' Status: '),
	write(N),nl,
	setof(G,contasreceber(X,A,B,C,D,E,F,G),O),
	write(' Acrescimo: '),
	write(O),nl,
	processa(3).

processaM3(5):-
	menu.


processaM4(1):-
	        write('CADASTRO DE RESERVA'),nl,
		write('Entre com os dados:'),nl,
		write('Cod. Cliente:'),nl,
		read(A),
		write('Cod. Filme:'),nl,
		read(B),
		write('Res_XXX:'),nl,
		read(C),
		write('Status:'),nl,
		read(D),
		write('Data:'),nl,
		read(E),nl,
		write('Dependente:'),nl,
		read(F),nl,
		write('Cod. Funcionario:'),nl,
		read(G),nl,
		contador_reserva(X),
	open('reserva.pl', append, Fluxo),
	write(Fluxo,reserva(X,A,B,C,D,E,F,G)),
	write(Fluxo,'. '),
	close(Fluxo),
	processa(4).

processaM4(2):-
	write(' CONSULTA RESERVA '),nl,
	write(' Codigo da reserva: '),nl,
	read(X),
	reserva(X,_,_,_,_,_,_,_),
	setof(X,reserva(X,A,B,C,D,E,F,G),H),
	write(' Codigo: '),
	write(H),nl,
	setof(A,reserva(X,A,B,C,D,E,F,G),I),
	write(' Codigo Cliente: '),
	write(I),nl,
	setof(B,reserva(X,A,B,C,D,E,F,G),J),
	write(' Codigo Filme: '),
	write(J),nl,
	setof(C,reserva(X,A,B,C,D,E,F,G),K),
	write(' Res_XXX: '),
	write(K),nl,
	setof(D,reserva(X,A,B,C,D,E,F,G),L),
	write(' Status: '),
	write(L),nl,
	setof(E,reserva(X,A,B,C,D,E,F,G),M),
	write(' Data: '),
	write(M),nl,
	setof(F,reserva(X,A,B,C,D,E,F,G),N),
	write(' Dependente: '),
	write(N),nl,
	setof(G,reserva(X,A,B,C,D,E,F,G),O),
	write(' Cod Funcionario: '),
	write(O),nl,
	processa(4).

processaM4(3):-
	    write('CADASTRAR LOCACAO'),nl,
        write('Entre com os dados:'),nl,
		write('Cod. Funcionario:'),nl,
		read(A),
		write('Cod. Cliente:'),nl,
		read(B),
		write('Dependente:'),nl,
		read(C),
		write('Data aluguel:'),nl,
		read(D),
		write('Status:'),nl,
		read(E),nl,
		contador_locacao(X),
	open('locacao.pl', append, Fluxo),
	write(Fluxo,locacao(X,A,B,C,D,E)),
	write(Fluxo,'. '),
	close(Fluxo),
	processa(4).


processaM4(4):-
	write('CONSULTA LOCACAO '),nl,
	write(' Codigo da locacao: '),nl,
	read(X),
	locacao(X,_,_,_,_,_),
	setof(X,locacao(X,A,B,C,D,E),F),
	write(' Codigo: '),
	write(F),nl,
	setof(A,locacao(X,A,B,C,D,E),G),
	write(' Codigo Funcionario: '),
	write(G),nl,
	setof(B,locacao(X,A,B,C,D,E),H),
	write(' Codigo Cliente '),
	write(H),nl,
	setof(C,locacao(X,A,B,C,D,E),I),
	write(' Dependente: '),
	write(I),nl,
	setof(D,locacao(X,A,B,C,D,E),J),
	write(' Data Aluguel : '),
	write(J),nl,
 	setof(E,locacao(X,A,B,C,D,E),K),
	write(' Status: '),
	write(K),nl,
      	processa(4).

processaM4(5):-
	menu.


processaM5(1):-
	    write('CADASTRO ITEM DE LOCACAO'),nl,
        write('Entre com os dados:'),nl,
		write('Codigo do exemplar:'),nl,
		read(B),
		write('Data devolucao:'),nl,
		read(C),
		write('Status devolucao:'),nl,
		read(D),
		write('Status do item:'),nl,
		read(E),nl,
		write('Preco:'),nl,
		read(F),nl,
		contador_itemlocacao(X),
	open('itemlocacao.pl', append, Fluxo),
	write(Fluxo,itemlocacao(X,B,C,D,E,F)),
	write(Fluxo,'. '),
	close(Fluxo),
	processa(5).

processaM5(2):-
	write('CONSULTA ITEM LOCACAO '),nl,
	write(' Entre com o codigo: '),nl,
	read(X),
	itemlocacao(X,_,_,_,_,_),
	setof(X,itemlocacao(X,B,C,D,E,F),G),
	write(' Codigo: '),
	write(G),nl,
	setof(B,itemlocacao(X,B,C,D,E,F),H),
	write(' Cod Exemplar: '),
	write(H),nl,
	setof(C,itemlocacao(X,B,C,D,E,F),I),
	write(' Data Devolucao: '),
	write(I),nl,
	setof(D,itemlocacao(X,B,C,D,E,F),J),
	write(' Status Devolucao: '),
	write(J),nl,
	setof(E,itemlocacao(X,B,C,D,E,F),K),
	write(' Status Item: '),
	write(K),nl,
	setof(F,itemlocacao(X,B,C,D,E,F),L),
	write(' Preco: '),
	write(L),nl,
	processa(5).

processaM5(3):-
		write('CADASTRAR EXEMPLAR'),nl,
		write('Entre com os dados:'),nl,
		write('Codigo do filme:'),nl,
		read(A),
		write('Codigo do midia:'),nl,
		read(B),
		write('Exe_XXX:'),nl,
		read(C),
		write('Status do exemplar:'),nl,
		read(D),
		write('Codigo do fornecedor:'),nl,
		read(E),nl,
		write('Codigo do funcionario:'),nl,
		read(F),nl,
		write('Status do cadastro:'),nl,
		read(G),nl,
		write('Data:'),nl,
		read(H),nl,
		contador_exemplar(X),
	open('exemplar.pl', append, Fluxo),
	write(Fluxo,exemplar(X,A,B,C,D,E,F,G,H)),
	write(Fluxo,'. '),
	close(Fluxo),
	processa(5).

processaM5(4):-
	write(' CONSULTA EXEMPLAR '),nl,
	write(' Codigo do exemplar: '),nl,
	read(X),
	exemplar(X,_,_,_,_,_,_,_,_),
	setof(X,exemplar(X,A,B,C,D,E,F,G,H),I),
	write(' Codigo: '),
	write(I),
	setof(A,exemplar(X,A,B,C,D,E,F,G,H),J),
	write(' Codigo Filme: '),
	write(J),
	setof(B,exemplar(X,A,B,C,D,E,F,G,H),K),
	write(' Codigo Midia: '),
	write(K),
	setof(C,exemplar(X,A,B,C,D,E,F,G,H),L),
	write(' Exe_XXX: '),
	write(L),
	setof(D,exemplar(X,A,B,C,D,E,F,G,H),M),
	write(' Status Exemplar: '),
	write(M),
	setof(E,exemplar(X,A,B,C,D,E,F,G,H),N),
	write(' Cod Fornecedor '),
	write(N),
	setof(F,exemplar(X,A,B,C,D,E,F,G,H),O),
	write(' Cod Funcionario: '),
	write(O),
	setof(G,exemplar(X,A,B,C,D,E,F,G,H),P),
	write(' Status cadastro: '),
	write(P),
	setof(H,exemplar(X,A,B,C,D,E,F,G,H),Q),
	write(' Data: '),
	write(Q),
	processa(5).


processaM5(5):-
	    write('CADASTRO DE MIDIA'),nl,
        write('Entre com os dados:'),nl,
		write('Descricao:'),nl,
		read(A),
		write('Status:'),nl,
		read(B),
		write('Data:'),nl,
		read(C),
		contador_midia(X),
	open('midia.pl', append, Fluxo),
	write(Fluxo,midia(X,A,B,C)),
	write(Fluxo,'. '),
	close(Fluxo),
	processa(5).

processaM5(6):-
	write(' CONSULTA MIDIA '),nl,
	write(' Entre com o codigo da midia: '),nl,
	read(X),
	midia(X,_,_,_),
	setof(X,midia(X,A,B,C),D),
	write(' Codigo: '),nl,
	write(D),
	setof(A,midia(X,A,B,C),E),
	write(' Descricao: '),nl,
	write(E),
	setof(B,midia(X,A,B,C),F),
	write(' Status: '),nl,
	write(F),
	setof(C,midia(X,A,B,C),G),
	write(' Data: '),nl,
	write(G),
	processa(5).

processaM5(7):-
	menu.


processaM6(1):-
	        write('CADASTRO DE FILME'),nl,
		write('Entre com os dados:'),nl,
		write('Codigo da categoria'),nl,
		read(A),
		write('Codigo do genero:'),nl,
		read(B),
		write('Nome:'),nl,
		read(C),
		write('Nacionalidade:'),nl,
		read(D),
		write('Duracao:'),nl,
		read(E),nl,
		write('Elenco:'),nl,
		read(F),nl,
		write('Autor:'),nl,
		read(G),nl,
		write('Status:'),nl,
		read(H),nl,
		write('Data cadastro:'),nl,
		read(I),nl,
		contador_filme(X),
	open('filme.pl', append, Fluxo),
	write(Fluxo,filme(X,A,B,C,D,E,F,G,H,I)),
	write(Fluxo,'. '),
	close(Fluxo),
	processa(6).

processaM6(2):-
	write('CONSULTA FILMES '),nl,
	write('Codigo do filme: '),nl,
	read(X),
	filme(X,_,_,_,_,_,_,_,_,_),nl,
	setof(X,filme(X,A,B,C,D,E,F,G,H,I),J),
	write(' Codigo: '),
	write(J),nl,
	setof(A,filme(X,A,B,C,D,E,F,G,H,I),K),
	write(' Cod categoria: '),
	write(K),nl,
	setof(B,filme(X,A,B,C,D,E,F,G,H,I),L),
	write(' Cod genero: '),
	write(L),nl,
	setof(C,filme(X,A,B,C,D,E,F,G,H,I),M),
	write(' Nome: '),
	write(M),nl,
	setof(D,filme(X,A,B,C,D,E,F,G,H,I),N),
	write(' Nacionalidade: '),
	write(N),nl,
	setof(E,filme(X,A,B,C,D,E,F,G,H,I),O),
	write(' Duracao: '),
	write(O),nl,
	setof(F,filme(X,A,B,C,D,E,F,G,H,I),P),
	write(' Elenco: '),
	write(P),nl,
	setof(G,filme(X,A,B,C,D,E,F,G,H,I),Q),
	write(' Autor: '),
	write(Q),nl,
	setof(H,filme(X,A,B,C,D,E,F,G,H,I),R),
	write(' Status: '),
	write(R),nl,
	setof(I,filme(X,A,B,C,D,E,F,G,H,I),S),
	write(' Data Cadastro: '),
	write(S),nl,
	processa(6).

processaM6(3):-
        write('CADATRO DE GENERO'),nl,
        write('Entre com os dados:'),nl,
		write('Descricao:'),nl,
		read(A),
		write('Status:'),nl,
		read(B),
		write('Data:'),nl,
		read(C),
		contador_genero(X),
	open('genero.pl', append, Fluxo),
	write(Fluxo,genero(X,A,B,C)),
	write(Fluxo,'. '),
	close(Fluxo),
	processa(6).

processaM6(4):-
       	consult('genero.pl'),
       	write('Consulta de Generos'),nl,
	write('Entre com o codigo do genero'),
	read(X),
	genero(X,_,_,_),
	setof(X,genero(X,A,B,C),E),
	write('Codigo: '),
	write(E),nl,
	setof(A,genero(X,A,B,C),F),
	write('Descricao: '),
	write(F),nl,
	setof(B,genero(X,A,B,C),G),
	write('Status: '),
	write(G),nl,
	setof(C,genero(X,A,B,C),H),
	write('Data: '),
	write(H),
	nl,
	processa(6).

processaM6(5):-
       	consult('genero.pl'),
	write('Codigo '),nl,
	read(X),
	genero(X,_,_,_),
	retractall(genero(X,_,_,_)),
	tell('genero.pl'),
	listing(genero),
	told,
	processa(6).

processaM6(6):-
	write(' Alteracao de Genero '),nl,
	write(' 1 - Alterar Descricao '),nl,
	write(' 2 - Alterar Status '),nl,
	write(' 3 - Alterar Data '),nl,
	write(' 4 - Voltar ao menu anterior '),nl,
	read(AlteraGenero),
	processaGenero(AlteraGenero).

processaM6(7):-
	        write('CADATRO DE CATEGORIA'),nl,
        write('Entre com os dados:'),nl,
		write('Descricao:'),nl,
		read(A),
		write('Status:'),nl,
		read(B),
		write('Data:'),nl,
		read(C),
		contador_categoria(X),
	open('categoria.pl', append, Fluxo),
	write(Fluxo,categoria(X,A,B,C)),
	write(Fluxo,'. '),
	close(Fluxo),
	processa(6).

processaM6(8):-
	write(' CONSULTA CATEGORIA '),
	write(' Codigo da categoria: '),nl,
	read(X),
	categoria(X,_,_,_),
	setof(X,categoria(X,A,B,C),D),
	write(' Codigo: '),
	write(D),nl,
	setof(A,categoria(X,A,B,C),E),
	write(' Descricao: '),
	write(E),nl,
	setof(B,categoria(X,A,B,C),F),
	write(' Status: '),
	write(F),nl,
	setof(C,categoria(X,A,B,C),G),
	write(' Data: '),
	write(G),nl,
	processa(6).

processaM6(9):-
	menu.

processaM7(1):-
	        write('CADASTRO DE PRECO'),nl,
        write('Entre com os dados:'),nl,
		write('Codigo da midia:'),nl,
		read(A),
		write('Codigo da categoria:'),nl,
		read(B),
		write('Pre_codigo:'),nl,
		read(C),
		write('Dias'),nl,
		read(D),
		write('Status:'),nl,
		read(E),
		write('Data:'),nl,
		read(F),
		contador_preco(X),
	open('preco.pl', append, Fluxo),
	write(Fluxo,preco(X,A,B,C,D,E,F)),
	write(Fluxo,'. '),
	close(Fluxo),
	processa(7).

processaM7(2):-
	write('CONSULTA PRECO'),
	write(' Entre com o codigo'),nl,
	read(X),
	preco(X,_,_,_,_,_,_),
	setof(X,preco(X,A,B,C,D,E,F),G),
	write(' Codigo: '),
	write(G),nl,
	setof(A,preco(X,A,B,C,D,E,F),H),
	write(' Codigo da midia: '),
	write(H),nl,
	setof(B,preco(X,A,B,C,D,E,F),I),
	write(' Codigo da categoria: '),
	write(I),nl,
	setof(C,preco(X,A,B,C,D,E,F),J),
	write(' Pre_codigo: '),
	write(J),nl,
	setof(D,preco(X,A,B,C,D,E,F),K),
	write(' Dias: '),
	write(K),nl,
       	setof(E,preco(X,A,B,C,D,E,F),L),
	write(' Status: '),
	write(L),nl,
       	setof(F,preco(X,A,B,C,D,E,F),M),
	write(' Data: '),
	write(M),nl,
	processa(7).

processaM7(3):-
	write('CADASTRAR PAGAMENTO'),nl,
        write('Entre com os dados:'),nl,
		write('Codigo locacao:'),nl,
		read(A),
		write('Valor pago:'),nl,
		read(B),
		write('Desconto:'),nl,
		read(C),
		write('Statspag:'),nl,
		read(D),
		write('Data:'),nl,
		read(E),
		write('Status:'),nl,
		read(F),
		contador_pagamento(X),
	open('pagamento.pl', append, Fluxo),
	write(Fluxo,pagamento(X,A,B,C,D,E,F)),
	write(Fluxo,'. '),
	close(Fluxo),
	processa(7).

processaM7(4):-
	write('CONSULTAR PAGAMENTO'),nl,
	write(' Entre com o codigo: '),nl,
	read(X),
	pagamento(X,_,_,_,_,_,_),
	setof(X,pagamento(X,A,B,C,D,E,F),G),
	write(' Codigo: '),
	write(G),nl,
	setof(A,pagamento(X,A,B,C,D,E,F),H),
	write(' Codigo locacao: '),
	write(H),nl,
	setof(B,pagamento(X,A,B,C,D,E,F),I),
	write(' Valor Pago: '),
	write(I),nl,
	setof(C,pagamento(X,A,B,C,D,E,F),J),
	write(' Desconto: '),
	write(J),nl,
	setof(D,pagamento(X,A,B,C,D,E,F),K),
	write(' Statuspag: '),
	write(K),nl,
	setof(E,pagamento(X,A,B,C,D,E,F),L),
	write(' Data: '),
	write(L),nl,
	setof(F,pagamento(X,A,B,C,D,E,F),M),
	write(' Status: '),
	write(M),nl,
	processa(7).

processaM7(5):-
	        write('CADASTRO DE MOVIMENTO'),nl,
        write('Entre com os dados:'),nl,
		write('Data:'),nl,
		read(A),
		write('Status:'),nl,
		read(B),
		write('Valor:'),nl,
		read(C),
		write('Cod. Funcionario:'),nl,
		read(D),
		write('Con_codigo'),nl,
		read(E),
	       contador_movimento(X),

	open('movimento.pl', append, Fluxo),
	write(Fluxo,movimento(X,A,B,C,D,E)),
	write(Fluxo,'. '),
	close(Fluxo),
	processa(7).

processaM7(6):-
	write('CONSULTA MOVIMENTO'),nl,
	write('Entre com o codigo: '),nl,
	read(X),
	movimento(X,_,_,_,_,_),
	setof(X,movimento(X,A,B,C,D,E),F),
	write(' Codigo: '),
	write(F),nl,
	setof(A,movimento(X,A,B,C,D,E),G),
	write(' Data: '),
	write(G),nl,
       	setof(B,movimento(X,A,B,C,D,E),H),
	write(' Status: '),
	write(H),nl,
       	setof(C,movimento(X,A,B,C,D,E),I),
	write(' Valor: '),
	write(I),nl,
       	setof(D,movimento(X,A,B,C,D,E),J),
	write(' Cod Funcionario: '),
	write(J),nl,
       	setof(E,movimento(X,A,B,C,D,E),K),
	write(' Con_codigo: '),
	write(K),nl,
	processa(7).

processaM7(7):-
	menu.


processaM8(1):-
  	      write('Cadastrar Sangria'),nl,
          	  write('Entre com os dados:'),nl,
		write('Descricao:'),nl,
		read(A),
		write('Valor:'),nl,
		read(B),
		write('statusXXX:'),nl,
		read(C),
		write('Codigo do funcionario:'),nl,
		read(D),
		write('Status:'),nl,
		read(E),
		write('Data da sangria:'),nl,
		read(F),
	       contador_sangria(X),
	open('sangria.pl', append, Fluxo),
	write(Fluxo,sangria(X,A,B,C,D,E,F)),
	write(Fluxo,'. '),
	close(Fluxo),
	processa(8).

processaM8(2):-
	write(' CONSULTA SANGRIA '),nl,
	write(' Entre com o codigo: '),nl,
	read(X),
	sangria(X,_,_,_,_,_,_),
	setof(X,sangria(X,A,B,C,D,E,F),G),
	write(' Codigo: '),
	write(G),nl,
	setof(X,sangria(X,A,B,C,D,E,F),G),
	write(' Codigo: '),
	write(G),nl,
	setof(A,sangria(X,A,B,C,D,E,F),H),
	write(' Descricao: '),
	write(H),nl,
	setof(B,sangria(X,A,B,C,D,E,F),I),
	write(' Valor: '),
	write(I),nl,
	setof(C,sangria(X,A,B,C,D,E,F),J),
	write(' satusXXX: '),
	write(J),nl,
	setof(D,sangria(X,A,B,C,D,E,F),K),
	write(' Cod. Funcionario: '),
	write(K),nl,
	setof(E,sangria(X,A,B,C,D,E,F),L),
	write(' Status:'),
	write(L),nl,
	setof(F,sangria(X,A,B,C,D,E,F),M),
	write(' Data Sangria:'),
	write(M),nl,
	processa(8).

processaM8(3):-
	        write('CADASTRO DE DESPESA'),nl,
        write('Entre com os dados:'),nl,
		write('Descricao:'),nl,
		read(A),
		write('Data:'),nl,
		read(B),
		write('Valor:'),nl,
		read(C),
		write('Status:'),nl,
		read(D),
		write('Codigo do funcionario:'),nl,
		read(E),
	       contador_despesa(X),
	open('despesa.pl', append, Fluxo),
	write(Fluxo,despesa(X,A,B,C,D,E)),
	write(Fluxo,'. '),
	close(Fluxo),
	processa(8).

processaM8(4):-
	write(' CONSULTA DESPESA '),nl,
	write(' Entre com o codigo: '),nl,
	read(X),
	despesa(X,_,_,_,_,_),
	setof(X,despesa(X,A,B,C,D,E),F),
	write(' Codigo: '),
	write(F),nl,
	setof(A,despesa(X,A,B,C,D,E),G),
	write(' Descricao: '),
	write(G),nl,
	setof(B,despesa(X,A,B,C,D,E),H),
	write(' Data: '),
	write(H),nl,
	setof(C,despesa(X,A,B,C,D,E),I),
	write(' Valor: '),
	write(I),nl,
	setof(D,despesa(X,A,B,C,D,E),J),
	write(' Status: '),
	write(J),nl,
	setof(E,despesa(X,A,B,C,D,E),K),
	write(' Cod. Func.: '),
	write(K),nl,
	processa(8).

processaM8(5):-
	        write('CADASTRO DE CAIXAS'),nl,
		write('Entre com os dados:'),nl,
		write('Data:'),nl,
		read(A),
		write('Valor Recebido:'),nl,
		read(B),
		write('Valor Gasto:'),nl,
		read(C),
		write('Codigo do funcionario:'),nl,
		read(D),
		write('Status:'),nl,
		read(E),nl,
		contador_caixa(X),
	open('caixa.pl', append, Fluxo),
	write(Fluxo,caixa(X,A,B,C,D,E)),
	write(Fluxo,'. '),
	close(Fluxo),
	processa(8).

processaM8(6):-
	write('CONSULTA CAIXA '),nl,
	write(' Entre com o codigo: '),nl,
	read(X),
	caixa(X,_,_,_,_,_),
	setof(X,caixa(X,A,B,C,D,E),F),
	write(' Codigo: '),
	write(F),nl,
	setof(A,caixa(X,A,B,C,D,E),G),
	write(' Data: '),
	write(G),nl,
	setof(B,caixa(X,A,B,C,D,E),H),
	write(' Valor Recebido: '),
	write(H),nl,
	setof(C,caixa(X,A,B,C,D,E),I),
	write(' Valor Gasto: '),
	write(I),nl,
	setof(D,caixa(X,A,B,C,D,E),J),
	write(' Cod. Funcionario: '),
	write(J),nl,
	setof(E,caixa(X,A,B,C,D,E),K),
	write(' Status: '),
	write(K),nl,
	processa(8).

processaM8(7):-
	menu.


processaCliente(1):-
	consult('cliente.pl'),
	write(' ALTERACAO DE NOME '),nl,
	write(' Codigo do Cliente '),nl,
	read(X),
	write('Novo Nome: '),nl,
	read(B),
	cliente(X,_,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),
	retractall(cliente(X,_,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S)),
	assert(cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told,
	processaM1(3).



processaCliente(2):-
	consult('cliente.pl'),
	write(' ALTERACAO DE ENDERECO '),nl,
	write(' Codigo do Cliente '),nl,
	read(X),
	write('Novo Endereco: '),nl,
	read(C),
	cliente(X,B,_,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),
	retractall(cliente(X,B,_,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S)),
	assert(cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told,
	processaM1(3).

processaCliente(3):-
	consult('cliente.pl'),
	write(' ALTERACAO DE COMPLEMENTO '),nl,
	write(' Codigo do Cliente '),nl,
	read(X),
	write('Novo Complemento: '),nl,
	read(D),
	cliente(X,B,C,_,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),
	retractall(cliente(X,B,C,_,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S)),
	assert(cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told,
	processaM1(3).


processaCliente(4):-
	consult('cliente.pl'),
	write(' ALTERACAO DE CIDADE '),nl,
	write(' Codigo do Cliente '),nl,
	read(X),
	write('Nova Cidade: '),nl,
	read(E),
	cliente(X,B,C,D,_,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),
	retractall(cliente(X,B,C,D,_,F,G,H,I,J,K,L,M,N,O,P,Q,R,S)),
	assert(cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told,
	processaM1(3).

processaCliente(5):-
	consult('cliente.pl'),
	write(' ALTERACAO DE TELEFONE '),nl,
	write(' Codigo do Cliente '),nl,
	read(X),
	write('Novo Telefone: '),nl,
	read(F),
	cliente(X,B,C,D,E,_,G,H,I,J,K,L,M,N,O,P,Q,R,S),
	retractall(cliente(X,B,C,D,E,_,G,H,I,J,K,L,M,N,O,P,Q,R,S)),
	assert(cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told,
	processaM1(3).

processaCliente(6):-
	consult('cliente.pl'),
	write(' ALTERACAO DE CELULAR '),nl,
	write(' Codigo do Cliente '),nl,
	read(X),
	write('Novo Celular: '),nl,
	read(G),
	cliente(X,B,C,D,E,F,_,H,I,J,K,L,M,N,O,P,Q,R,S),
	retractall(cliente(X,B,C,D,E,F,_,H,I,J,K,L,M,N,O,P,Q,R,S)),
	assert(cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told,
	processaM1(3).

processaCliente(7):-
	consult('cliente.pl'),
	write(' ALTERACAO DE ESTADO CIVIL '),nl,
	write(' Codigo do Cliente '),nl,
	read(X),
	write('Novo Estado Civil: '),nl,
	read(H),
	cliente(X,B,C,D,E,F,G,_,I,J,K,L,M,N,O,P,Q,R,S),
	retractall(cliente(X,B,C,D,E,F,G,_,I,J,K,L,M,N,O,P,Q,R,S)),
	assert(cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told,
	processaM1(3).

processaCliente(8):-
       	consult('cliente.pl'),
	write(' ALTERACAO DE RG '),nl,
	write(' Codigo do Cliente '),nl,
	read(X),
	write('Novo RG: '),nl,
	read(I),
	cliente(X,B,C,D,E,F,G,H,_,J,K,L,M,N,O,P,Q,R,S),
	retractall(cliente(X,B,C,D,E,F,G,H,_,J,K,L,M,N,O,P,Q,R,S)),
	assert(cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told,
	processaM1(3).


processaCliente(9):-
       	consult('cliente.pl'),
	write(' ALTERACAO DE RG '),nl,
	write(' Codigo do Cliente '),nl,
	read(X),
	write('Novo CPF: '),nl,
	read(J),
	cliente(X,B,C,D,E,F,G,H,I,_,K,L,M,N,O,P,Q,R,S),
	retractall(cliente(X,B,C,D,E,F,G,H,I,_,K,L,M,N,O,P,Q,R,S)),
	assert(cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told,
	processaM1(3).

processaCliente(10):-
       	consult('cliente.pl'),
	write(' ALTERACAO DE DATA DE NASCIMENTO '),nl,
	write(' Codigo do Cliente '),nl,
	read(X),
	write('Nova Data Nascimento: '),nl,
	read(K),
	cliente(X,B,C,D,E,F,G,H,I,J,_,L,M,N,O,P,Q,R,S),
	retractall(cliente(X,B,C,D,E,F,G,H,I,J,_,L,M,N,O,P,Q,R,S)),
	assert(cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told,
	processaM1(3).

processaCliente(11):-
       	consult('cliente.pl'),
	write(' ALTERACAO MAE '),nl,
	write(' Codigo do Cliente '),nl,
	read(X),
	write('Nova Mae: '),nl,
	read(L),
	cliente(X,B,C,D,E,F,G,H,I,J,K,_,M,N,O,P,Q,R,S),
	retractall(cliente(X,B,C,D,E,F,G,H,I,J,K,_,M,N,O,P,Q,R,S)),
	assert(cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told,
	processaM1(3).

processaCliente(12):-
       	consult('cliente.pl'),
	write(' ALTERACAO PAI '),nl,
	write(' Codigo do Cliente '),nl,
	read(X),
	write('Novo Pai: '),nl,
	read(M),
	cliente(X,B,C,D,E,F,G,H,I,J,K,L,_,N,O,P,Q,R,S),
	retractall(cliente(X,B,C,D,E,F,G,H,I,J,K,L,_,N,O,P,Q,R,S)),
	assert(cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told,
	processaM1(3).

processaCliente(13):-
       	consult('cliente.pl'),
	write(' ALTERACAO SEXO '),nl,
	write(' Codigo do Cliente '),nl,
	read(X),
	write('Sexo : '),nl,
	read(N),
	cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,_,O,P,Q,R,S),
	retractall(cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,_,O,P,Q,R,S)),
	assert(cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told,
	processaM1(3).


processaCliente(14):-
       	consult('cliente.pl'),
	write(' ALTERACAO EMAIL '),nl,
	write(' Codigo do Cliente '),nl,
	read(X),
	write('Novo E-mail : '),nl,
	read(O),
	cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,_,P,Q,R,S),
	retractall(cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,_,P,Q,R,S)),
	assert(cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told,
	processaM1(3).

processaCliente(15):-
       	consult('cliente.pl'),
	write(' ALTERACAO REF COMERCIAL '),nl,
	write(' Codigo do Cliente '),nl,
	read(X),
	write('Nova Ref Comercial : '),nl,
	read(P),
	cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,_,Q,R,S),
	retractall(cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,_,Q,R,S)),
	assert(cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told,
	processaM1(3).

processaCliente(16):-
        consult('cliente.pl'),
	write(' ALTERACAO DATA CADASTRO '),nl,
	write(' Codigo do Cliente '),nl,
	read(X),
	write('Nova data Cadastro: '),nl,
	read(Q),
	cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,_,R,S),
	retractall(cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,_,R,S)),
	assert(cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told,
	processaM1(3).

processaCliente(17):-
        consult('cliente.pl'),
	write(' ALTERACAO STATUS '),nl,
	write(' Codigo do Cliente '),nl,
	read(X),
	write('Novo STATUS : '),nl,
	read(R),
	cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,_,S),
	retractall(cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,_,S)),
	assert(cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told,
	processaM1(3).

processaCliente(18):-
       	consult('cliente.pl'),
	write(' ALTERACAO COD FUNCIONARIO '),nl,
	write(' Codigo do Cliente '),nl,
	read(X),
	write('Novo Cod Funcionario :' ),nl,
	read(S),
	cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,_),
	retractall(cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,_)),
	assert(cliente(X,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told,
	processaM1(3).

processaCliente(19):-
	processa(1).



processaDependente(1):-
	consult('dependente.pl'),
	write('ALTERAR COD DO CLIENTE'),nl,
	write(' Codigo do dependente: '),nl,
	read(X),
	write(' Novo cod do cliente '),nl,
	read(B),
	dependente(X,_,C,D,E),
	retractall(dependente(X,_,C,D,E)),
	assert(dependente(X,B,C,D,E)),
	tell('dependente.pl'),
	listing(dependente),
	told,
	processaM1(7).


processaDependente(2):-
	consult('dependente.pl'),
	write('ALTERAR NOME'),nl,
	write(' Codigo do dependente: '),nl,
	read(X),
	write(' Novo Nome: '),nl,
	read(C),
	dependente(X,B,_,D,E),
	retractall(dependente(X,B,_,D,E)),
	assert(dependente(X,B,C,D,E)),
	tell('dependente.pl'),
	listing(dependente),
	told,
	processaM1(7).

processaDependente(3):-
      	consult('dependente.pl'),
	write('ALTERAR DESCRICAO'),nl,
	write(' Codigo do dependente: '),nl,
	read(X),
	write(' Nova Descricao: '),nl,
	read(D),
	dependente(X,B,C,_,E),
	retractall(dependente(X,B,C,_,E)),
	assert(dependente(X,B,C,D,E)),
	tell('dependente.pl'),
	listing(dependente),
	told,
	processaM1(7).

processaDependente(4):-
       	consult('dependente.pl'),
	write('ALTERAR STATUS'),nl,
	write(' Codigo do dependente: '),nl,
	read(X),
	write(' Novo STATUS	: '),nl,
	read(E),
	dependente(X,B,C,D,_),
	retractall(dependente(X,B,C,D,_)),
	assert(dependente(X,B,C,D,E)),
	tell('dependente.pl'),
	listing(dependente),
	told,
	processaM1(7).

processaDependente(5):-
	processa(1).

processaGenero(1):-
       	consult('genero.pl'),
	write(' ALTERAR DESCRICAO '),nl,
	write(' Codigo do genero: '),nl,
	read(X),
	write(' Nova descricao: '),nl,
	read(A),
	genero(X,_,B,C),
	retractall(genero(X,_,B,C)),
	assert(genero(X,A,B,C)),
	tell('genero.pl'),
	listing(genero),
	told,
	processaM6(6).

processaGenero(2):-
       	consult('genero.pl'),
	write(' ALTERAR STATUS '),nl,
	write(' Codigo do genero: '),nl,
	read(X),
	write(' Novo Status: '),nl,
	read(B),
	genero(X,A,_,C),
	retractall(genero(X,A,_,C)),
	assert(genero(X,A,B,C)),
	tell('genero.pl'),
	listing(genero),
	told,
	processaM6(6).

processaGenero(3):-
       	consult('genero.pl'),
	write(' ALTERAR Data '),nl,
	write(' Codigo do genero: '),nl,
	read(X),
	write(' Nova Data: '),nl,
	read(C),
	genero(X,A,B,_),
	retractall(genero(X,A,B,_)),
	assert(genero(X,A,B,C)),
	tell('genero.pl'),
	listing(genero),
	told,
	processaM6(6).

processaGenero(4):-
	processa(6).




contador_categoria(X):-
	retract(cont_categoria(X)),
	!,
	X1 is X+1,
	assert(cont_categoria(X1)).
contador_categoria(0):-
	assert(cont_categoria(1)).

contador_locacao(X):-
	retract(cont_locacao(X)),
	!,
	X1 is X+1,
	assert(cont_locacao(X1)).
contador_locacao(0):-
	assert(cont_locacao(1)).

contador_movimento(X):-
	retract(cont_movimento(X)),
	!,
	X1 is X+1,
	assert(cont_movimento(X1)).
contador_movimento(0):-
	assert(cont_movimento(1)).

contador_reserva(X):-
	retract(cont_reserva(X)),
	!,
	X1 is X+1,
	assert(cont_reserva(X1)).
contador_reserva(0):-
	assert(cont_reserva(1)).


contador_exemplar(X):-
	retract(cont_exemplar(X)),
	!,
	X1 is X+1,
	assert(cont_exemplar(X1)).
contador_exemplar(0):-
	assert(cont_exemplar(1)).

contador_filme(X):-
	retract(cont_filme(X)),
	!,
	X1 is X+1,
	assert(cont_filme(X1)).
contador_filme(0):-
	assert(cont_filme(1)).

contador_midia(X):-
	retract(cont_midia(X)),
	!,
	X1 is X+1,
	assert(cont_midia(X1)).
contador_midia(0):-
	assert(cont_midia(1)).

contador_itemlocacao(X):-
	retract(cont_itemlocacao(X)),
	!,
	X1 is X+1,
	assert(cont_itemlocacao(X1)).
contador_itemlocacao(0):-
	assert(cont_itemlocacao(1)).



contador_fornecedor(X):-
	retract(cont_fornecedor(X)),
	!,
	X1 is X+1,
	assert(cont_fornecedor(X1)).
contador_fornecedor(0):-
	assert(cont_fornecedor(1)).

contador_empresa(X):-
	retract(cont_empresa(X)),
	!,
	X1 is X+1,
	assert(cont_empresa(X1)).
contador_empresa(0):-
	assert(cont_empresa(1)).



contador_pagamento(X):-
	retract(cont_pagamento(X)),
	!,
	X1 is X+1,
	assert(cont_pagamento(X1)).
contador_pagamento(0):-
	assert(cont_pagamento(1)).

contador_caixa(X):-
	retract(cont_caixa(X)),
	!,
	X1 is X+1,
	assert(cont_caixa(X1)).
contador_caixa(0):-
	assert(cont_caixa(1)).

contador_contapagar(X):-
	retract(cont_contapagar(X)),
	!,
	X1 is X+1,
	assert(cont_contapagar(X1)).
contador_contapagar(0):-
	assert(cont_contapagar(1)).
contador_receber(X):-
	retract(cont_receber(X)),
	!,
	X1 is X+1,
	assert(cont_receber(X1)).
contador_receber(0):-
	assert(cont_receber(1)).


contador_despesa(X):-
	retract(cont_despesa(X)),
	!,
	X1 is X+1,
	assert(cont_despesa(X1)).
contador_despesa(0):-
	assert(cont_despesa(1)).

contador_sangria(X):-
	retract(cont_sangria(X)),
	!,
	X1 is X+1,
	assert(cont_sangria(X1)).
contador_sangria(0):-
	assert(cont_sangria(1)).

contador_preco(X):-
	retract(cont_preco(X)),
	!,
	X1 is X+1,
	assert(cont_preco(X1)).
contador_preco(0):-
	assert(cont_preco(1)).

contador_genero(X):-
	retract(cont_genero(X)),
	!,
	X1 is X+1,
	assert(cont_genero(X1)).
contador_genero(0):-
	assert(cont_genero(1)).

contador_funcionario(X):-
	retract(cont_funcionario(X)),
	!,
	X1 is X+1,
	assert(cont_funcionario(X1)).
contador_funcionario(0):-
	assert(cont_funcionario(1)).


contador_cliente(X):-
	retract(cont_cliente(X)),
	!,
	X1 is X+1,
	assert(cont_cliente(X1)).
contador_cliente(0):-
	assert(cont_cliente(1)).
contador_dependente(X):-
	retract(cont_dependente(X)),
	!,
	X1 is X+1,
	assert(cont_dependente(X1)).
contador_dependente(0):-
	assert(cont_dependente(1)).

leia(F,[]):-
	at_end_of_stream(F).
leia(F,[X|L]):-
	\+ at_end_of_stream(F),
	read(F,X),
	leia(F,L).



















