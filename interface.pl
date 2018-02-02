:-dynamic cliente/19.
:-dynamic dependente/5.
:-dynamic filme/10.
:-dynamic exemplar/8.
:-dynamic funcionario/14.
:-dynamic fornecedor/13.
:-dynamic empresa/12.
:-dynamic conta_pagar/5.
:-dynamic categoria/3.
:-dynamic preco/6.
:-dynamic empresa/11.
:-dynamic genero/3.
:-dynamic despesa/5.
:-dynamic fornecedor/14.
:-dynamic midia/3.
:-use_module(library(tabular)).
%
menu:-
new(F, frame('Video Locadora')),
send(F, append, new(D, dialog)),
send(D, append, button(clientes, message(@prolog, menuCliente))),
send(D, append, button(empresas, message(@prolog, menuEmpresa))),
send(D, append, button(contas,message(@prolog, menuContas))),
%send(D, append, button(reservas_e_locacoes,message(@prolog, menuReservas))),
send(D, append, button(itens, message(@prolog, menuItens))),
send(D, append, button(filmes,message(@prolog, menuFilmes))),
send(D, append, button(preco,message(@prolog, menuPreco))),
send(D, append, button(financeiro,message(@prolog, menuFinanceiro))),
send(D, append, button(locar,message(@prolog, menuLocar))),
send(D, append, button(devolver,message(@prolog, menuDevolver))),
send(D, append, button(reservar,message(@prolog, menuReservar))),
send(D,	append, button(carrega,message(@prolog,carrega))),
send(D,	append, button(salvar,message(@prolog,salva))),
send(D, append, button(sair, message(F,destroy))),
send(F, open).
salva:-
	tell('bd.pl'),
	menu:listing(cliente),
	menu:listing(filme),
	menu:listing(exemplar).
carrega:-
	consult('cliente.pl'),
	consult('exemplar.pl'),
	consult('genero.pl'),
	consult('categoria.pl'),
	consult('midia.pl').

menuLocar:-
	new(G, frame('Locar - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID do Cliente')),
	send(D1, append, C1),
	new(C2, text_item('ID do Exemplar')),
	send(D1, append, C2),
	send(E, append, button('Locar', message(@prolog,locar,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

locar(C2):-
%	consult('exemplar.pl'),
%	exemplar(C2,A,B,_,D,E,F,G),
	retract(exemplar(C2,A,B,_,D,E,F,G)),
	assert(exemplar(C2,A,B,indisponivel,D,E,F,G)).
%	tell('exemplar.pl'),
%	listing(exemplar),
%	told.



menuDevolver:-
	new(G, frame('Devolver - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID do Cliente')),
	send(D1, append, C1),
	new(C2, text_item('ID do Exemplar')),
	send(D1, append, C2),
	send(E, append, button('Devolver', message(@prolog, devolver,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

devolver(C2):-
%	consult('exemplar.pl'),
	exemplar(C2,A,B,C,D,E,F,G),
	retractall(exemplar(C2,A,B,C,D,E,F,G)),
	assert(exemplar(C2,A,B,C,'disponivel',E,F,G)),
	tell('exemplar.pl'),
	listing(exemplar),
	told.

menuReservar:-
	new(G, frame('Reservar - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID do Cliente')),
	send(D1, append, C1),
	new(C2, text_item('ID do Exemplar')),
	send(D1, append, C2),
	send(E, append, button('Reservar', message(@prolog, reservar,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

reservar(C2):-
%	consult('exemplar.pl'),
	exemplar(C2,A,B,C,D,E,F,G),
	retractall(exemplar(C2,A,B,C,D,E,F,G)),
	assert(exemplar(C2,A,B,C,'reservado',E,F,G)),
	tell('exemplar.pl'),
	listing(exemplar),
	told.


menuCliente:-
new(G,frame('Menu Cliente - Video Locadora')),
%new(MenuD, dialog),
new(E, dialog),
new(D1, dialog),
new(D2, dialog),
%new(D3, dialog),


send(E, append, button('Novo Cliente', message(@prolog, cadastroClientes))),
send(E, append, button('Pesquisar cliente', message(@prolog, consultarClientes))),
send(E, append, button('Alterar Cliente',message(@prolog, menuAlteraClientes))),
send(E, append, button('Remover Cliente',message(@prolog, removeClientes))),
send(D1, append, button('Novo Dependente', message(@prolog, cadastroDependente))),
send(D1, append, button('Pesquisar Dependente',message(@prolog, consultaDependente))),
send(D1, append, button('Alterar Dependente',message(@prolog, menuAlteraDependentes))),
send(D1, append, button('Remover Dependente',message(@prolog, removeDependente))),
%send(D2, append, button(ok,message(@prolog, salvarCliente))),
send(D2, append, button(fechar, message(G,destroy))),
%send(E, append, text('Teste de funcao de botao')),
%send(E, append, button(ok,message(G,destroy))),
send(D2, right, D1),
send(E, above(D1)),
%send(D1, above(D2)),
%send(D2, above(D3)),
send(G, append, E),
send(G, open_centered).



% Menu para alteracao de clientes
menuAlteraClientes:-
	new(G,frame('Menu Altera Cliente - Video Locadora')),
	%new(MenuD, dialog),
	new(E, dialog),
	new(D1, dialog),
	new(D2, dialog),
	%new(D3, dialog),
	send(E, append, button('Altera Nome', message(@prolog, menualteraNomeCliente))),
	send(E, append, button('Altera Endereco', message(@prolog, menualteraEnderecoCliente))),
	send(E, append, button('Altera Complemento',message(@prolog, menualteraComplementoCliente))),
	send(E, append, button('Altera CEP',message(@prolog, menualteraCEPCliente))),
	send(E, append, button('Altera Telefone', message(@prolog, menualteraTelefoneCliente))),
	send(E, append, button('Altera Celular',message(@prolog, menualteraCelularCliente))),
	send(E, append, button('Altera estado civil',message(@prolog, menualteraEstadoCivilCliente))),
	send(E, append, button('Altera RG',message(@prolog, menualteraRGCliente))),
       	send(E, append, button('Altera CPF',message(@prolog, menualteraCPFCliente))),
	send(D1, append, button('Altera Data Nasc', message(@prolog, menualteraDataNascimentoCliente))),
	send(D1, append, button('Altera Mae', message(@prolog, menualteraMaeCliente))),
	send(D1, append, button('Altera Pai',message(@prolog, menualteraPaiCliente))),
	send(D1, append, button('Altera Sexo',message(@prolog, menualteraSexoCliente))),
	send(D1, append, button('Altera Email', message(@prolog, menualteraEmailCliente))),
	send(D1, append, button('Altera Ref Com',message(@prolog, menualteraRefComercialCliente))),
	send(D1, append, button('Altera Status',message(@prolog, menualteraStatusCliente))),
	send(D1, append, button('Altera Cod. Func.',message(@prolog, menualteraCodFuncionarioCliente))),
	%send(D2, append, button(ok,message(@prolog, salvarCliente))),
	send(D2, append, button(fechar, message(G,destroy))),
	%send(E, append, text('Teste de funcao de botao')),
	%send(E, append, button(ok,message(G,destroy))),
	send(D2, right, D1),
	send(E, above(D1)),
	%send(D1, above(D2)),
	%send(D2, above(D3)),
	send(G, append, E),
	send(G, open_centered).


menualteraNomeCliente:-
	new(G, frame('Alterar Cliente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('CPF do Cliente')),
	send(D1, append, C1),
	new(C2, text_item('Novo nome do Cliente')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraNomeCliente,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).
menualteraEnderecoCliente:-
	new(G, frame('Alterar Cliente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('CPF do Cliente')),
	send(D1, append, C1),
	new(C2, text_item('Novo endereco do Cliente')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraEnderecoCliente,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).



menualteraEnderecoCliente:-
	new(G, frame('Alterar Cliente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('CPF do Cliente')),
	send(D1, append, C1),
	new(C2, text_item('Novo endereco do Cliente')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraEnderecoCliente,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraComplementoCliente:-
	new(G, frame('Alterar Cliente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('CPF do Cliente')),
	send(D1, append, C1),
	new(C2, text_item('Novo complemento do Cliente')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraComplementoCliente,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraCEPCliente:-
	new(G, frame('Alterar Cliente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('CPF do Cliente')),
	send(D1, append, C1),
	new(C2, text_item('Novo CEP do Cliente')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraCEPCliente,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraTelefoneCliente:-
	new(G, frame('Alterar Cliente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('CPF do Cliente')),
	send(D1, append, C1),
	new(C2, text_item('Novo telefone do Cliente')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraTelefoneCliente,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


menualteraCelularCliente:-
	new(G, frame('Alterar Cliente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('CPF do Cliente')),
	send(D1, append, C1),
	new(C2, text_item('Novo celular do Cliente')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraCelularCliente,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraEstadoCivilCliente:-
	new(G, frame('Alterar Cliente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('CPF do Cliente')),
	send(D1, append, C1),
	new(C2, text_item('Novo estado civil do Cliente')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraEstadoCivilCliente,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraRGCliente:-
	new(G, frame('Alterar Cliente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('CPF do Cliente')),
	send(D1, append, C1),
	new(C2, text_item('Novo RG do Cliente')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraRGCliente,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraCPFCliente:-
	new(G, frame('Alterar Cliente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('CPF do Cliente')),
	send(D1, append, C1),
	new(C2, text_item('Novo CPF do Cliente')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraCPFCliente,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraCPFCliente:-
	new(G, frame('Alterar Cliente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('CPF do Cliente')),
	send(D1, append, C1),
	new(C2, text_item('Novo CPF do Cliente')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraCPFCliente,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


menualteraDataNascimentoCliente:-
	new(G, frame('Alterar Cliente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('CPF do Cliente')),
	send(D1, append, C1),
	new(C2, text_item('Nova data de Nascimento do Cliente')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraDataNascimentoCliente,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraMaeCliente:-
	new(G, frame('Alterar Cliente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('CPF do Cliente')),
	send(D1, append, C1),
	new(C2, text_item('Nova mae do Cliente')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraMaeCliente,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraPaiCliente:-
	new(G, frame('Alterar Cliente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('CPF do Cliente')),
	send(D1, append, C1),
	new(C2, text_item('Nova pai do Cliente')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraPaiCliente,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


menualteraSexoCliente:-
	new(G, frame('Alterar Cliente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('CPF do Cliente')),
	send(D1, append, C1),
	new(C2, text_item('Novo Sexo do Cliente')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraSexoCliente,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).
menualteraEmailCliente:-
	new(G, frame('Alterar Cliente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('CPF do Cliente')),
	send(D1, append, C1),
	new(C2, text_item('Novo Email do Cliente')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraEmailCliente,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraRefComercialCliente:-
	new(G, frame('Alterar Cliente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('CPF do Cliente')),
	send(D1, append, C1),
	new(C2, text_item('Nova RefCom do Cliente')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraRefComercialCliente,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


menualteraStatusCliente:-
	new(G, frame('Alterar Cliente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('CPF do Cliente')),
	send(D1, append, C1),
	new(C2, text_item('Novo Status do Cliente')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraStatusCliente,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraCodFuncionarioCliente:-
	new(G, frame('Alterar Cliente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('CPF do Cliente')),
	send(D1, append, C1),
	new(C2, text_item('Novo cod Func do Cliente')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraCodFuncionarioCliente,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

alteraNomeCliente(C1,C2):-
	consult('cliente.pl'),
	cliente(X,_,C,D,E,F,G,H,I,C1,K,L,M,N,O,P,Q,R,S),
	retractall(cliente(_,_,_,_,_,_,_,_,_,C1,_,_,_,_,_,_,_,_,_)),
	assert(cliente(X,C2,C,D,E,F,G,H,I,C1,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told.

alteraEnderecoCliente(C1,C2):-
	consult('cliente.pl'),
	cliente(X,B,_,D,E,F,G,H,I,C1,K,L,M,N,O,P,Q,R,S),
	retractall(cliente(_,_,_,_,_,_,_,_,_,C1,_,_,_,_,_,_,_,_,_)),
	assert(cliente(X,B,C2,D,E,F,G,H,I,C1,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told.

alteraComplementoCliente(C1,C2):-
	consult('cliente.pl'),
	cliente(X,B,C,_,E,F,G,H,I,C1,K,L,M,N,O,P,Q,R,S),
	retractall(cliente(_,_,_,_,_,_,_,_,_,C1,_,_,_,_,_,_,_,_,_)),
	assert(cliente(X,B,C,C2,E,F,G,H,I,C1,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told.

alteraCidadeCliente(C1,C2):-
	consult('cliente.pl'),
	cliente(X,B,C,D,_,F,G,H,I,C1,K,L,M,N,O,P,Q,R,S),
	retractall(cliente(_,_,_,_,_,_,_,_,_,C1,_,_,_,_,_,_,_,_,_)),
	assert(cliente(X,B,C,D,C2,F,G,H,I,C1,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told.

alteraTelefoneCliente(C1,C2):-
	consult('cliente.pl'),
	cliente(X,B,C,D,E,_,G,H,I,C1,K,L,M,N,O,P,Q,R,S),
	retractall(cliente(_,_,_,_,_,_,_,_,_,C1,_,_,_,_,_,_,_,_,_)),
	assert(cliente(X,B,C,D,E,C2,G,H,I,C1,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told.


alteraCelularCliente(C1,C2):-
	consult('cliente.pl'),
	cliente(X,B,C,D,E,F,_,H,I,C1,K,L,M,N,O,P,Q,R,S),
	retractall(cliente(_,_,_,_,_,_,_,_,_,C1,_,_,_,_,_,_,_,_,_)),
	assert(cliente(X,B,C,D,E,F,C2,H,I,C1,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told.

alteraEstadoCivilCliente(C1,C2):-
	consult('cliente.pl'),
	cliente(X,B,C,D,E,F,G,_,I,C1,K,L,M,N,O,P,Q,R,S),
	retractall(cliente(_,_,_,_,_,_,_,_,_,C1,_,_,_,_,_,_,_,_,_)),
	assert(cliente(X,B,C,D,E,F,G,C2,I,C1,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told.

alteraRGCliente(C1,C2):-
	consult('cliente.pl'),
	cliente(X,B,C,D,E,F,G,H,_,C1,K,L,M,N,O,P,Q,R,S),
	retractall(cliente(_,_,_,_,_,_,_,_,_,C1,_,_,_,_,_,_,_,_,_)),
	assert(cliente(X,B,C,D,E,F,G,H,C2,C1,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told.
alteraCPFCliente(C1,C2):-
	consult('cliente.pl'),
	cliente(X,B,C,D,E,F,G,H,I,C1,K,L,M,N,O,P,Q,R,S),
	retractall(cliente(_,_,_,_,_,_,_,_,_,C1,_,_,_,_,_,_,_,_,_)),
	assert(cliente(X,B,C,D,E,F,G,H,I,C2,K,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told.
alteraDataNascimentoCliente(C1,C2):-
	consult('cliente.pl'),
	cliente(X,B,C,D,E,F,G,H,I,C1,_,L,M,N,O,P,Q,R,S),
	retractall(cliente(_,_,_,_,_,_,_,_,_,C1,_,_,_,_,_,_,_,_,_)),
	assert(cliente(X,B,C,D,E,F,G,H,I,C1,C2,L,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told.

alteraMaeCliente(C1,C2):-
	consult('cliente.pl'),
	cliente(X,B,C,D,E,F,G,H,I,C1,K,_,M,N,O,P,Q,R,S),
	retractall(cliente(_,_,_,_,_,_,_,_,_,C1,_,_,_,_,_,_,_,_,_)),
	assert(cliente(X,B,C,D,E,F,G,H,I,C1,K,C2,M,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told.


alteraPai(C1,C2):-
	consult('cliente.pl'),
	cliente(X,B,C,D,E,F,G,H,I,C1,K,L,_,N,O,P,Q,R,S),
	retractall(cliente(_,_,_,_,_,_,_,_,_,C1,_,_,_,_,_,_,_,_,_)),
	assert(cliente(X,B,C,D,E,F,G,H,I,C1,K,L,C2,N,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told.

alteraSexo(C1,C2):-
	consult('cliente.pl'),
	cliente(X,B,C,D,E,F,G,H,I,C1,K,L,M,_,O,P,Q,R,S),
	retractall(cliente(_,_,_,_,_,_,_,_,_,C1,_,_,_,_,_,_,_,_,_)),
	assert(cliente(X,B,C,D,E,F,G,H,I,C1,K,L,M,C2,O,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told.
alteraEmail(C1,C2):-
	consult('cliente.pl'),
	cliente(X,B,C,D,E,F,G,H,I,C1,K,L,M,N,_,P,Q,R,S),
	retractall(cliente(_,_,_,_,_,_,_,_,_,C1,_,_,_,_,_,_,_,_,_)),
	assert(cliente(X,B,C,D,E,F,G,H,I,C1,K,L,M,N,C2,P,Q,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told.
alteraStatus(C1,C2):-
	consult('cliente.pl'),
	cliente(X,B,C,D,E,F,G,H,I,C1,K,L,M,N,O,P,_,R,S),
	retractall(cliente(_,_,_,_,_,_,_,_,_,C1,_,_,_,_,_,_,_,_,_)),
	assert(cliente(X,B,C,D,E,F,G,H,I,C1,K,L,M,N,O,P,C2,R,S)),
	tell('cliente.pl'),
	listing(cliente),
	told.





menuAlteraDependentes:-
	new(G,frame('Menu Alterar Dependente - Video Locadora')),
%new(MenuD, dialog),
new(E, dialog),
new(D1, dialog),
new(D2, dialog),
%new(D3, dialog),
send(E, append, button('Alterar Cod. Cliente', message(@prolog, menuAlteraCodClienteDependente))),
send(E, append, button('Alterar Nome', message(@prolog, menuAlteraNomeDependente))),
send(E, append, button('Alterar Descricao',message(@prolog, menuAlteraDescricaoDependente))),
send(D1, append, button('Alterar Status', message(@prolog, menuAlteraStatusDependente))),
%send(D2, append, button(ok,message(@prolog, salvarCliente))),
send(D2, append, button(fechar, message(G,destroy))),
%send(E, append, text('Teste de funo de boto')),
%send(E, append, button(ok,message(G,destroy))),
send(D2, right, D1),
send(E, above(D1)),
%send(D1, above(D2)),
%send(D2, above(D3)),
send(G, append, E),
send(G, open_centered).

menuAlteraCodClienteDependente:-
	new(G, frame('Alterar Dependente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Dependente')),
	send(D1, append, C1),
	new(C2, text_item('Novo codigo do Cliente')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraCodClienteDependente,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).
menuAlteraNomeDependente:-
	new(G, frame('Alterar Dependente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Dependente')),
	send(D1, append, C1),
	new(C2, text_item('Novo nome')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraNomeDependente,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).
menuAlteraDescricaoDependente:-
	new(G, frame('Alterar Dependente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Dependente')),
	send(D1, append, C1),
	new(C2, text_item('Novo Descricao')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraDescricaoDependente,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraStatusDependente:-
	new(G, frame('Alterar Dependente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Dependente')),
	send(D1, append, C1),
	new(C2, text_item('Novo Status')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraStatusDependente,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

alteraCodClienteDependente(C1,C2):-
	consult('dependente.pl'),
	dependente(C1,_,C,D,E),
       	retractall(dependente(C1,_,_,_,_)),
	assert(dependente(C1,C2,C,D,E)),
	tell('dependente.pl'),
	listing(dependente),
	told.

alteraNomeDependente(C1,C2):-
	consult('dependente.pl'),
	dependente(C1,B,_,D,E),
       	retractall(dependente(C1,_,_,_,_)),
	assert(dependente(C1,B,C2,D,E)),
	tell('dependente.pl'),
	listing(dependente),
	told.

alteraDescricaoDependente(C1,C2):-
	consult('dependente.pl'),
	dependente(C1,B,C,_,E),
       	retractall(dependente(C1,_,_,_,_)),
	assert(dependente(C1,B,C,C2,E)),
	tell('dependente.pl'),
	listing(dependente),
	told.

alteraStatusDependente(C1,C2):-
	consult('dependente.pl'),
	dependente(C1,B,C,D,_),
       	retractall(dependente(C1,_,_,_,_)),
	assert(dependente(C1,B,C,D,C2)),
	tell('dependente.pl'),
	listing(dependente),
	told.





menuAlteraFilmes:-
	new(G,frame('Menu Altera Filmes - Video Locadora')),
	%new(MenuD, dialog),
	new(E, dialog),
	new(D1, dialog),
	new(D2, dialog),
	%new(D3, dialog),
	send(E, append, button('Altera cod categoria', message(@prolog, menuAlteraCodCategoriaFilme))),
	send(E, append, button('Altera cod genero', message(@prolog, menuAlteraCodGeneroFilme))),
	send(E, append, button('Altera nome',message(@prolog, menuAlteraNomeFilme))),
	send(E, append, button('Altera nacionalidade',message(@prolog, menuAlteraNacionalidadeFilme))),
	send(D1, append, button('Altera duracao', message(@prolog, menuAlteraDuracaoFilme))),
	send(E, append, button('Altera data de lancamento',message(@prolog, menuAlteraDataLancamentoFilme))),
	send(D1, append, button('Altera elenco',message(@prolog, menuAlteraElencoFilme))),
	send(D1, append, button('Altera autor',message(@prolog, menuAlteraAutorFilme))),
       	send(D1, append, button('Altera status',message(@prolog, menuAlteraStatusFilme))),
	%send(D2, append, button(ok,message(@prolog, salvarCliente))),
	send(D2, append, button(fechar, message(G,destroy))),
	%send(E, append, text('Teste de funo de boto')),
	%send(E, append, button(ok,message(G,destroy))),
	send(D2, right, D1),
	send(E, above(D1)),
	%send(D1, above(D2)),
	%send(D2, above(D3)),
	send(G, append, E),
	send(G, open_centered).


menuAlteraCodCategoriaFilme:-
	new(G, frame('Alterar Dependente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Filme')),
	send(D1, append, C1),
	new(C2, text_item('Nova categoria')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraCodCategoriaFilme,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraCodGeneroFilme:-
	new(G, frame('Alterar Dependente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Filme')),
	send(D1, append, C1),
	new(C2, text_item('Novo genero')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraCodGeneroFilme,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraNomeFilme:-
	new(G, frame('Alterar Dependente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Filme')),
	send(D1, append, C1),
	new(C2, text_item('Novo nome')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraNomeFilme,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraNacionalidadeFilme:-
	new(G, frame('Alterar Dependente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Filme')),
	send(D1, append, C1),
	new(C2, text_item('Nova nacionalidade')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraNacionalidadeFilme,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraDuracaoFilme:-
	new(G, frame('Alterar Dependente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Filme')),
	send(D1, append, C1),
	new(C2, text_item('Nova duracao')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraDuracaoFilme,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraDataLancamentoFilme:-
	new(G, frame('Alterar Dependente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Filme')),
	send(D1, append, C1),
	new(C2, text_item('Nova data lancamento')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraDataLancamentoFilme,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraElencoFilme:-
	new(G, frame('Alterar Dependente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Filme')),
	send(D1, append, C1),
	new(C2, text_item('Novo elenco')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraElencoFilme,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraAutorFilme:-
	new(G, frame('Alterar Dependente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Filme')),
	send(D1, append, C1),
	new(C2, text_item('Novo autor')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraAutorFilme,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraStatusFilme:-
	new(G, frame('Alterar Dependente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Filme')),
	send(D1, append, C1),
	new(C2, text_item('Novo status')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraStatusFilme,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

alteraCodCategoriaFilme(C1,C2):-
	consult('filme.pl'),
	filme(C1,_,B,C,D,E,F,G,H,I),
       	retractall(filme(C1,_,_,_,_,_,_,_,_,_)),
	assert(filme(C1,C2,B,C,D,E,F,G,H,I)),
	tell('dependente.pl'),
	listing(dependente),
	told.

alteraCodGeneroFilme(X,C2):-
	consult('filme.pl'),
	filme(X,A,_,C,D,E,F,G,H,I),
       	retractall(filme(X,_,_,_,_,_,_,_,_,_)),
	assert(filme(X,A,C2,C,D,E,F,G,H,I)),
	tell('dependente.pl'),
	listing(dependente),
	told.
alteraNomeFilme(X,C2):-
	consult('filme.pl'),
	filme(X,A,B,_,D,E,F,G,H,I),
       	retractall(filme(X,_,_,_,_,_,_,_,_,_)),
	assert(filme(X,A,B,C2,D,E,F,G,H,I)),
	tell('dependente.pl'),
	listing(dependente),
	told.

alteraNacionalidadeFilme(C1,C2):-
	consult('filme.pl'),
	filme(C1,A,B,C,_,E,F,G,H,I),
       	retractall(filme(C1,_,_,_,_,_,_,_,_,_)),
	assert(filme(C1,A,B,C,C2,E,F,G,H,I)),
	tell('dependente.pl'),
	listing(dependente),
	told.

alteraDuracaoFilme(C1,C2):-
	consult('filme.pl'),
	filme(C1,A,B,C,D,_,F,G,H,I),
       	retract(filme(C1,A,B,C,D,_,F,G,H,I)),
	assert(filme(C1,A,B,C,D,C2,F,G,H,I)),
	tell('dependente.pl'),
	listing(dependente),
	told.

alteraDataLancamentoFilme(C1,C2):-
	consult('filme.pl'),
	filme(C1,A,B,C,D,E,_,G,H,I),
       	retractall(filme(C1,_,_,_,_,_,_,_,_,_)),
	assert(filme(C1,A,B,C,D,E,C2,G,H,I)),
	tell('dependente.pl'),
	listing(dependente),
	told.

alteraElencoFilme(C1,C2):-
	consult('filme.pl'),
	filme(C1,A,B,C,D,E,F,_,H,I),
       	retractall(filme(C1,_,_,_,_,_,_,_,_,_)),
	assert(filme(C1,A,B,C,D,E,F,C2,H,I)),
	tell('dependente.pl'),
	listing(dependente),
	told.
alteraAutorFilme(C1,C2):-
	consult('filme.pl'),
	filme(C1,A,B,C,D,E,F,G,_,I),
       	retractall(filme(C1,_,_,_,_,_,_,_,_,_)),
	assert(filme(C1,A,B,C,D,E,F,G,C2,I)),
	tell('dependente.pl'),
	listing(dependente),
	told.
alteraStatusFilme(C1,C2):-
	consult('filme.pl'),
	filme(C1,A,B,C,D,E,F,G,H,_),
       	retract(filme(C1,_,_,_,_,_,_,_,_,_)),
	assert(filme(C1,A,B,C,D,E,F,G,H,C2)),
	tell('dependente.pl'),
	listing(dependente),
	told.





menuAlteraExemplares:-
	new(G,frame('Menu Altera Exemplares - Video Locadora')),
	%new(MenuD, dialog),
	new(E, dialog),
	new(D1, dialog),
	new(D2, dialog),
	%new(D3, dialog),
	send(E, append, button('Altera cod filme', message(@prolog, menuAlteraCodFilmeExemplar))),
	send(E, append, button('Altera cod midia', message(@prolog, menuAlteraCodMidiaExemplar))),
	send(E, append, button('Altera Exe_XXX',message(@prolog, menuAlteraExeXXXExemplar))),
	send(E, append, button('Altera Status',message(@prolog, menuAlteraStatusExemplar))),
	send(D1, append, button('Altera cod fornecedor', message(@prolog, menuAlteraCodFornecedorExemplar))),
	send(D1, append, button('Altera cod funcionario',message(@prolog, menuAlteraCodFuncionarioExemplar))),
	send(D1, append, button('Altera status cadastro',message(@prolog, menuAlteraStatusCadastroExemplar))),
	%send(D2, append, button(ok,message(@prolog, salvarCliente))),
	send(D2, append, button(fechar, message(G,destroy))),
	%send(E, append, text('Teste de funo de boto')),
	%send(E, append, button(ok,message(G,destroy))),
	send(D2, right, D1),
	send(E, above(D1)),
	%send(D1, above(D2)),
	%send(D2, above(D3)),
	send(G, append, E),
	send(G, open_centered).




menuAlteraCodFilmeExemplar:-
	new(G, frame('Alterar Exemplar - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Exemplar')),
	send(D1, append, C1),
	new(C2, text_item('Novo cod Filme')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraCodFilmeExemplar,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraCodMidiaExemplar:-
	new(G, frame('Alterar Exemplar - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Exemplar')),
	send(D1, append, C1),
	new(C2, text_item('Novo cod Midia')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraCodMidiaExemplar,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraExeXXXExemplar:-
	new(G, frame('Alterar Exemplar - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Exemplar')),
	send(D1, append, C1),
	new(C2, text_item('Nova traducao')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraExeXXXExemplar,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).
menuAlteraStatusExemplar:-
	new(G, frame('Alterar Exemplar - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Exemplar')),
	send(D1, append, C1),
	new(C2, text_item('Novo status')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraStatusExemplar,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).
menuAlteraCodFornecedorExemplar:-
	new(G, frame('Alterar Exemplar - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Exemplar')),
	send(D1, append, C1),
	new(C2, text_item('Novo cod Fornecedor')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraCodFornecedorExemplar,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraCodFuncionarioExemplar:-
	new(G, frame('Alterar Exemplar - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Exemplar')),
	send(D1, append, C1),
	new(C2, text_item('Novo cod Funcionario')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraCodFuncionarioExemplar,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).
menuAlteraStatusCadastroExemplar:-
	new(G, frame('Alterar Exemplar - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Exemplar')),
	send(D1, append, C1),
	new(C2, text_item('Novo STATUS ')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraStatusCadastroExemplar,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


alteraCodFilmeExemplar(C1,C2):-
	consult('exemplar.pl'),
	exemplar(C1,_,B,C,D,E,F,G),
       	retractall(exemplar(C1,_,_,_,_,_,_,_)),
	assert(exemplar(C1,C2,B,C,D,E,F,G)),
	tell('exemplar.pl'),
	listing(exemplar),
	told.

alteraCodMidiaExemplar(C1,C2):-
	consult('exemplar.pl'),
	exemplar(C1,A,_,C,D,E,F,G),
       	retractall(exemplar(C1,_,_,_,_,_,_,_)),
	assert(exemplar(C1,A,C2,C,D,E,F,G)),
	tell('exemplar.pl'),
	listing(exemplar),
	told.

alteraExeXXXExemplar(C1,C2):-
	consult('exemplar.pl'),
	exemplar(C1,A,B,_,D,E,F,G),
       	retractall(exemplar(C1,_,_,_,_,_,_,_)),
	assert(exemplar(C1,A,B,C2,D,E,F,G)),
	tell('exemplar.pl'),
	listing(exemplar),
	told.

alteraStatusExemplar(C1,C2):-
%	consult('exemplar.pl'),
	exemplar(C1,A,B,C,_,E,F,G),
       	retractall(exemplar(C1,_,_,_,_,_,_,_)),
	assert(exemplar(C1,A,B,C,C2,E,F,G)),
	tell('exemplar.pl'),
	listing(exemplar),
	told.

alteraCodFornecedorExemplar(C1,C2):-
%	consult('exemplar.pl'),
	exemplar(C1,A,B,C,D,_,F,G),
       	retractall(exemplar(C1,_,_,_,_,_,_,_)),
	assert(exemplar(C1,A,B,C,D,C2,F,G)),
	tell('exemplar.pl'),
	listing(exemplar),
	told.

alteraCodFuncionarioExemplar(C1,C2):-
%	consult('exemplar.pl'),
	exemplar(C1,A,B,C,D,E,_,G),
       	retractall(exemplar(C1,_,_,_,_,_,_,_)),
	assert(exemplar(C1,A,B,C,D,E,C2,G)),
	tell('exemplar.pl'),
	listing(exemplar),
	told.

alteraStatusCadastroExemplar(C1,C2):-
%	consult('exemplar.pl'),
	exemplar(C1,A,B,C,D,E,F,_),
       	retract(exemplar(C1,_,_,_,_,_,_,_)),
	assert(exemplar(C1,A,B,C,D,E,F,C2)),
	tell('exemplar.pl'),
	listing(exemplar),
	told.




menuAlteraFuncionarios:-
	new(G,frame('Menu Altera Funcionario - Video Locadora')),
	%new(MenuD, dialog),
	new(E, dialog),
	new(D1, dialog),
	new(D2, dialog),
	%new(D3, dialog),
	send(E, append, button('Altera Nome', message(@prolog, menuAlteraNomeFuncionario))),
	send(E, append, button('Altera Endereco', message(@prolog, menuAlteraEnderecoFuncionario))),
	send(E, append, button('Altera Cidade',message(@prolog, menuAlteraCidadeFuncionario))),
	send(E, append, button('Altera CEP',message(@prolog, menuAlteraCEPFuncionario))),
	send(E, append, button('Altera Telefone', message(@prolog, menuAlteraTelefoneFuncionario))),
	send(E, append, button('Altera Celular',message(@prolog, menuAlteraCelularFuncionario))),
	send(E, append, button('Altera nascimento',message(@prolog, menuAlteraNascimentoFuncionario))),
	send(E, append, button('Altera admissao',message(@prolog, menuAlteraAdmissaoFuncionario))),
       	send(E, append, button('Altera RG',message(@prolog, menuAlteraRGFuncionario))),
	send(D1, append, button('Altera CPF', message(@prolog, menuAlterarCPFFuncionario))),
	send(D1, append, button('Altera Email', message(@prolog, menuAlteraEmailFuncionario))),
	send(D1, append, button('Altera Status',message(@prolog, menuAlteraStatusFuncionario))),
	send(D1, append, button('Altera Login',message(@prolog, menuAlteraLoginFuncionario))),	%send(D2, append, button(ok,message(@prolog, salvarCliente))),
	send(D2, append, button(fechar, message(G,destroy))),
	%send(E, append, text('Teste de funo de boto')),
	%send(E, append, button(ok,message(G,destroy))),
	send(D2, right, D1),
	send(E, above(D1)),
	%send(D1, above(D2)),
	%send(D2, above(D3)),
	send(G, append, E),
	send(G, open_centered).

menuAlteraNomeFuncionario:-
	new(G, frame('Alterar Funcionario - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Funcionario')),
	send(D1, append, C1),
	new(C2, text_item('Novo nome funcionario')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraNomeFuncionario,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraEnderecoFuncionario:-
	new(G, frame('Alterar Funcionario - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Funcionario')),
	send(D1, append, C1),
	new(C2, text_item('Novo endereco funcionario')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraEnderecoFuncionario,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraCidadeFuncionario:-
	new(G, frame('Alterar Funcionario - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Funcionario')),
	send(D1, append, C1),
	new(C2, text_item('Nova cidade')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraCidadeFuncionario,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


menuAlteraCEPFuncionario:-
	new(G, frame('Alterar Funcionario - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Funcionario')),
	send(D1, append, C1),
	new(C2, text_item('Novo CEP')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraCEPFuncionario,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


menuAlteraTelefoneFuncionario:-
	new(G, frame('Alterar Funcionario - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Funcionario')),
	send(D1, append, C1),
	new(C2, text_item('Novo Telefone')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraTelefoneFuncionario,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


menuAlteraCelularFuncionario:-
	new(G, frame('Alterar Funcionario - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Funcionario')),
	send(D1, append, C1),
	new(C2, text_item('Novo Celular')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraCelularFuncionario,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


menuAlteraNascimentoFuncionario:-
	new(G, frame('Alterar Funcionario - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Funcionario')),
	send(D1, append, C1),
	new(C2, text_item('Novo Nascimento')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraNascimentoFuncionario,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraAdmissaoFuncionario:-
	new(G, frame('Alterar Funcionario - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Funcionario')),
	send(D1, append, C1),
	new(C2, text_item('Nova admissao')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraAdmissaoFuncionario,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraRGFuncionario:-
	new(G, frame('Alterar Funcionario - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Funcionario')),
	send(D1, append, C1),
	new(C2, text_item('Novo RG')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraRGFuncionario,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraCPFFuncionario:-
	new(G, frame('Alterar Funcionario - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Funcionario')),
	send(D1, append, C1),
	new(C2, text_item('Novo CPF')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraCPFFuncionario,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraEmailFuncionario:-
	new(G, frame('Alterar Funcionario - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Funcionario')),
	send(D1, append, C1),
	new(C2, text_item('Novo Email')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraEmailFuncionario,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraStatusFuncionario:-
	new(G, frame('Alterar Funcionario - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Funcionario')),
	send(D1, append, C1),
	new(C2, text_item('Novo Status')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraStatusFuncionario,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraLoginFuncionario:-
	new(G, frame('Alterar Funcionario - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Funcionario')),
	send(D1, append, C1),
	new(C2, text_item('Novo Login')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraLoginFuncionario,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


alteraNomeFuncionario(C1,C2):-
	consult('funcionario.pl'),
	funcionario(C1,_,C,D,E,F,G,H,I,J,K,L,M,N),
       	retract(funcionario(C1,_,_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(funcionario(C1,C2,C,D,E,F,G,H,I,J,K,L,M,N)),
	tell('funcionario.pl'),
	listing(funcionario),
	told.

alteraEnderecoFuncionario(C1,C2):-
	consult('funcionario.pl'),
	funcionario(C1,B,_,D,E,F,G,H,I,J,K,L,M,N),
       	retract(funcionario(C1,_,_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(funcionario(C1,B,C2,D,E,F,G,H,I,J,K,L,M,N)),
	tell('funcionario.pl'),
	listing(funcionario),
	told.

alteraCidadeFuncionario(C1,C2):-
	consult('funcionario.pl'),
	funcionario(C1,B,C,_,E,F,G,H,I,J,K,L,M,N),
       	retract(funcionario(C1,_,_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(funcionario(C1,B,C,C2,E,F,G,H,I,J,K,L,M,N)),
	tell('funcionario.pl'),
	listing(funcionario),
	told.

alteraCEPFuncionario(C1,C2):-
	consult('funcionario.pl'),
	funcionario(C1,B,C,D,_,F,G,H,I,J,K,L,M,N),
       	retract(funcionario(C1,_,_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(funcionario(C1,B,C,D,C2,F,G,H,I,J,K,L,M,N)),
	tell('funcionario.pl'),
	listing(funcionario),
	told.


alteraTelefoneFuncionario(C1,C2):-
	consult('funcionario.pl'),
	funcionario(C1,B,C,D,E,_,G,H,I,J,K,L,M,N),
       	retract(funcionario(C1,_,_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(funcionario(C1,B,C,D,E,C2,G,H,I,J,K,L,M,N)),
	tell('funcionario.pl'),
	listing(funcionario),
	told.


alteraCelularFuncionario(C1,C2):-
	consult('funcionario.pl'),
	funcionario(C1,B,C,D,E,F,_,H,I,J,K,L,M,N),
       	retract(funcionario(C1,_,_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(funcionario(C1,B,C,D,E,F,C2,H,I,J,K,L,M,N)),
	tell('funcionario.pl'),
	listing(funcionario),
	told.


alteraNascimentoFuncionario(C1,C2):-
	consult('funcionario.pl'),
	funcionario(C1,B,C,D,E,F,G,_,I,J,K,L,M,N),
       	retract(funcionario(C1,_,_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(funcionario(C1,B,C,D,E,F,G,C2,I,J,K,L,M,N)),
	tell('funcionario.pl'),
	listing(funcionario),
	told.

alteraAdmissaoFuncionario(C1,C2):-
	consult('funcionario.pl'),
	funcionario(C1,B,C,D,E,F,G,H,_,J,K,L,M,N),
       	retract(funcionario(C1,_,_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(funcionario(C1,B,C,D,E,F,G,H,C2,J,K,L,M,N)),
	tell('funcionario.pl'),
	listing(funcionario),
	told.

alteraRGFuncionario(C1,C2):-
	consult('funcionario.pl'),
	funcionario(C1,B,C,D,E,F,G,H,I,_,K,L,M,N),
       	retract(funcionario(C1,_,_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(funcionario(C1,B,C,D,E,F,G,H,I,C2,K,L,M,N)),
	tell('funcionario.pl'),
	listing(funcionario),
	told.


alteraCPFFuncionario(C1,C2):-
	consult('funcionario.pl'),
	funcionario(C1,B,C,D,E,F,G,H,I,J,_,L,M,N),
       	retract(funcionario(C1,_,_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(funcionario(C1,B,C,D,E,F,G,H,I,J,C2,L,M,N)),
	tell('funcionario.pl'),
	listing(funcionario),
	told.

alteraEmailFuncionario(C1,C2):-
	consult('funcionario.pl'),
	funcionario(C1,B,C,D,E,F,G,H,I,J,K,_,M,N),
       	retract(funcionario(C1,_,_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(funcionario(C1,B,C,D,E,F,G,H,I,J,K,C2,M,N)),
	tell('funcionario.pl'),
	listing(funcionario),
	told.


alteraStatusFuncionario(C1,C2):-
	consult('funcionario.pl'),
	funcionario(C1,B,C,D,E,F,G,H,I,J,K,L,_,N),
       	retract(funcionario(C1,_,_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(funcionario(C1,B,C,D,E,F,G,H,I,J,K,L,C2,N)),
	tell('funcionario.pl'),
	listing(funcionario),
	told.

alteraLoginFuncionario(C1,C2):-
	consult('funcionario.pl'),
	funcionario(C1,B,C,D,E,F,G,H,I,J,K,L,M,_),
       	retract(funcionario(C1,_,_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(funcionario(C1,B,C,D,E,F,G,H,I,J,K,L,M,C2)),
	tell('funcionario.pl'),
	listing(funcionario),
	told.





menuAlteraFornecedores:-
	new(G,frame('Menu Altera Fornecedores - Video Locadora')),
	%new(MenuD, dialog),
	new(E, dialog),
	new(D1, dialog),
	new(D2, dialog),
	%new(D3, dialog),
	send(E, append, button('Altera Nome', message(@prolog, menuAlteraNomeFornecedor))),
	send(E, append, button('Altera Razao Social', message(@prolog, menuAlteraRazaoSocialFornecedor))),
	send(E, append, button('Altera Endereco',message(@prolog, menuAlteraEnderecoFornecedor))),
	send(E, append, button('Altera Cidade',message(@prolog, menuAlteraCidadeFornecedor))),
	send(E, append, button('Altera CEP', message(@prolog, menuAlteraCEPFornecedor))),
	send(E, append, button('Altera Telefone',message(@prolog, menuAlteraTelefoneFornecedor))),
	send(D1, append, button('Altera Fax',message(@prolog, menuAlteraFAXFornecedor))),
	send(D1, append, button('Altera CGC',message(@prolog, menuAlteraCGCFornecedor))),
       	send(D1, append, button('Altera Email',message(@prolog, menuAlteraEmailFornecedor))),
	send(D1, append, button('Altera Contato', message(@prolog, menuAlteraContatoFornecedor))),
	send(D1, append, button('Altera Tel contato', message(@prolog, menuAlteraTelContatoFornecedor))),
	send(D1, append, button('Altera Status',message(@prolog, menuAlteraStatusFornecedor))),
	%send(D2, append, button(ok,message(@prolog, salvarCliente))),
	send(D2, append, button(fechar, message(G,destroy))),
	%send(E, append, text('Teste de funo de boto')),
	%send(E, append, button(ok,message(G,destroy))),
	send(D2, right, D1),
	send(E, above(D1)),
	%send(D1, above(D2)),
	%send(D2, above(D3)),
	send(G, append, E),
	send(G, open_centered).



menuAlteraNomeFornecedor:-
	new(G, frame('Alterar Fornecedor - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Fornecedor')),
	send(D1, append, C1),
	new(C2, text_item('Novo Nome')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraNomeFornecedor,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraRazaoSocialFornecedor:-
	new(G, frame('Alterar Fornecedor - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Fornecedor')),
	send(D1, append, C1),
	new(C2, text_item('Nova razao social')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraRazaoSocialFornecedor,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraEnderecoFornecedor:-
	new(G, frame('Alterar Fornecedor - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Fornecedor')),
	send(D1, append, C1),
	new(C2, text_item('Novo endereco')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraEnderecoFornecedor,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraCidadeFornecedor:-
	new(G, frame('Alterar Fornecedor - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Fornecedor')),
	send(D1, append, C1),
	new(C2, text_item('Nova cidade')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraCidadeFornecedor,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).



menuAlteraCEPFornecedor:-
	new(G, frame('Alterar Fornecedor - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Fornecedor')),
	send(D1, append, C1),
	new(C2, text_item('Novo CEP')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraCEPFornecedor,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


menuAlteraTelefoneFornecedor:-
	new(G, frame('Alterar Fornecedor - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Fornecedor')),
	send(D1, append, C1),
	new(C2, text_item('Novo telefone')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraTelefoneFornecedor,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraFAXFornecedor:-
	new(G, frame('Alterar Fornecedor - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Fornecedor')),
	send(D1, append, C1),
	new(C2, text_item('Novo FAX')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraFAXFornecedor,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).
menuAlteraCGCFornecedor:-
	new(G, frame('Alterar Fornecedor - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Fornecedor')),
	send(D1, append, C1),
	new(C2, text_item('Novo CGC')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraCGCFornecedor,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraEmailFornecedor:-
	new(G, frame('Alterar Fornecedor - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Fornecedor')),
	send(D1, append, C1),
	new(C2, text_item('Novo email')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraEmailFornecedor,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


menuAlteraContatoFornecedor:-
	new(G, frame('Alterar Fornecedor - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Fornecedor')),
	send(D1, append, C1),
	new(C2, text_item('Novo contato')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraContatoFornecedor,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menuAlteraTelContatoFornecedor:-
	new(G, frame('Alterar Fornecedor - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Fornecedor')),
	send(D1, append, C1),
	new(C2, text_item('Novo tel contato')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraTelContatoFornecedor,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).



menuAlteraStatusFornecedor:-
	new(G, frame('Alterar Fornecedor - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cod Fornecedor')),
	send(D1, append, C1),
	new(C2, text_item('Novo status')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraStatusFornecedor,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).



alteraNomeFornecedor(C1,C2):-
	consult('fornecedor.pl'),
	fornecedor(C1,_,C,D,E,F,G,H,I,J,K,L,M),
	retractall(fornecedor(C1,_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(fornecedor(C1,C2,C,D,E,F,G,H,I,J,K,L,M)),
	tell('fornecedor.pl'),
	listing(fornecedor),
	told.


alteraRazaoSocialFornecedor(C1,C2):-
	consult('fornecedor.pl'),
	fornecedor(C1,B,_,D,E,F,G,H,I,J,K,L,M),
	retractall(fornecedor(C1,_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(fornecedor(C1,B,C2,D,E,F,G,H,I,J,K,L,M)),
	tell('fornecedor.pl'),
	listing(fornecedor),
	told.

alteraEnderecoFornecedor(C1,C2):-
	consult('fornecedor.pl'),
	fornecedor(C1,B,C,_,E,F,G,H,I,J,K,L,M),
	retractall(fornecedor(C1,_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(fornecedor(C1,B,C,C2,E,F,G,H,I,J,K,L,M)),
	tell('fornecedor.pl'),
	listing(fornecedor),
	told.


alteraCidadeFornecedor(C1,C2):-
	consult('fornecedor.pl'),
	fornecedor(C1,B,C,D,_,F,G,H,I,J,K,L,M),
	retractall(fornecedor(C1,_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(fornecedor(C1,B,C,D,C2,F,G,H,I,J,K,L,M)),
	tell('fornecedor.pl'),
	listing(fornecedor),
	told.


alteraCEPFornecedor(C1,C2):-
	consult('fornecedor.pl'),
	fornecedor(C1,B,C,D,E,_,G,H,I,J,K,L,M),
	retractall(fornecedor(C1,_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(fornecedor(C1,B,C,D,E,C2,G,H,I,J,K,L,M)),
	tell('fornecedor.pl'),
	listing(fornecedor),
	told.

alteraTelefoneFornecedor(C1,C2):-
	consult('fornecedor.pl'),
	fornecedor(C1,B,C,D,E,F,_,H,I,J,K,L,M),
	retractall(fornecedor(C1,_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(fornecedor(C1,B,C,D,E,F,C2,H,I,J,K,L,M)),
	tell('fornecedor.pl'),
	listing(fornecedor),
	told.

alteraFAXFornecedor(C1,C2):-
	consult('fornecedor.pl'),
	fornecedor(C1,B,C,D,E,F,G,_,I,J,K,L,M),
	retractall(fornecedor(C1,_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(fornecedor(C1,B,C,D,E,F,G,C2,I,J,K,L,M)),
	tell('fornecedor.pl'),
	listing(fornecedor),
	told.

alteraCGCFornecedor(C1,C2):-
	consult('fornecedor.pl'),
	fornecedor(C1,B,C,D,E,F,G,H,_,J,K,L,M),
	retractall(fornecedor(C1,_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(fornecedor(C1,B,C,D,E,F,G,H,C2,J,K,L,M)),
	tell('fornecedor.pl'),
	listing(fornecedor),
	told.

alteraEmailFornecedor(C1,C2):-
	consult('fornecedor.pl'),
	fornecedor(C1,B,C,D,E,F,G,H,I,_,K,L,M),
	retractall(fornecedor(C1,_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(fornecedor(C1,B,C,D,E,F,G,H,I,C2,K,L,M)),
	tell('fornecedor.pl'),
	listing(fornecedor),
	told.

alteraContatoFornecedor(C1,C2):-
	consult('fornecedor.pl'),
	fornecedor(C1,B,C,D,E,F,G,H,I,J,_,L,M),
	retractall(fornecedor(C1,_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(fornecedor(C1,B,C,D,E,F,G,H,I,J,C2,L,M)),
	tell('fornecedor.pl'),
	listing(fornecedor),
	told.

alteraTelContatoFornecedor(C1,C2):-
	consult('fornecedor.pl'),
	fornecedor(C1,B,C,D,E,F,G,H,I,J,K,_,M),
	retractall(fornecedor(C1,_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(fornecedor(C1,B,C,D,E,F,G,H,I,J,K,C2,M)),
	tell('fornecedor.pl'),
	listing(fornecedor),
	told.

alteraStatusFornecedor(C1,C2):-
	consult('fornecedor.pl'),
	fornecedor(C1,B,C,D,E,F,G,H,I,J,K,L,_),
	retractall(fornecedor(C1,_,_,_,_,_,_,_,_,_,_,_,_)),
	assert(fornecedor(C1,B,C,D,E,F,G,H,I,J,K,L,C2)),
	tell('fornecedor.pl'),
	listing(fornecedor),
	told.


menuEmpresa:-
	new(H,frame('Menu Empresas - Video Locadora')),
	%new(MenuD, dialog),
	new(E, dialog),
	new(D1, dialog),
	new(D2, dialog),
	new(D3, dialog),


	send(E, append, button('Cadastrar empresa', message(@prolog, cadastroEmpresa))),
	send(E, append, button('Consultar empresa', message(@prolog, consultaEmpresa))),
	send(E, append, button('Alterar empresa',message(@prolog, menuAlteraEmpresa))),
	send(E, append, button('Remover empresa',message(@prolog, removeEmpresa))),
	send(D1, append, button('Cadastrar fornecedor', message(@prolog, cadastroFornecedor))),
	send(D1, append, button('Consultar fonecedor', message(@prolog, consultaFornecedor))),
	send(D1, append, button('Alterar fornecedor', message(@prolog, menuAlteraFornecedores))),
	send(D1, append, button('Remover fornecedor',message(@prolog, removeFornecedor))),
	send(D2, append, button('Cadastrar funcionario', message(@prolog, cadastroFuncionario))),
	send(D2, append, button('Consultar funcionario', message(@prolog, consultaFuncionario))),
	send(D2, append, button('Alterar funcionario', message(@prolog, menuAlteraFuncionarios))),
	send(D2, append, button('Remover funcionario',message(@prolog, removeFuncionario))),

	%send(E, append, button(cancelar,message(@prolog, cadastrarCliente))),
	%send(E, append, button(gravar,message(@prolog, cadastrarCliente))),
	send(D3, append, button(fechar, message(H,destroy))),
	send(D3, right, D1),
	%send(E, append, text('Teste de funo de boto')),
	%send(E, append, button(ok,message(G,destroy))),
	send(E, above(D1)),
	send(D1, above(D2)),
	%send(D2, above(D3)),
	send(H, append, E),
	send(H, open_centered).

% ------------------------------------------------------------------------
% Criao do Menu Contas

menuContas:-
new(G,frame('Menu Contas - Video Locadora')),
%new(MenuD, dialog),
new(E, dialog),
new(D1, dialog),
new(D2, dialog),
%new(D3, dialog),
%send(D3, right, D2),
send(E, append, button(' Cadastrar Contas a Pagar ', message(@prolog, cadastroContasPa))),
send(E, append, button('  Consultar Contas a Pagar ', message(@prolog, consultaContasPa))),
send(E, append, button('   Alterar Contas a Pagar ',message(@prolog, alteraContasPa))),
send(E, append, button('   Remover Contas a Pagar ',message(@prolog, removeContasPa))),
send(D1, append, button('Cadastar Contas a Receber', message(@prolog, cadastroContasRe))),
send(D1, append, button('Consultar Contas a Receber',message(@prolog, consultaContasRe))),
send(D1, append, button('Alterar Contas a Receber',message(@prolog, alteraContasRe))),
send(D1, append, button('Remover Contas a Receber',message(@prolog, removeContasRe))),
%send(D2, append, button(ok,message(@prolog, salvarCliente))),
send(D2, append, button(fechar, message(G,destroy))),
send(E, above(D1)),
send(D1, above(D2)),

send(G, append, E),
send(G, open_centered).


menuReservas:-
new(G,frame('Menu Reservas e Locaes - Video Locadora')),
%new(MenuD, dialog),
new(E, dialog),
new(D1, dialog),
new(D2, dialog),
%new(D3, dialog),
%send(D3, right, D2),
send(E, append, button('Cadastrar Reserva', message(@prolog, cadastroReserva))),
send(E, append, button('Consultar Reserva', message(@prolog, consultaReserva))),
send(E, append, button('Alterar Reserva ',message(@prolog, alteraReserva))),
send(E, append, button(' Remover Reserva',message(@prolog, removeReserva))),
send(D1, append, button('Cadastar Locacao', message(@prolog, cadastroLocacao))),
send(D1, append, button('Consultar Locacao',message(@prolog, consultaLocacao))),
send(D1, append, button('Alterar Locacao',message(@prolog, alteraLocacao))),
send(D1, append, button('Remover Locacao',message(@prolog, removeLocacao))),
%send(D2, append, button(ok,message(@prolog, salvarCliente))),
send(D2, append, button(fechar, message(G,destroy))),
send(E, above(D1)),
send(D1, above(D2)),

send(G, append, E),
send(G, open_centered).

% ------------------------------------------------------------------------
% Criao do Menu Itens

menuItens:-
new(G,frame('Menu Itens - Video Locadora')),
%new(MenuD, dialog),
new(E, dialog),
new(D1, dialog),
new(D2, dialog),
new(D3, dialog),
%send(D3, right, D2),
send(E, append, button('Cadastrar Item', message(@prolog, cadastroItem))),
send(E, append, button('Consultar Item', message(@prolog, consultaItem))),
send(E, append, button('Alterar Item',message(@prolog, alteraItem))),
send(E, append, button('Remover Item',message(@prolog, removeItem))),
send(D1, append, button('Cadastar Exemplar', message(@prolog, cadastroExemplar))),
send(D1, append, button('Consultar Exemplar',message(@prolog, consultaExemplar))),
send(D1, append, button('Alterar Exemplar',message(@prolog, menuAlteraExemplares))),
send(D1, append, button('Remover Exemplar',message(@prolog, removeExemplar))),
send(D2, append, button('Cadastar Midia', message(@prolog, cadastroMidia))),
send(D2, append, button('Consultar Midia',message(@prolog, consultaMidia))),
send(D2, append, button('Alterar Midia',message(@prolog, menuAlteraMidia))),
send(D2, append, button('Remover Midia',message(@prolog, removeMidia))),
%send(D3, append, button(ok,message(@prolog, salvarCliente))),
send(D3, append, button(fechar, message(G,destroy))),
send(E, above(D1)),
send(D1, above(D2)),
send(D2, above(D3)),
send(G, append, E),
send(G, open_centered).

% ------------------------------------------------------------------------
% Criao do Menu Filmes

menuFilmes:-
new(G,frame('Menu Filmes - Video Locadora')),
%new(MenuD, dialog),
new(E, dialog),
new(D1, dialog),
new(D2, dialog),
new(D3, dialog),
%send(D3, right, D2),
send(E, append, button('Cadastrar Filme', message(@prolog, cadastroFilme))),
send(E, append, button('Consultar Filme', message(@prolog, consultaFilme))),
send(E, append, button('Alterar Filme',message(@prolog, menuAlteraFilmes))),
send(E, append, button('Remover Filme',message(@prolog, removeFilme))),
send(D1, append, button('Cadastar Genero', message(@prolog, cadastroGenero))),
send(D1, append, button('Consultar Genero',message(@prolog, consultaGenero))),
send(D1, append, button('Alterar Genero',message(@prolog, menuAlteraGenero))),
send(D1, append, button('Remover Genero',message(@prolog, removeGenero))),
send(D2, append, button('Cadastar Categoria', message(@prolog, cadastroCategoria))),
send(D2, append, button('Consultar Categoria',message(@prolog, consultaCategoria))),
send(D2, append, button('Alterar Categoria',message(@prolog, menuAlteraCategoria))),
send(D2, append, button('Remover Categoria',message(@prolog, removeCategoria))),
%send(D3, append, button(ok,message(@prolog, salvarCliente))),
send(D3, append, button(fechar, message(G,destroy))),
send(E, above(D1)),
send(D1, above(D2)),
send(D2, above(D3)),
send(G, append, E),
send(G, open_centered).


% ------------------------------------------------------------------------
% Criao do Menu Preo

menuPreco:-
new(G,frame('Menu Preo - Video Locadora')),
%new(MenuD, dialog),
new(E, dialog),
new(D1, dialog),
new(D2, dialog),
new(D3, dialog),
%send(D3, right, D2),
send(E, append, button('Cadastrar Preco', message(@prolog, cadastroPreco))),
send(E, append, button('Consultar Preco', message(@prolog, consultaPreco))),
send(E, append, button('Alterar Preco',message(@prolog, menuAlteraPreco))),
send(E, append, button('Remover Preco',message(@prolog, removePreco))),
send(D1, append, button('Cadastar Pagamento', message(@prolog, cadastroPagamento))),
send(D1, append, button('Consultar Pagamento',message(@prolog, consultaPagamento))),
send(D1, append, button('Alterar Pagamento',message(@prolog, alteraPagamento))),
send(D1, append, button('Remover Pagamento',message(@prolog, removePagamento))),
send(D2, append, button('Cadastar Movimento', message(@prolog, cadastroMovimento))),
send(D2, append, button('Consultar Movimento',message(@prolog, consultaMovimento))),
send(D2, append, button('Alterar Movimento',message(@prolog, alteraMovimento))),
send(D2, append, button('Remover Movimento',message(@prolog, removeMovimento))),
%send(D3, append, button(ok,message(@prolog, salvarCliente))),
send(D3, append, button(fechar, message(G,destroy))),
send(E, above(D1)),
send(D1, above(D2)),
send(D2, above(D3)),
send(G, append, E),
send(G, open_centered).

% ------------------------------------------------------------------------
% Criao do Menu Financeiro

menuFinanceiro:-
new(G,frame('Menu Financeiro - Video Locadora')),

new(E, dialog),
new(D1, dialog),
new(D2, dialog),
new(D3, dialog),
send(E, append, button('Cadastrar Caixa Inicial', message(@prolog, cadastroCaixaInicial))),
send(E, append, button('Cadastrar Sangria', message(@prolog, cadastroSangria))),
send(E, append, button('Consultar Sangria', message(@prolog, consultaSangria))),
send(E, append, button('Alterar Sangria',message(@prolog, alteraSangria))),
send(E, append, button('Remover Sangria',message(@prolog, removeSangria))),
send(D1, append, button('Cadastar Despesa', message(@prolog, cadastroDespesa))),
send(D1, append, button('Consultar Despesa',message(@prolog, consultaDespesa))),
send(D1, append, button('Alterar Despesa',message(@prolog, menuAlteraDespesa))),
send(D1, append, button('Remover Despesa',message(@prolog, removeDespesa))),
send(D2, append, button('Cadastar Caixa', message(@prolog, cadastroCaixa))),
send(D2, append, button('Consultar Caixa',message(@prolog, consultaCaixa))),
send(D2, append, button('Alterar Caixa',message(@prolog, alteraCaixa))),
send(D2, append, button('Remover Caixa',message(@prolog, removeCaixa))),
%send(D3, append, button(ok,message(@prolog, salvarCliente))),
send(D3, append, button(fechar, message(G,destroy))),
send(E, above(D1)),
send(D1, above(D2)),
send(D2, above(D3)),
send(G, append, E),
send(G, open_centered).


cadastroClientes:-
	new(G, frame('Cadastro do Cliente- Video Locadora')),
	new(D1, dialog),
	new(D2, dialog),
	new(D3, dialog),
	new(D4, dialog),
	new(D5, dialog),
	new(D6, dialog),
	new(D7, dialog),
	new(D8, dialog),
	new(D9, dialog),
	new(D10, dialog),
	new(D11, dialog),
	new(D12, dialog),
	new(D13, dialog),
	new(D14, dialog),
	new(D15, dialog),
	new(D16, dialog),
	new(D17, dialog),
	new(D18, dialog),
	new(E, dialog),
	new(F,dialog),
	new(S, size(33,33)),
	new(C1, text_item('Nome do cliente')),
	send(D1, append(C1)),
	new(C2, text_item('Endereco')),
	send(D2, append(C2)),
	new(C3, text_item('Complemento')),
	send(D3, append(C3)),
	send(D3, right, D2),
	new(C4, text_item('Cidade')),
	send(D4, append(C4)),
	send(D4, right, D3),
	new(C5, text_item('Telefone Residencial')),
	send(D5, append(C5)),
	new(C6, text_item('Telefone Celular')),
	send(D6, append(C6)),
	send(D6, right, D5),
	new(C7, text_item('Estado Civil')),
	send(D7, append(C7)),
	new(C8, text_item('RG')),
	send(D8, append(C8)),
	send(D8, right, D7),
	new(C9, text_item('CPF')),
	send(D9, append(C9)),
	send(D9, right, D8),
	new(C10, text_item('Data de Nascimento')),
	send(D10, append(C10)),
	send(D10, right, D9),
	new(C11, text_item('Nome da Mae')),
	send(D11, append(C11)),
	new(C12, text_item('Nome do Pai')),
	send(D12, append(C12)),
	send(D12, right, D11),
	new(C13, text_item('Sexo')),
	send(D13, append(C13)),
	new(C14, text_item('E-mail')),
	send(D14, append(C14)),
	send(D14, right, D13),
	new(C15, text_item('Referencia Comercial')),
	send(D15, append(C15)),
	send(D15, right, D14),
	new(C16, text_item('Data do Cadastro')),
	send(D16, append(C16)),
	new(C17, text_item('Status')),
	send(D17, append(C17)),
	send(D17, right, D16),
	new(C18, text_item('Codigo do Funcionario')),
	send(D18, append(C18)),
	send(D18, right, D17),
	send(E, append, button(gravar,message(@prolog, inserirCliente,C1?selection,C2?selection,C3?selection,C4?selection,C5?selection,
	       C6?selection,C7?selection,C8?selection,C9?selection,C10?selection,C11?selection,C12?selection,C13?selection,
	       C14?selection,C15?selection,C16?selection,C17?selection,C18?selection))),
	send(F, right, D1),
	send(E, append, button(fechar, message(G,destroy))),
	send(D1, above(D2)),
	send(E, right, F),
	send(F, size(S)),
	send(D2, above(D6)),
	send(D6, above(D10)),
	send(D10, above(D11)),
	send(D11, above(D15)),
	send(D15, above(D16)),
	send(G, append, D1),
	send(G, open_centered).


inserirCliente(C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,C16,C17,C18):-
%	consult('cliente.pl'),
	contador_cliente(X),
	assert(cliente(X,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,C16,C17,C18)),
	tell('cliente.pl'),
	listing(cliente),
	told.
consultarClientes:-
%	consult('cliente.pl'),
	findall(Codigo,cliente(Codigo,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_),LA),
	findall(Nome,cliente(_,Nome,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_),LB),
	findall(Endereco,cliente(_,_,Endereco,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_),LC),
	findall(Complemento,cliente(_,_,_,Complemento,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_),LD),
	findall(Cidade,cliente(_,_,_,_,Cidade,_,_,_,_,_,_,_,_,_,_,_,_,_,_),LE),
	findall(Telefone,cliente(_,_,_,_,_,Telefone,_,_,_,_,_,_,_,_,_,_,_,_,_),LF),
	findall(Celular,cliente(_,_,_,_,_,_,Celular,_,_,_,_,_,_,_,_,_,_,_,_),LG),
	findall(EstadoCivil,cliente(_,_,_,_,_,_,_,EstadoCivil,_,_,_,_,_,_,_,_,_,_,_),LH),
	findall(RG,cliente(_,_,_,_,_,_,_,_,RG,_,_,_,_,_,_,_,_,_,_),LI),
	findall(CPF,cliente(_,_,_,_,_,_,_,_,_,CPF,_,_,_,_,_,_,_,_,_),LJ),
	findall(Nascimento,cliente(_,_,_,_,_,_,_,_,_,_,Nascimento,_,_,_,_,_,_,_,_),LK),
	findall(Status,cliente(_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,Status,_),LL),
	new(P,picture('Generos')),
	send(P,display,new(T,tabular)),
	send(T,border,1),
	send(T,cell_spacing,-1),
	send(T,rules,all),
	send_list(T,
		  [append('Codigo',bold,center,colspan :=1),
		   append('Nome',bold,center,colspan :=1),
		   append('Endereco',bold,center,colspan :=1),
		   append('Complemento',bold,center,colspan :=1),
		   append('Cidade',bold,center,colspan :=1),
		   append('Telefone',bold,center,colspan :=1),
		   append('Celular',bold,center,colspan :=1),
		   append('EstadoCivil',bold,center,colspan :=1),
		   append('RG',bold,center,colspan :=1),
		   append('CPF',bold,center,colspan :=1),
		   append('Nacimento',bold,center,colspan :=1),
		   append('Status',bold,center,colspan := 1)]),
	preencheTabelaCliente(LA,LB,LC,LD,LE,LF,LG,LH,LI,LJ,LK,LL,T),
	send(P,open).

preencheTabelaCliente([],[],[],[],[],[],[],[],[],[],[],[],_).
preencheTabelaCliente([LA|LAs],[LB|LBs],[LC|LCs],[LD|LDs],[LE|LEs],[LF|LFs],[LG|LGs],[LH|LHs],[LI|LIs],[LJ|LJs],[LK|LKs],[LL|LLs],T):-
	send_list(T,[next_row,append(LA),append(LB),append(LC),append(LD),append(LE),append(LF),append(LG),append(LH),append(LI),append(LJ),append(LK),append(LL)]),
	preencheTabelaCliente(LAs,LBs,LCs,LDs,LEs,LFs,LGs,LHs,LIs,LJs,LKs,LLs,T).






retornaCliente(C1):-
	consult('cliente.pl'),
	new(X,frame('DADOS DO CLIENTE')),
	new(D1,dialog),
	cliente(C1,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_),
	setof(C1,cliente(C1,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),T),
       	setof(B,cliente(C1,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),U),
	setof(C,cliente(C1,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),V),
	setof(D,cliente(C1,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),W),
	setof(E,cliente(C1,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),Y),
	setof(F,cliente(C1,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),Z),
	setof(G,cliente(C1,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),A),
	setof(H,cliente(C1,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),AA),
	setof(I,cliente(C1,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),AB),
	setof(J,cliente(C1,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),AC),
	setof(K,cliente(C1,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),AD),
	setof(L,cliente(C1,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),AE),
	setof(M,cliente(C1,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),AF),
	setof(N,cliente(C1,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),AG),
	setof(O,cliente(C1,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),AH),
	setof(P,cliente(C1,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),AI),
	setof(Q,cliente(C1,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),AJ),
	setof(R,cliente(C1,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),AK),
	setof(S,cliente(C1,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),AL),
	send(D1,text_item('Codigo')),
	send(D1,append,text(T)),
       	send(D1,text_item('Nome')),
	send(D1,append,text(U)),
	send(D1,text_item('Endereco')),
	send(D1,append,text(V)),
	send(D1,text_item('Complemento')),
      	send(D1,append,text(W)),
	send(D1,text_item('Cidade')),
	send(D1,append,text(Y)),
	send(D1,text_item('Telefone')),
	send(D1,append,text(Z)),
	send(D1,text_item('Celular')),
	send(D1,append,text(A)),
	send(D1,text_item('Estado Civil')),
	send(D1,append,text(AA)),
	send(D1,text_item('RG')),
	send(D1,append,text(AB)),
	send(D1,text_item('CPF')),
	send(D1,append,text(AC)),
	send(D1,text_item('Data Nascimento')),
	send(D1,append,text(AD)),
	send(D1,text_item('Mae')),
	send(D1,append,text(AE)),
	send(D1,text_item('Pai')),
	send(D1,append,text(AF)),
	send(D1,text_item('Sexo')),
	send(D1,append,text(AG)),
	send(D1,text_item('Email')),
	send(D1,append,text(AH)),
	send(D1,text_item('Pai')),
	send(D1,append,text(AI)),
	send(D1,text_item('Ref Com')),
	send(D1,append,text(AJ)),
	send(D1,text_item('Data cadastro')),
	send(D1,append,text(AK)),
	send(D1,text_item('Status')),
	send(D1,append,text(AL)),
	send(D1,text_item('Cod Func')),
       	send(X, append, D1),
	send(X, open_centered),
	send(X,open).


removeClientes:-
	new(G, frame('Remover Clientes - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Codigo do Cliente')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, excluirCliente,C1?selection))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

excluirCliente(C1):-
	consult('cliente.pl'),
       	cliente(C1,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S),
	retractall(cliente(C1,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S)),
       	tell('cliente.pl'),
	listing(cliente),
	told.



cadastroDependente:-
	new(G, frame('Cadastro de Dependente - Video Locadora')),
	new(D1, dialog),
	new(D2, dialog),
	new(D3, dialog),
	new(D4, dialog),
	%new(D5, dialog),
	%new(D6, dialog),
	%new(D7, dialog),

	new(E, dialog),

	new(C1, text_item('Codigo do Cliente')),
	send(D1, append(C1)),
	new(C2, text_item('Nome do Dependente')),
	send(D2, append(C2)),
	send(D2, right, D1),
	new(C3, text_item('Descricao do Dependente')),
	send(D3, append(C3)),
	new(C4, text_item('Status')),
	send(D4, append(C4)),
	send(D4, right, D3),
	send(E, append, button(gravar,message(@prolog, inserirDependente,C1?selection,C2?selection,C3?selection,C4?selection))),
	send(E, append, button(fechar, message(G,destroy))),
	send(D1, above(D3)),
	send(E, right, D4),
	send(G, append, D1),
	send(G, open_centered).

consultaDependente:-
	new(G, frame('Consulta de Dependente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Codigo do Dependente')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

inserirDependente(C1,C2,C3,C4):-
	consult('dependente.pl'),
	contador_dependente(X),
	assert(dependente(X,C1,C2,C3,C4)),
	tell('dependente.pl'),
	listing(dependente),
	told.

removeDependente:-
	new(G, frame('Remover Dependente - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Codigo do Dependente')),
	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

cadastroEmpresa:-
	new(G, frame('Cadastro da Empresa- Video Locadora')),
	new(D1, dialog),
	new(D2, dialog),
	new(D3, dialog),
	new(D4, dialog),
	new(D5, dialog),
	new(D6, dialog),
	new(D7, dialog),
	new(D8, dialog),
	new(D9, dialog),
	new(D10, dialog),
	new(D11, dialog),
	new(E, dialog),
	new(F,dialog),
	new(S, size(33,33)),
	new(C1, text_item('Nome da Empresa')),
	send(D1, append(C1)),
	new(C2, text_item('Endereco')),
	send(D2, append(C2)),
	new(C3, text_item('Complemento')),
	send(D3, append(C3)),
	send(D3, right, D2),
	new(C4, text_item('Cidade')),
	send(D4, append(C4)),
	send(D4, right, D3),
	new(C5, text_item('Telefone Comercial')),
	send(D5, append(C5)),
	new(C6, text_item('FAX')),
	send(D6, append(C6)),
	send(D6, right, D5),
	new(C7, text_item('Cgc')),
	send(D7, append(C7)),
	new(C8, text_item('CEP')),
	send(D8, append(C8)),
	send(D8, right, D7),
	new(C9, text_item('E-mail')),
	send(D9, append(C9)),
	send(D10, right, D9),
	new(C11, text_item('Status')),
	send(D11, append(C11)),
	send(D11, right, D10),
	send(E, append, button(gravar,message(@prolog, inserirEmpresa,C1?selection,C2?selection,C3?selection,C4?selection,
	    C5?selection,C6?selection,C7?selection,C8?selection,C9?selection,C11?selection))),
	send(F, right, D1),
	send(E, append, button(fechar, message(G,destroy))),
	send(D1, above(D2)),
	send(E, right, F),
	send(F, size(S)),
	send(D2, above(D5)),
	send(D5, above(D7)),
	send(D7, above(D11)),
	send(G, append, D1),
	send(G, open_centered).


inserirEmpresa(C1,C2,C3,C4,C5,C6,C7,C8,C9,C11):-
	consult('empresa.pl'),
	contador_empresa(X),
	assert(empresa(X,C1,C2,C3,C4,C5,C6,C7,C8,C9,C11)),
	tell('empresa.pl'),
	listing(empresa),
	told.





consultaEmpresa:-
	consult('empresa.pl'),
	findall(Codigo,empresa(Codigo,_,_,_,_,_,_,_,_,_,_),LA),
	findall(Nome,empresa(_,Nome,_,_,_,_,_,_,_,_,_),LB),
	findall(Endereco,empresa(_,_,Endereco,_,_,_,_,_,_,_,_),LC),
	findall(Complemento,empresa(_,_,_,Complemento,_,_,_,_,_,_,_),LD),
	findall(Cidade,empresa(_,_,_,_,Cidade,_,_,_,_,_,_),LE),
	findall(Telefone,empresa(_,_,_,_,_,Telefone,_,_,_,_,_),LF),
	findall(FAX,empresa(_,_,_,_,_,_,FAX,_,_,_,_),LG),
	findall(CGC,empresa(_,_,_,_,_,_,_,CGC,_,_,_),LH),
	findall(CEP,empresa(_,_,_,_,_,_,_,_,CEP,_,_),LI),
	findall(Email,empresa(_,_,_,_,_,_,_,_,_,Email,_),LJ),
	findall(Status,empresa(_,_,_,_,_,_,_,_,_,_,Status),LK),
	new(P,picture('Empresas')),
	send(P,display,new(T,tabular)),
	send(T,border,1),
	send(T,cell_spacing,-1),
	send(T,rules,all),
	send_list(T,
		  [append('Codigo',bold,center,colspan :=1),
		   append('Nome',bold,center,colspan :=1),
		   append('Endereco',bold,center,colspan :=1),
		   append('Complemento',bold,center,colspan :=1),
		   append('Cidade',bold,center,colspan :=1),
		   append('Telefone',bold,center,colspan :=1),
		   append('FAX',bold,center,colspan :=1),
		   append('CGC',bold,center,colspan :=1),
		   append('CEP',bold,center,colspan :=1),
		   append('E-mail',bold,center,colspan :=1),
		   append('Status',bold,center,colspan := 1)]),
	preencheTabelaEmpresa(LA,LB,LC,LD,LE,LF,LG,LH,LI,LJ,LK,T),
	send(P,open).

preencheTabelaEmpresa([],[],[],[],[],[],[],[],[],[],[],[],_).
preencheTabelaEmpresa([LA|LAs],[LB|LBs],[LC|LCs],[LD|LDs],[LE|LEs],[LF|LFs],[LG|LGs],[LH|LHs],[LI|LIs],[LJ|LJs],[LK|LKs],T):-
	send_list(T,[next_row,append(LA),append(LB),append(LC),append(LD),append(LE),append(LF),append(LG),append(LH),append(LI),append(LJ),append(LK)]),
	preencheTabelaEmpresa(LAs,LBs,LCs,LDs,LEs,LFs,LGs,LHs,LIs,LJs,LKs,T).


removeEmpresa:-
	new(G, frame('Remover Empresa - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Codigo da Empresa')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, excluirEmpresa,C1?selecion))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

excluirEmpresa(C1):-
	consult('empresa.pl'),
	empresa(C1,A,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11),
	retractall(empresa(C1,A,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11)),
	tell('empresa.pl'),
	listing(empresa),
	told.

menuAlteraEmpresa:-
	new(G,frame('Menu Altera Empresa - Video Locadora')),
	%new(MenuD, dialog),
	new(E, dialog),
	new(D1, dialog),
	new(D2, dialog),
	%new(D3, dialog),
	send(E, append, button('Altera Nome', message(@prolog, menualteraNomeEmpresa))),
	send(E, append, button('Altera Endereco', message(@prolog, menualteraEnderecoEmpresa))),
	send(E, append, button('Altera Complemento',message(@prolog, menualteraComplementoEmpresa))),
	send(E, append, button('Altera CEP',message(@prolog, menualteraCEPEmpresa))),
	send(E, append, button('Altera Telefone', message(@prolog, menualteraTelefoneEmpresa))),
	send(D1, append, button('Altera FAX',message(@prolog, menualteraFAXEmpresa))),
	send(D1, append, button('Altera CGC',message(@prolog, menualteraCGCEmpresa))),
	send(D1, append, button('Altera E-mail',message(@prolog, menualteraEmailEmpresa))),
       	send(D1, append, button('Altera Status',message(@prolog, menualteraStatusEmpresa))),
	%send(D2, append, button(ok,message(@prolog, salvarCliente))),
	send(D2, append, button(fechar, message(G,destroy))),
	%send(E, append, text('Teste de funcao de botao')),
	%send(E, append, button(ok,message(G,destroy))),
	send(D2, right, D1),
	send(E, above(D1)),
	%send(D1, above(D2)),
	%send(D2, above(D3)),
	send(G, append, E),
	send(G, open_centered).


menualteraNomeEmpresa:-
	new(G, frame('Alterar Empresa - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID da Empresa')),
	send(D1, append, C1),
	new(C2, text_item('Novo nome da Empresa')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraNomeEmpresa,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


menualteraEnderecoEmpresa:-
	new(G, frame('Alterar Empresa - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID da Empresa')),
	send(D1, append, C1),
	new(C2, text_item('Novo endereco da Empresa')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraEnderecoEmpresa,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraComplementoEmpresa:-
	new(G, frame('Alterar Empresa - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID da Empresa')),
	send(D1, append, C1),
	new(C2, text_item('Novo complemento da Empresa')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraComplementoEmpresa,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraCEPEmpresa:-
	new(G, frame('Alterar Empresa - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID da Empresa')),
	send(D1, append, C1),
	new(C2, text_item('Novo CEP da Empresa')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraCEPEmpresa,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraTelefoneEmpresa:-
	new(G, frame('Alterar Empresa - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID da Empresa')),
	send(D1, append, C1),
	new(C2, text_item('Novo telefone da Empresa')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraTelefoneEmpresa,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraFAXEmpresa:-
	new(G, frame('Alterar Empresa - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID da Empresa')),
	send(D1, append, C1),
	new(C2, text_item('Novo FAX da Empresa')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraFAXEmpresa,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraCGCEmpresa:-
	new(G, frame('Alterar Empresa - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID da Empresa')),
	send(D1, append, C1),
	new(C2, text_item('Novo CGC da Empresa')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraCGCEmpresa,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraEmailEmpresa:-
	new(G, frame('Alterar Empresa - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID da Empresa')),
	send(D1, append, C1),
	new(C2, text_item('Novo e-mail da Empresa')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraEmailEmpresa,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraStatusEmpresa:-
	new(G, frame('Alterar Empresa - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID da Empresa')),
	send(D1, append, C1),
	new(C2, text_item('Novo Status da Empresa')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraStatusEmpresa,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


alteraNomeEmpresa(C1,C2):-
	consult('empresa.pl'),
	empresa(C1,_,B,C,D,E,F,G,H,I,J),
	retract(empresa(C1,_,_,_,_,_,_,_,_,_,_)),
	assert(empresa(C1,C2,B,C,D,E,F,G,H,I,J)),
	tell('empresa.pl'),
	listing(empresa),
	told.

alteraEnderecoEmpresa(C1,C2):-
	consult('empresa.pl'),
	empresa(C1,A,_,C,D,E,F,G,H,I,J),
	retract(empresa(C1,_,_,_,_,_,_,_,_,_,_)),
	assert(empresa(C1,A,C2,C,D,E,F,G,H,I,J)),
	tell('empresa.pl'),
	listing(empresa),
	told.

alteraComplementoEmpresa(C1,C2):-
	consult('empresa.pl'),
	empresa(C1,A,B,_,D,E,F,G,H,I,J,K),
	retract(empresa(C1,_,_,_,_,_,_,_,_,_,_,_)),
	assert(empresa(C1,A,B,C2,D,E,F,G,H,I,J,K)),
	tell('empresa.pl'),
	listing(empresa),
	told.

alteraCidadeEmpresa(C1,C2):-
	consult('empresa.pl'),
	empresa(C1,A,B,C,_,E,F,G,H,I,J),
	retract(empresa(C1,_,_,_,_,_,_,_,_,_,_)),
	assert(empresa(C1,A,B,C,C2,E,F,G,H,I,J)),
	tell('empresa.pl'),
	listing(empresa),
	told.


alteraTelefoneEmpresa(C1,C2):-
	consult('empresa.pl'),
	empresa(C1,A,B,C,D,_,F,G,H,I,J),
	retract(empresa(C1,_,_,_,_,_,_,_,_,_,_)),
	assert(empresa(C1,A,B,C,D,C2,F,G,H,I,J)),
	tell('empresa.pl'),
	listing(empresa),
	told.

alteraFAXEmpresa(C1,C2):-
	consult('empresa.pl'),
	empresa(C1,A,B,C,D,E,_,G,H,I,J),
	retract(empresa(C1,_,_,_,_,_,_,_,_,_,_)),
	assert(empresa(C1,A,B,C,D,E,C2,G,H,I,J)),
	tell('empresa.pl'),
	listing(empresa),
	told.

alteraCGCEmpresa(C1,C2):-
	consult('empresa.pl'),
	empresa(C1,A,B,C,D,E,F,_,H,I,J),
	retract(empresa(C1,_,_,_,_,_,_,_,_,_,_)),
	assert(empresa(C1,A,B,C,D,E,F,C2,H,I,J)),
	tell('empresa.pl'),
	listing(empresa),
	told.

alteraCEPEmpresa(C1,C2):-
	consult('empresa.pl'),
	empresa(C1,A,B,C,D,E,F,G,_,I,J),
	retract(empresa(C1,_,_,_,_,_,_,_,_,_,_)),
	assert(empresa(C1,A,B,C,D,E,F,G,C2,I,J)),
	tell('empresa.pl'),
	listing(empresa),
	told.

alteraEmailEmpresa(C1,C2):-
	consult('empresa.pl'),
	empresa(C1,A,B,C,D,E,F,G,H,_,J),
	retract(empresa(C1,_,_,_,_,_,_,_,_,_,_)),
	assert(empresa(C1,A,B,C,D,E,F,G,H,C2,J)),
	tell('empresa.pl'),
	listing(empresa),
	told.

alteraStatusEmpresa(C1,C2):-
	consult('empresa.pl'),
	empresa(C1,A,B,C,D,E,F,G,H,I,_),
	retract(empresa(C1,_,_,_,_,_,_,_,_,_,_)),
	assert(empresa(C1,A,B,C,D,E,F,G,H,I,C2)),
	tell('empresa.pl'),
	listing(empresa),
	told.


cadastroFornecedor:-
	new(G, frame('Cadastro de Fornecedor - Video Locadora')),
	new(D1, dialog),
	new(D2, dialog),
	new(D3, dialog),
	new(D4, dialog),
	new(D5, dialog),
	new(D6, dialog),
	new(D7, dialog),
	new(D8, dialog),
	new(D9, dialog),
	new(D10, dialog),
	new(D11, dialog),
	new(D12, dialog),
	new(D13, dialog),
	new(E, dialog),
	new(F,dialog),
	new(S, size(33,33)),
	new(C1, text_item('Nome do Fornecedor')),
	send(D1, append(C1)),
	new(C2, text_item('Data')),
	send(D2, append(C2)),
	new(C3, text_item('Razao Social')),
	send(D3, append(C3)),
	send(D3, right, D2),
	new(C4, text_item('Endereco')),
	send(D4, append(C4)),
	send(D4, right, D3),
	new(C5, text_item('Cidade')),
	send(D5, append(C5)),
	new(C6, text_item('CEP')),
	send(D6, append(C6)),
	send(D6, right, D5),
	new(C7, text_item('Telefone')),
	send(D7, append(C7)),
	new(C8, text_item('FAX')),
	send(D8, append(C8)),
	send(D8, right, D7),
	new(C9, text_item('Cgc')),
	send(D9, append(C9)),
	send(D9, right, D8),
	new(C10, text_item('Email')),
	send(D10, append(C10)),
	send(D10, right, D9),
	new(C11, text_item('Contato')),
	send(D11, append(C11)),
	new(C12, text_item('Status')),
	send(D12, append(C12)),
	send(D12, right, D11),
	new(C13, text_item('Telefone de Contato')),
	send(D13, append(C13)),
	send(D13, right , D12),
	send(E, append, button(gravar,message(@prolog, inserirFornecedor,C1?selection,C2?selection,C3?selection,C4?selection,C5?selection,
	       C6?selection,C7?selection,C8?selection,C9?selection,C10?selection,C11?selection,C12?selection,C13?selection
	       ))),
	send(F, right, D1),
	send(E, append, button(fechar, message(G,destroy))),
	send(D1, above(D2)),
	send(E, right, F),
	send(F, size(S)),
	send(D2, above(D5)),
	send(D5, above(D7)),
	send(D7, above(D11)),
	%send(D11, above(D15)),
	%send(D15, above(D16)),
	send(G, append, D1),
	send(G, open_centered).



inserirFornecedor(C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13):-
	consult('fornecedor.pl'),
	contador_fornecedor(X),
	assert(fornecedor(X,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13)),
	tell('fornecedor.pl'),
	listing(fornecedor),
	told.

consultaFornecedor:-
	new(G, frame('Consulta de Fornecedor - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Codigo do Fornecedor')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


removeFornecedor:-
	new(G, frame('Remover Fornecedor - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Codigo do Fornecedor')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, excluirFornecedor,C1?selection))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).
excluirFornecedor(C1):-
	consult('fornecedor.pl'),
	fornecedor(C1,A,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13),
	retractall(fornecedor(C1,A,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13)),
	tell('fornecedor.pl'),
	listing(fornecedor),
	told.


cadastroFuncionario:-
	new(G, frame('Cadastro de Funcionarios- Video Locadora')),
	new(D1, dialog),
	new(D2, dialog),
	new(D3, dialog),
	new(D4, dialog),
	new(D5, dialog),
	new(D6, dialog),
	new(D7, dialog),
	new(D8, dialog),
	new(D9, dialog),
	new(D10, dialog),
	new(D11, dialog),
	new(D12, dialog),
	new(D13, dialog),
	new(E, dialog),
	new(F,dialog),
	new(S, size(33,33)),
	new(C1, text_item('Nome do Funcionario')),
	send(D1, append(C1)),
	new(C2, text_item('Endereco')),
	send(D2, append(C2)),
	new(C3, text_item('Cidade')),
	send(D3, append(C3)),
	send(D3, right, D2),
	new(C4, text_item('Telefone')),
	send(D4, append(C4)),
	send(D4, right, D3),
	new(C5, text_item('CEP')),
	send(D5, append(C5)),
	new(C6, text_item('Celular')),
	send(D6, append(C6)),
	send(D6, right, D5),
	new(C7, text_item('Nascimento')),
	send(D7, append(C7)),
	new(C8, text_item('Admissao')),
	send(D8, append(C8)),
	send(D8, right, D7),
	new(C9, text_item('RG')),
	send(D9, append(C9)),
	send(D9, right, D8),
	new(C10, text_item('CPF')),
	send(D10, append(C10)),
	send(D10, right, D9),
	new(C11, text_item('E-mail')),
	send(D11, append(C11)),
	new(C12, text_item('Status')),
	send(D12, append(C12)),
	send(D12, right, D11),
	new(C13, text_item('Login')),
	send(D13, append(C13)),
	send(D13, right , D12),
	send(E, append, button(gravar,message(@prolog, inserirFornecedor,C1?selection,C2?selection,C3?selection,C4?selection,C5?selection,
	       C6?selection,C7?selection,C8?selection,C9?selection,C10?selection,C11?selection,C12?selection,C13?selection
	       ))),
	send(F, right, D1),
	send(E, append, button(fechar, message(G,destroy))),
	send(D1, above(D2)),
	send(E, right, F),
	send(F, size(S)),
	send(D2, above(D5)),
	send(D5, above(D7)),
	send(D7, above(D11)),
	%send(D11, above(D15)),
	%send(D15, above(D16)),
	send(G, append, D1),
	send(G, open_centered).

inserirFuncionario(C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13):-
	consult('funcionario.pl'),
	contador_funcionario(X),
	assert(funcionario(X,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13)),
	tell('funcionario.pl'),
	listing(funcionario),
	told.

consultaFuncionario:-
	new(G, frame('Consulta de Fornecedor - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo do Fornecedor')),
	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


alteraFuncionario:-
	new(G, frame('Alterar Funcionrio - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo do Funcinrio')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

removeFuncionario:-
	new(G, frame('Remover Funcionario - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Codigo do Funcionario')),
	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, excluirFuncionario,C1?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

exluirFuncionario(C1):-
	consult('funcionario.pl'),
	funcionario(C1,A,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13),
	retractall(funcionario(C1,A,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13)),
	tell('funcionario.pl'),
	listing(funcionario),
	told.
cadastroContasPa:-
	new(G, frame('Cadastro de Contas a Pagar- Video Locadora')),
	new(D1, dialog),
	new(D2, dialog),
	new(D3, dialog),
	%new(D4, dialog),
	%new(D5, dialog),
	new(E, dialog),
	new(F,dialog),
	new(S, size(252,33)),
	new(C1, text_item('Codigo do fornecedor')),
	send(D1, append(C1)),
	new(C2, text_item('Data de vencimento')),
	send(D2, append(C2)),
	new(C3, text_item('Status')),
	send(D3, append(C3)),
	send(D3, right, D2),
	new(C4, text_item('Valor')),
	send(F, append(C4)),
	%send(D4, right, D3),
		send(E, append, button(gravar,message(@prolog, inserirContasP,C1?selection,C2?selection,C3?selection,C4?selection))),
	send(F, right, D1),
	send(E, append, button(fechar, message(G,destroy))),
	send(D1, above(D2)),
	send(E, right, F),
	send(F, size(S)),
	%send(D2, above(D3)),
	%send(D3, above(D4)),
	%send(D10, above(D11)),
%	send(D11, above(D15)),
	%send(D15, above()),
	send(G, append, D1),
	send(G, open_centered).


inserirContasP(C1,C2,C3,C4):-
	consult('conta_pagar.pl'),
	contador_contapagar(X),
	assert(conta_pagar(X,C1,C2,C3,C4)),
	tell('conta_pagar.pl'),
	listing(conta_pagar),
	told.


consultaContasPa:-
	new(G, frame('Consulta de Contas a Pagar - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Codigo do conta')),
	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


alteraContasPa:-
	new(G, frame('Alterar Contas a Pagar - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Codigo da Conta')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

removeContasPa:-
	new(G, frame('Remover Contas a Pagar - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Codigo da Conta')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, excluirContasPa,C1?selection))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

excluirContasPa(C1):-
	consult('conta_pagar.pl'),
	conta_pagar(X,C1,C2,C3,C4),
	retractall(conta_pagar(X,C1,C2,C3,C4)),
	tell('conta_pagar.pl'),
	listing(conta_pagar),
	told.


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% cadastro das informaes do cliente - ligao com a base de dados

cadastroContasRe:-
	new(G, frame('Cadastro de Contas  Receber- Video Locadora')),
	new(D1, dialog),
	new(D2, dialog),
	new(D3, dialog),
	new(D4, dialog),
	new(D5, dialog),

	new(E, dialog),
	new(F,dialog),
	new(S, size(252,33)),
	new(C1, text_item('Cdigo da locao')),
	send(D1, append(C1)),
	new(C2, text_item('Data de vencimento')),
	send(D2, append(C2)),
	new(C3, text_item('Desconto')),
	send(D3, append(C3)),
	send(D3, right, D2),
	new(C4, text_item('Valor')),
	send(F, append(C4)),
	new(C5, text_item('Status do Pagamento')),
	send(D4, append(C5)),
	%send(D3, right, D2),
	new(C6, text_item('Status')),
	send(D5, append(C6)),
	send(D5, right, D4),

	send(E, append, button(gravar,message(@prolog, inserirCReceber,C1?selection,C2?selection,C3?selection,C4?selection,C5?selection,C6?selection))),
	send(F, right, D1),
	send(E, append, button(fechar, message(G,destroy))),
	send(D1, above(D2)),
	send(E, right, F),
	send(F, size(S)),
	send(D3, above(D5)),
	%send(D3, above(D4)),
	%send(D10, above(D11)),
%	send(D11, above(D15)),
	%send(D15, above()),
	send(G, append, D1),
	send(G, open_centered).


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% funo que insere as informaes enviados da funo casdastroCReceber


inserirCReceber(C1,C2,C3,C4,C5,C6):-
	consult('contasreceber.pl'),
	assert(contasreceber(C1,C2,C3,C4,C5,C6)),
	tell('contasreceber.pl'),
	listing(contasreceber),
	told.

consultaContasRe:-
	new(G, frame('Consulta de Contas  Receber - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo da Conta')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% altera Contas  Receber

alteraContasRe:-
	new(G, frame('Alterar Contas  Receber - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo da Conta')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

removeContasRe:-
	new(G, frame('Remover Contas  Receber - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo da Conta')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).



% ------------------------------------------------------------------------
% -----------------------------------------------------------------------
%

cadastroReserva:-
	new(G, frame('Cadastro da Reserva - Video Locadora')),
	new(D1, dialog),
	new(D2, dialog),
	new(D3, dialog),
	new(D4, dialog),
	new(D5, dialog),
	new(D6, dialog),
	new(D7, dialog),

	new(E, dialog),

	new(C1, text_item('Cdigo do Cliente')),
	send(D1, append(C1)),
	new(C2, text_item('Cdigo do Filme')),
	send(D2, append(C2)),
	send(D2, right, D1),
	new(C3, text_item('Res_XXX')),
	send(D3, append(C3)),
	new(C4, text_item('Status')),
	send(D7, append(C4)),
	send(D7, right, D3),
	new(C5, text_item('Data')),
	send(D4, append(C5)),

	new(C6, text_item('Dependente')),
	send(D5, append(C6)),
	send(D5, right, D4),
	new(C7, text_item('Cdigo do Funcionrio')),
	send(D6, append(C7)),
	send(D6, right, D2),

	send(E, append, button(gravar,message(@prolog, inserirReserva,C1?selection,C2?selection,C3?selection,C4?selection,C5?selection,C6?selection,C7?selection))),

	send(E, append, button(fechar, message(G,destroy))),
	send(D1, above(D3)),
	send(E, right, D6),

	send(D3, above(D4)),
	send(G, append, D1),
	send(G, open_centered).


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% funo que insere as informaes enviados da funo casdastroReserva


inserirReserva(C1,C2,C3,C4,C5,C6,C7):-
	consult('reserva.pl'),
	assert(reserva(C1,C2,C3,C4,C5,C6,C7)),
	tell('reserva.pl'),
	dynamic(reserva/7),
	listing(reserva),
	told.

consultaReserva:-
	new(G, frame('Consulta da Reserva - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo da Reserva')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% altera Reservar

alteraReserva:-
	new(G, frame('Alterar Reserva - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo da Reserva')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

removeReserva:-
	new(G, frame('Remover Reserva - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo da Reserva')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


% ------------------------------------------------------------------------
% -----------------------------------------------------------------------

cadastroLocacao:-
	new(G, frame('Cadastro da Locao - Video Locadora')),
	new(D1, dialog),
	new(D2, dialog),
	new(D3, dialog),
	new(D4, dialog),
	%new(D5, dialog),
	%new(D6, dialog),
	new(D7, dialog),

	new(E, dialog),

	new(C1, text_item('Codigo do Funcionario')),
	send(D1, append(C1)),
	new(C2, text_item('Codigo do Cliente')),
	send(D2, append(C2)),
	send(D2, right, D1),
	new(C3, text_item('Dependente')),
	send(D3, append(C3)),
	new(C4, text_item('Data do Aluguel')),
	send(D7, append(C4)),
	send(D7, right, D3),
	new(C5, text_item('Status')),
	send(D4, append(C5)),
	send(D4, right, D7),


	send(E, append, button(gravar,message(@prolog, inserirLocacao,C1?selection,C2?selection,C3?selection,C4?selection,C5?selection))),

	send(E, append, button(fechar, message(G,destroy))),
	send(D1, above(D3)),
	send(E, right, D7),

	%send(D3, above(D4)),
	send(G, append, D1),
	send(G, open_centered).


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% funo que insere as informaes enviados da funo casdastroLocao


inserirLocacao(C1,C2,C3,C4,C5):-
	consult('locacao.pl'),
	contador_locacao(X),
	assert(locacao(X,C1,C2,C3,C4,C5)),
	tell('locacao.pl'),
	listing(locacao),
	told.


consultaLocacao:-
	new(G, frame('Consulta de Locao - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo da Locao')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% altera os Locao

alteraLocacao:-
	new(G, frame('Alterar Locao - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo da Locao')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


removeLocacao:-
	new(G, frame('Remover Locao - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo da Locao')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


% ------------------------------------------------------------------------
% -----------------------------------------------------------------------

cadastroItem:-
	new(G, frame('Cadastro do Item - Video Locadora')),
	new(D1, dialog),
	new(D2, dialog),
	new(D3, dialog),
	new(D4, dialog),
	%new(D5, dialog),
	%new(D6, dialog),
	new(D7, dialog),

	new(E, dialog),

	new(C1, text_item('Cdigo do Exemplar')),
	send(D1, append(C1)),
	new(C2, text_item('Data da devoluo')),
	send(D2, append(C2)),
	send(D2, right, D1),
	new(C3, text_item('Status da Devoluo')),
	send(D3, append(C3)),
	new(C4, text_item('Status do Item')),
	send(D7, append(C4)),
	send(D7, right, D3),
	new(C5, text_item('Preo R$')),
	send(D4, append(C5)),
	send(D4, right, D7),


	send(E, append, button(gravar,message(@prolog, inserirItem,C1?selection,C2?selection,C3?selection,C4?selection,C5?selection))),

	send(E, append, button(fechar, message(G,destroy))),
	send(D1, above(D3)),
	send(E, right, D7),

	%send(D3, above(D4)),
	send(G, append, D1),
	send(G, open_centered).


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% funo que insere as informaes enviados da funo casdastroLocao


inserirItem(C1,C2,C3,C4,C5):-
	consult('itemlocacao.pl'),
	contador_itemlocacao(X),
	assert(itemlocacao(X,C1,C2,C3,C4,C5)),
	tell('itemlocacao.pl'),
	listing(itemlocacao),
	told.

consultaItem:-
	new(G, frame('Consulta de Item - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo do Item')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% altera Item

alteraItem:-
	new(G, frame('Alterar Itens - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo do Item')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


removeItem:-
	new(G, frame('Remover Item - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo do Item')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


% ------------------------------------------------------------------------
% -----------------------------------------------------------------------


cadastroExemplar:-
	new(G, frame('Cadastro do Exemplar - Video Locadora')),
	new(D1, dialog),
	new(D2, dialog),
	new(D3, dialog),
	new(D4, dialog),
	new(D5, dialog),
	new(D6, dialog),
	new(D7, dialog),
	new(D8, dialog),

	new(E, dialog),

	new(C1, text_item('Codigo do Filme')),
	send(D1, append(C1)),
	new(C2, text_item('Codigo da midia')),
	send(D2, append(C2)),
	send(D2, right, D1),
	new(C3, text_item('Exe_XXX')),
	send(D3, append(C3)),
	new(C4, text_item('Status do exemplar')),
	send(D4, append(C4)),
	send(D4, right, D3),
	new(C5, text_item('Codigo do Fornecedor')),
	send(D5, append(C5)),
	send(D5, right, D4),
	new(C6, text_item('Codigo do Funcionario')),
	send(D6, append(C6)),
	%send(D6, right, D1),
	new(C7, text_item('Status do Cadastro')),
	send(D7, append(C7)),
	send(D7, right, D6),
	send(D8, right, D7),

	send(E, append, button(gravar,message(@prolog, inserirExemplar,C1?selection,C2?selection,C3?selection,C4?selection,C5?selection,C6?selection,C7?selection))),

	send(E, append, button(fechar, message(G,destroy))),
	send(D1, above(D3)),
	send(E, right, D5),
	send(D3, above(D6)),
	send(G, append, D1),
	send(G, open_centered).


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% funo que insere as informaes enviados da funo casdastroLocao


inserirExemplar(C1,C2,C3,C4,C5,C6,C7):-
%	consult('exemplar.pl'),
	contador_exemplar(X),
	assert(exemplar(X,C1,C2,C3,C4,C5,C6,C7)),
	tell('exemplar.pl'),
	listing(exemplar),
	told.

consultaExemplar:-
%	consult('exemplar.pl'),
	findall(Codigo,exemplar(Codigo,_,_,_,_,_,_,_),LA),
	findall(CodFilme,exemplar(_,CodFilme,_,_,_,_,_,_),LB),
	findall(CodMidia,exemplar(_,_,CodMidia,_,_,_,_,_),LC),
	findall(ExeXXX,exemplar(_,_,_,ExeXXX,_,_,_,_),LD),
	findall(StatusExemplar,exemplar(_,_,_,_,StatusExemplar,_,_,_),LE),
	findall(CodigoFornecedor,exemplar(_,_,_,_,_,CodigoFornecedor,_,_),LF),
	findall(CodigoFuncionario,exemplar(_,_,_,_,_,_,CodigoFuncionario,_),LG),
	findall(StatusCadastro,exemplar(_,_,_,_,_,_,_,StatusCadastro),LH),
	new(P,picture('Exemplar')),
	send(P,display,new(T,tabular)),
	send(T,border,1),
	send(T,cell_spacing,-1),
	send(T,rules,all),
	send_list(T,
		  [append('Codigo',bold,center,colspan :=1),
		   append('CodFilme',bold,center,colspan :=1),
		   append('CodMidia',bold,center,colspan :=1),
		   append('ExeXXX',bold,center,colspan :=1),
		   append('StatusExemplar',bold,center,colspan :=1),
		   append('CodigoFornecedor',bold,center,colspan :=1),
		   append('CodigoFuncionario',bold,center,colspan :=1),
		   append('StatusCadastro',bold,center,colspan := 1)]),
	preencheTabelaExemplar(LA,LB,LC,LD,LE,LF,LG,LH,T),
	send(P,open).

preencheTabelaExemplar([],[],[],[],[],[],[],[],_).
preencheTabelaExemplar([LA|LAs],[LB|LBs],[LC|LCs],[LD|LDs],[LE|LEs],[LF|LFs],[LG|LGs],[LH|LHs],T):-
	send_list(T,[next_row,append(LA),append(LB),append(LC),append(LD),append(LE),append(LF),append(LG),append(LH)]),
	preencheTabelaExemplar(LAs,LBs,LCs,LDs,LEs,LFs,LGs,LHs,T).
% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% altera os exemplares


removeExemplar:-
	new(G, frame('Remover Exemplar - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Codigo do Exemplar')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, excluirExemplar,C1?selection))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

excluirExemplar(C1):-
	consult('exemplar.pl'),
       	exemplar(C1,C8,C2,C3,C4,C5,C6,C7),
	retractall(exemplar(C1,C8,C2,C3,C4,C5,C6,C7)),
       	tell('exemplar.pl'),
	listing(exemplar),
	told.


% ------------------------------------------------------------------------
% -----------------------------------------------------------------------


cadastroMidia:-
	new(G, frame('Cadastro do Midia - Video Locadora')),
	new(D1, dialog),
	new(D2, dialog),
	new(D3, dialog),
	%new(D4, dialog),
	%new(D5, dialog),
	%new(D6, dialog),
	%new(D7, dialog),

	new(E, dialog),

	new(C1, text_item('Descricaoo')),
	send(D1, append(C1)),
	new(C2, text_item('Status')),
	send(D2, append(C2)),
	send(D3, right, D2),


	send(E, append, button(gravar,message(@prolog, inserirMidia,C1?selection,C2?selection))),

	send(E, append, button(fechar, message(G,destroy))),
	send(D1, above(D3)),
	send(E, right, D3),

	%send(D3, above(D4)),
	send(G, append, D1),
	send(G, open_centered).




inserirMidia(C1,C2):-
%	consult('midia.pl'),
	contador_midia(X),
	assert(midia(X,C1,C2)),
	tell('midia.pl'),
	listing(midia),
	told.

consultaMidia:-
%	consult('midia.pl'),
	findall(Codigo,midia(Codigo,_,_),LN),
	findall(Descricao,midia(_,Descricao,_),LT),
	findall(Status,midia(_,_,Status),LS),
	new(P,picture('Midia')),
	send(P,display,new(T,tabular)),
	send(T,border,1),
	send(T,cell_spacing,-1),
	send(T,rules,all),
	send_list(T,
		  [append('Codigo',bold,center,colspan :=1),
		   append('Descricao',bold,center,colspan :=1),
		   append('Status',bold,center,colspan := 1)]),
	preencheTabelaMidia(LN,LT,LS,T),
	send(P,open).

preencheTabelaMidia([],[],[],_).
preencheTabelaMidia([LN|LNs],[LT|LTs],[LS|LSs],T):-
	send_list(T,[next_row,append(LN),append(LT),append(LS)]),
	preencheTabelaMidia(LNs,LTs,LSs,T).



menuAlteraMidia:-
	new(G,frame('Menu Altera Midia - Video Locadora')),
	%new(MenuD, dialog),
	new(E, dialog),
	new(D1, dialog),
	new(D2, dialog),
	%new(D3, dialog),
	send(E, append, button('Altera Descricao',message(@prolog, menualteraDescricaoMidia))),
	send(D1, append, button('Altera Status',message(@prolog, menualteraStatusMidia))),
	%send(D2, append, button(ok,message(@prolog, salvarCliente))),
	send(D2, append, button(fechar, message(G,destroy))),
	%send(E, append, text('Teste de funcao de botao')),
	%send(E, append, button(ok,message(G,destroy))),
	send(D2, right, D1),
	send(E, above(D1)),
	%send(D1, above(D2)),
	%send(D2, above(D3)),
	send(G, append, E),
	send(G, open_centered).

menualteraDescricaoMidia:-
	new(G, frame('Alterar Midia - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID da midia')),
	send(D1, append, C1),
	new(C2, text_item('Nova descricao da midia')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraDescricaoMidia,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraStatusMidia:-
	new(G, frame('Alterar Midia - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID da midia')),
	send(D1, append, C1),
	new(C2, text_item('Novo status da midia')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraStatusMidia,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

alteraDescricaoMidia(C1,C2):-
	consult('midia.pl'),
	midia(C1,_,B),
	retractall(midia(C1,_,_)),
	assert(midia(C1,C2,B)),
	tell('midia.pl'),
	listing(midia),
	told.

alteraStatusMidia(C1,C2):-
	consult('midia.pl'),
	midia(C1,A,_),
	retractall(midia(C1,_,_)),
	assert(midia(C1,A,C2)),
	tell('midia.pl'),
	listing(midia),
	told.




removeMidia:-
	new(G, frame('Remover Midia - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Codigo da Midia')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).



% ------------------------------------------------------------------------
% -----------------------------------------------------------------------


cadastroFilme:-
	new(G, frame('Cadastro do Filme - Video Locadora')),
	new(D1, dialog),
	new(D2, dialog),
	new(D3, dialog),
	new(D4, dialog),
	new(D5, dialog),
	new(D6, dialog),
	new(D7, dialog),
	new(D8, dialog),
	new(D9, dialog),
	new(E, dialog),

	new(C1, text_item('Cdigo da Categoria')),
	send(D1, append(C1)),
	new(C2, text_item('Cdigo do Gnero')),
	send(D2, append(C2)),
	send(D2, right, D1),
	new(C3, text_item('Nome')),
	send(D3, append(C3)),
	new(C4, text_item('Nacionalidade')),
	send(D4, append(C4)),
	send(D4, right, D3),
	new(C5, text_item('Duracao')),
	send(D5, append(C5)),
	send(D5, right, D4),
	new(C6, text_item('Elenco')),
	send(D6, append(C6)),
	%send(D6, right, D1),
	new(C7, text_item('Autor')),
	send(D7, append(C7)),
	send(D7, right, D6),
	new(C8, text_item('Status')),
	send(D8, append(C8)),

	new(C9, text_item('Data de Cadastro')),
	send(D9, append(C9)),
	send(D9, right, D8),

	send(E, append, button(gravar,message(@prolog, inserirFilme,C1?selection,C2?selection,C3?selection,C4?selection,C5?selection,C6?selection,C7?selection,C8?selection,C9?selection))),

	send(E, append, button(fechar, message(G,destroy))),
	send(D1, above(D3)),
	send(E, right, D5),
	send(D3, above(D6)),
	send(D6, above(D8)),
	send(G, append, D1),
	send(G, open_centered).


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% funo que insere as informaes enviados da funo casdastroLocao


inserirFilme(C1,C2,C3,C4,C5,C6,C7,C8,C9):-
	consult('filme.pl'),
	contador_filme(X),
	assert(filme(X,C1,C2,C3,C4,C5,C6,C7,C8,C9)),
	tell('filme.pl'),
	listing(filme),
	told.


consultaFilme:-
	new(G, frame('Consulta do Filme - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo do Filme')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% altera os Clientes



removeFilme:-
	new(G, frame('Remover Filme - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo do Filme')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


% ------------------------------------------------------------------------
% -----------------------------------------------------------------------


cadastroGenero:-
	new(G, frame('Cadastro do Genero - Video Locadora')),
	new(D1, dialog),
	new(D2, dialog),
	new(D3, dialog),
	%new(D4, dialog),
	%new(D5, dialog),
	%new(D6, dialog),
	%new(D7, dialog),

	new(E, dialog),

	new(C1, text_item('Descricao')),
	send(D1, append(C1)),
	new(C2, text_item('Status')),
	send(D2, append(C2)),
	send(D3, right, D2),


	send(E, append, button(gravar,message(@prolog, inserirGenero,C1?selection,C2?selection))),

	send(E, append, button(fechar, message(G,destroy))),
	send(D1, above(D3)),
	send(E, right, D3),

	%send(D3, above(D4)),
	send(G, append, D1),
	send(G, open_centered).




inserirGenero(C1,C2):-
%	consult('genero.pl'),
	contador_genero(X),
	assert(genero(X,C1,C2)),
	tell('genero.pl'),
	listing(genero),
	told.

consultaGenero:-
%	consult('genero.pl'),
	findall(Codigo,genero(Codigo,_,_),LN),
	findall(Descricao,genero(_,Descricao,_),LT),
	findall(Status,genero(_,_,Status),LS),
	new(P,picture('Generos')),
	send(P,display,new(T,tabular)),
	send(T,border,1),
	send(T,cell_spacing,-1),
	send(T,rules,all),
	send_list(T,
		  [append('Codigo',bold,center,colspan :=1),
		   append('Descricao',bold,center,colspan :=1),
		   append('Status',bold,center,colspan := 1)]),
	preencheTabelaGenero(LN,LT,LS,T),
	send(P,open).

preencheTabelaGenero([],[],[],_).
preencheTabelaGenero([LN|LNs],[LT|LTs],[LS|LSs],T):-
	send_list(T,[next_row,append(LN),append(LT),append(LS)]),
	preencheTabelaGenero(LNs,LTs,LSs,T).



menuAlteraGenero:-
	new(G,frame('Menu Altera Preco - Video Locadora')),
	%new(MenuD, dialog),
	new(E, dialog),
	new(D1, dialog),
	new(D2, dialog),
	%new(D3, dialog),
	send(E, append, button('Altera Descricao',message(@prolog, menualteraDescricaoGenero))),
	send(D1, append, button('Altera Status',message(@prolog, menualteraStatusGenero))),
	%send(D2, append, button(ok,message(@prolog, salvarCliente))),
	send(D2, append, button(fechar, message(G,destroy))),
	%send(E, append, text('Teste de funcao de botao')),
	%send(E, append, button(ok,message(G,destroy))),
	send(D2, right, D1),
	send(E, above(D1)),
	%send(D1, above(D2)),
	%send(D2, above(D3)),
	send(G, append, E),
	send(G, open_centered).

menualteraDescricaoGenero:-
	new(G, frame('Alterar Genero - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID do genero')),
	send(D1, append, C1),
	new(C2, text_item('Nova descricao do genero')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraDescricaoGenero,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraStatusGenero:-
	new(G, frame('Alterar Genero - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID do genero')),
	send(D1, append, C1),
	new(C2, text_item('Novo status do genero')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraStatusGenero,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

alteraDescricaoGenero(C1,C2):-
	consult('genero.pl'),
	genero(C1,_,B),
	retractall(genero(C1,_,_)),
	assert(genero(C1,C2,B)),
	tell('genero.pl'),
	listing(genero),
	told.

alteraStatusGenero(C1,C2):-
	consult('genero.pl'),
	genero(C1,A,_),
	retractall(genero(C1,_,_)),
	assert(genero(C1,A,C2)),
	tell('genero.pl'),
	listing(genero),
	told.



removeGenero:-
	new(G, frame('Remover Genero - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Codigo do Genero')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


% ------------------------------------------------------------------------
% -----------------------------------------------------------------------


cadastroCategoria:-
	new(G, frame('Cadastro do Categoria - Video Locadora')),
	new(D1, dialog),
	new(D2, dialog),
	new(D3, dialog),
	%new(D4, dialog),
	%new(D5, dialog),
	%new(D6, dialog),
	%new(D7, dialog),

	new(E, dialog),

	new(C1, text_item('Descricao')),
	send(D1, append(C1)),
	new(C2, text_item('Status')),
	send(D2, append(C2)),

	send(D3, right, D2),


	send(E, append, button(gravar,message(@prolog, inserirCategoria,C1?selection,C2?selection))),

	send(E, append, button(fechar, message(G,destroy))),
	send(D1, above(D3)),
	send(E, right, D3),

	%send(D3, above(D4)),
	send(G, append, D1),
	send(G, open_centered).



inserirCategoria(C1,C2):-
%	consult('categoria.pl'),
	contador_categoria(X),
	assert(categoria(X,C1,C2)),
	tell('categoria.pl'),
	listing(categoria),
	told.

consultaCategoria:-
%	consult('categoria.pl'),
	findall(Codigo,categoria(Codigo,_,_),LN),
	findall(Descricao,categoria(_,Descricao,_),LT),
	findall(Status,categoria(_,_,Status),LS),
	new(P,picture('Categorias')),
	send(P,display,new(T,tabular)),
	send(T,border,1),
	send(T,cell_spacing,-1),
	send(T,rules,all),
	send_list(T,
		  [append('Codigo',bold,center,colspan :=1),
		   append('Descricao',bold,center,colspan :=1),
		   append('Status',bold,center,colspan := 1)]),
	preencheTabelaCategoria(LN,LT,LS,T),
	send(P,open).

preencheTabelaCategoria([],[],[],_).
preencheTabelaCategoria([LN|LNs],[LT|LTs],[LS|LSs],T):-
	send_list(T,[next_row,append(LN),append(LT),append(LS)]),
	preencheTabelaCategoria(LNs,LTs,LSs,T).



menuAlteraCategoria:-
	new(G,frame('Menu Altera Categoria - Video Locadora')),
	%new(MenuD, dialog),
	new(E, dialog),
	new(D1, dialog),
	new(D2, dialog),
	%new(D3, dialog),
	send(E, append, button('Altera Descricao',message(@prolog, menualteraDescricaoCategoria))),
	send(D1, append, button('Altera Status',message(@prolog, menualteraStatusCategoria))),
	%send(D2, append, button(ok,message(@prolog, salvarCliente))),
	send(D2, append, button(fechar, message(G,destroy))),
	%send(E, append, text('Teste de funcao de botao')),
	%send(E, append, button(ok,message(G,destroy))),
	send(D2, right, D1),
	send(E, above(D1)),
	%send(D1, above(D2)),
	%send(D2, above(D3)),
	send(G, append, E),
	send(G, open_centered).

menualteraDescricaoCategoria:-
	new(G, frame('Alterar Categoria - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID da categoria')),
	send(D1, append, C1),
	new(C2, text_item('Nova descricao da categoria')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraDescricaoCategoria,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraStatusCategoria:-
	new(G, frame('Alterar Categoria - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID da categoria')),
	send(D1, append, C1),
	new(C2, text_item('Novo status da categoria')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraStatusCategoria,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

alteraDescricaoCategoria(C1,C2):-
	consult('categoria.pl'),
	categoria(C1,_,B),
	retractall(categoria(C1,_,_)),
	assert(categoria(C1,C2,B)),
	tell('categoria.pl'),
	listing(categoria),
	told.

alteraStatusCategoria(C1,C2):-
	consult('categoria.pl'),
	categoria(C1,A,_),
	retractall(categoria(C1,_,_)),
	assert(categoria(C1,A,C2)),
	tell('categoria.pl'),
	listing(categoria),
	told.




removeCategoria:-
	new(G, frame('Remover Categoria  - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Codigo do Categoria')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


% ------------------------------------------------------------------------
% -----------------------------------------------------------------------

cadastroPreco:-
	new(G, frame('Cadastro de Preco - Video Locadora')),
	new(D1, dialog),
	new(D2, dialog),
	new(D3, dialog),
	new(D4, dialog),
	new(D5, dialog),
	new(D6, dialog),
	%new(D7, dialog),

	new(E, dialog),

	new(C1, text_item('Codigo da Midia')),
	send(D1, append(C1)),
	new(C2, text_item('Codigo da Categoria')),
	send(D2, append(C2)),
	send(D2, right, D1),
	new(C3, text_item('Pre-codigo')),
	send(D3, append(C3)),
	send(D3, right, D2),
	new(C4, text_item('Dias')),
	send(D4, append(C4)),

	new(C5, text_item('Status')),
	send(D5, append(C5)),
	send(D5, right, D4),
	send(D6, right, D5),

	send(E, append, button(gravar,message(@prolog, inserirPreco,C1?selection,C2?selection,C3?selection,C4?selection,C5?selection))),

	send(E, append, button(fechar, message(G,destroy))),
	send(D1, above(D4)),
	send(E, right, D6),

	%send(D3, above(D4)),
	send(G, append, D1),
	send(G, open_centered).




inserirPreco(C1,C2,C3,C4,C5):-
%	consult('preco.pl'),
	contador_preco(X),
	assert(preco(X,C1,C2,C3,C4,C5)),
	tell('preco.pl'),
	listing(preco),
	told.


menuAlteraPreco:-
	new(G,frame('Menu Altera Preco - Video Locadora')),
	%new(MenuD, dialog),
	new(E, dialog),
	new(D1, dialog),
	new(D2, dialog),
	%new(D3, dialog),
	send(E, append, button('Altera Midia', message(@prolog, menualteraCodigoMidiaPreco))),
	send(E, append, button('Altera Categoria', message(@prolog, menualteraCodigoCategoriaPreco))),
	send(E, append, button('Altera Pre-Codigo',message(@prolog, menualteraPreCodigoPreco))),
	send(D1, append, button('Altera Dias',message(@prolog, menualteraDiasPreco))),
	send(D1, append, button('Altera Status', message(@prolog, menualteraStatusPreco))),
	%send(D2, append, button(ok,message(@prolog, salvarCliente))),
	send(D2, append, button(fechar, message(G,destroy))),
	%send(E, append, text('Teste de funcao de botao')),
	%send(E, append, button(ok,message(G,destroy))),
	send(D2, right, D1),
	send(E, above(D1)),
	%send(D1, above(D2)),
	%send(D2, above(D3)),
	send(G, append, E),
	send(G, open_centered).

menualteraCodigoMidiaPreco:-
	new(G, frame('Alterar Preco - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID do Preco')),
	send(D1, append, C1),
	new(C2, text_item('Novo codigo da midia')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraCodigoMidiaPreco,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).



menualteraCodigoCategoriaPreco:-
	new(G, frame('Alterar Preco - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID do Preco')),
	send(D1, append, C1),
	new(C2, text_item('Novo codigo da categoria')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraCodigoCategoriaPreco,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


menualteraPreCodigoPreco:-
	new(G, frame('Alterar Preco - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID do Preco')),
	send(D1, append, C1),
	new(C2, text_item('Novo Pre-Codigo')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraPreCodigoPreco,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraDiasPreco:-
	new(G, frame('Alterar Preco - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID do Preco')),
	send(D1, append, C1),
	new(C2, text_item('Novo dias')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraDiasPreco,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraStatusPreco:-
	new(G, frame('Alterar Preco - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID do Preco')),
	send(D1, append, C1),
	new(C2, text_item('Novo status')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraStatusPreco,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).



alteraCodigoMidiaPreco(C1,C2):-
	consult('preco.pl'),
	preco(C1,_,B,C,D,E),
	retractall(cliente(C1,_,_,_,_,_)),
	assert(preco(C1,C2,B,C,D,E)),
	tell('preco.pl'),
	listing(preco),
	told.

alteraCodigoCategoriaPreco(C1,C2):-
	consult('preco.pl'),
	preco(C1,A,_,C,D,E),
	retractall(cliente(C1,_,_,_,_,_)),
	assert(preco(C1,A,C2,C,D,E)),
	tell('preco.pl'),
	listing(preco),
	told.


alteraPreCodigoPreco(C1,C2):-
	consult('preco.pl'),
	preco(C1,A,B,_,D,E),
	retractall(cliente(C1,_,_,_,_,_)),
	assert(preco(C1,A,B,C2,D,E)),
	tell('preco.pl'),
	listing(preco),
	told.

alteraDiasPreco(C1,C2):-
	consult('preco.pl'),
	preco(C1,A,B,C,_,E),
	retractall(cliente(C1,_,_,_,_,_)),
	assert(preco(C1,A,B,C,C2,E)),
	tell('preco.pl'),
	listing(preco),
	told.

alteraStatusPreco(C1,C2):-
	consult('preco.pl'),
	preco(C1,A,B,C,D,_),
	retractall(cliente(C1,_,_,_,_,_)),
	assert(preco(C1,A,B,C,D,C2)),
	tell('preco.pl'),
	listing(preco),
	told.







% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% altera os Clientes

alteraPreco:-
	new(G, frame('Alterar Preco - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Codigo do Preco')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


removePreco:-
	new(G, frame('Remover Preco - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Codigo do Preco')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

consultaPreco:-
%	consult('preco.pl'),
	findall(Codigo,preco(Codigo,_,_,_,_,_),LA),
	findall(CodigoMidia,preco(_,CodigoMidia,_,_,_,_),LB),
	findall(CodigoCategoria,preco(_,_,CodigoCategoria,_,_,_),LC),
	findall(PreCodigo,preco(_,_,_,PreCodigo,_,_),LD),
	findall(Dias,preco(_,_,_,_,Dias,_),LE),
	findall(Status,preco(_,_,_,_,_,Status),LF),
	new(P,picture('Generos')),
	send(P,display,new(T,tabular)),
	send(T,border,1),
	send(T,cell_spacing,-1),
	send(T,rules,all),
	send_list(T,
		  [append('Codigo',bold,center,colspan :=1),
		   append('CodigoMidia',bold,center,colspan :=1),
		   append('CodigoCategoria',bold,center,colspan := 1),
		   append('PreCodigo',bold,center,colspan := 1),
		   append('Dias',bold,center,colspan := 1),
		   append('Status',bold,center,colspan := 1)]),
	preencheTabelaPreco(LA,LB,LC,LD,LE,LF,T),
	send(P,open).

preencheTabelaPreco([],[],[],[],[],[],_).
preencheTabelaPreco([LA|LAs],[LB|LBs],[LC|LCs],[LD|LDs],[LE|LEs],[LF|LFs],T):-
	send_list(T,[next_row,append(LA),append(LB),append(LC),append(LD),append(LE),append(LF)]),
	preencheTabelaPreco(LAs,LBs,LCs,LDs,LEs,LFs,T).



% ------------------------------------------------------------------------
% -----------------------------------------------------------------------

cadastroPagamento:-
	new(G, frame('Cadastro de Pagamento - Video Locadora')),
	new(D1, dialog),
	new(D2, dialog),
	new(D3, dialog),
	new(D4, dialog),
	new(D5, dialog),
	new(D6, dialog),
	%new(D7, dialog),

	new(E, dialog),

	new(C1, text_item('Codigo da Locacao')),
	send(D1, append(C1)),
	new(C2, text_item('Valor Pago R$')),
	send(D2, append(C2)),
	send(D2, right, D1),
	new(C3, text_item('Desconto R$')),
	send(D3, append(C3)),
	send(D3, right, D2),
	new(C4, text_item('Statspag')),
	send(D4, append(C4)),

	new(C5, text_item('Data')),
	send(D5, append(C5)),
	send(D5, right, D4),
	new(C6, text_item('Status')),
	send(D6, append(C6)),
	send(D6, right, D5),

	send(E, append, button(gravar,message(@prolog, inserirPagamento,C1?selection,C2?selection,C3?selection,C4?selection,C5?selection,C6?selection))),

	send(E, append, button(fechar, message(G,destroy))),
	send(D1, above(D4)),
	send(E, right, D6),

	%send(D3, above(D4)),
	send(G, append, D1),
	send(G, open_centered).



inserirPagamento(C1,C2,C3,C4,C5,C6):-
	consult('pagamento.pl'),
	contador_pagamento(X),
	assert(pagamento(X,C1,C2,C3,C4,C5,C6)),
	tell('pagamento.pl'),
	listing(pagamento),
	told.

consultaPagamento:-
	new(G, frame('Consulta de Pagamento - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Codigo do Pagamento')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% altera os Pagamentos

alteraPagamento:-
	new(G, frame('Alterar Pagamento - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo do Pagamento')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

removePagamento:-
	new(G, frame('Remover Pagamentos - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo do Pagamento')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).



% ------------------------------------------------------------------------
% -----------------------------------------------------------------------

cadastroMovimento:-
	new(G, frame('Cadastro de Movimento - Video Locadora')),
	new(D1, dialog),
	new(D2, dialog),
	new(D3, dialog),
	new(D4, dialog),
	%new(D5, dialog),
	%new(D6, dialog),
	new(D7, dialog),

	new(E, dialog),

	new(C1, text_item('Data')),
	send(D1, append(C1)),
	new(C2, text_item('Status')),
	send(D2, append(C2)),
	send(D2, right, D1),
	new(C3, text_item('Valor R$')),
	send(D3, append(C3)),
	new(C4, text_item('Cdigo do Funcionrio')),
	send(D7, append(C4)),
	send(D7, right, D3),
	new(C5, text_item('Con_codigo')),
	send(D4, append(C5)),
	send(D4, right, D7),


	send(E, append, button(gravar,message(@prolog, inserirMovimento,C1?selection,C2?selection,C3?selection,C4?selection,C5?selection))),

	send(E, append, button(fechar, message(G,destroy))),
	send(D1, above(D3)),
	send(E, right, D7),

	%send(D3, above(D4)),
	send(G, append, D1),
	send(G, open_centered).


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% funo que insere as informaes enviados da funo casdastroLocao


inserirMovimento(C1,C2,C3,C4,C5):-
	consult('movimento.pl'),
	contador_movimento(X),
	assert(movimento(X,C1,C2,C3,C4,C5)),
	tell('movimento.pl'),
	listing(movimento),
	told.

consultaMovimento:-
	new(G, frame('Consulta de Movimento - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo do Movimento')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% altera movimento

alteraMovimento:-
	new(G, frame('Alterar Movimento - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo do Movimento')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


removeMovimento:-
	new(G, frame('Remover Movimento - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo do Movimento')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


% ------------------------------------------------------------------------
% -----------------------------------------------------------------------

cadastroSangria:-
	new(G, frame('Cadastro de Sangria - Video Locadora')),
	new(D1, dialog),
	new(D2, dialog),
	new(D3, dialog),
	new(D4, dialog),
	new(D5, dialog),
	new(D6, dialog),
	%new(D7, dialog),

	new(E, dialog),

	new(C1, text_item('Descrio')),
	send(D1, append(C1)),
	new(C2, text_item('Valor R$')),
	send(D2, append(C2)),
	send(D2, right, D1),
	new(C3, text_item('StatusXXX')),
	send(D3, append(C3)),
	send(D3, right, D2),
	new(C4, text_item('Cdigo do Funcionrio')),
	send(D4, append(C4)),

	new(C5, text_item('Status')),
	send(D5, append(C5)),
	send(D5, right, D4),
	new(C6, text_item('Data da Sangria')),
	send(D6, append(C6)),
	send(D6, right, D5),

	send(E, append, button(gravar,message(@prolog, inserirSangria,C1?selection,C2?selection,C3?selection,C4?selection,C5?selection,C6?selection))),

	send(E, append, button(fechar, message(G,destroy))),
	send(D1, above(D4)),
	send(E, right, D6),

	%send(D3, above(D4)),
	send(G, append, D1),
	send(G, open_centered).


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% funo que insere as informaes enviados da funo casdastroLocao


inserirSangria(C1,C2,C3,C4,C5,C6):-
	consult('sangria.pl'),
	contador_sangria(X),
	assert(sangria(X,C1,C2,C3,C4,C5,C6)),
	tell('sangria.pl'),
	listing(sangria),
	told.

consultaSangria:-
	new(G, frame('Consulta Sangria - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo da Sangria')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% altera Sangria

alteraSangria:-
	new(G, frame('Alterar Sangria - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo da Sangria')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


removeSangria:-
	new(G, frame('Remover Sangria - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo da Sangria')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


% ------------------------------------------------------------------------
% -----------------------------------------------------------------------

cadastroDespesa:-
	new(G, frame('Cadastro de Despesa - Video Locadora')),
	new(D1, dialog),
	new(D2, dialog),
	new(D3, dialog),
	new(D4, dialog),
	new(D5, dialog),
	%new(D6, dialog),
	%new(D7, dialog),

	new(E, dialog),

	new(C1, text_item('Descricao')),
	send(D1, append(C1)),
	send(D2, right, D1),
	new(C3, text_item('Valor R$')),
	send(D3, append(C3)),
	send(D3, right, D2),
	new(C4, text_item('Status')),
	send(D4, append(C4)),

	new(C5, text_item('Codigo do Funcionario')),
	send(D5, append(C5)),
	send(D5, right, D4),


	send(E, append, button(gravar,message(@prolog, inserirDespesa,C1?selection,C3?selection,C4?selection,C5?selection))),

	send(E, append, button(fechar, message(G,destroy))),
	send(D1, above(D4)),
	send(E, right, D5),

	%send(D3, above(D4)),
	send(G, append, D1),
	send(G, open_centered).





inserirDespesa(C1,C3,C4,C5):-
	consult('despesa.pl'),
	contador_despesa(X),
	assert(despesa(X,C1,C3,C4,C5)),
	tell('despesa.pl'),
	listing(despesa),
	told.

consultaDespesa:-
	new(G, frame('Consulta de Despesa - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Codigo da Despesa')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).



menuAlteraDespesa:-
	new(G,frame('Menu Altera Despesa - Video Locadora')),
	%new(MenuD, dialog),
	new(E, dialog),
	new(D1, dialog),
	new(D2, dialog),
	%new(D3, dialog),
	send(E, append, button('Altera Descricao',message(@prolog, menualteraDescricaoDespesa))),
	send(E, append, button('Altera Valor',message(@prolog, menualteraValorDespesa))),
	send(D1, append, button('Altera Status',message(@prolog, menualteraStatusDespesa))),
	send(D1, append, button('Altera Cod Funcionario',message(@prolog, menualteraCodigoFuncionarioDespesa))),
	%send(D2, append, button(ok,message(@prolog, salvarCliente))),
	send(D2, append, button(fechar, message(G,destroy))),
	%send(E, append, text('Teste de funcao de botao')),
	%send(E, append, button(ok,message(G,destroy))),
	send(D2, right, D1),
	send(E, above(D1)),
	%send(D1, above(D2)),
	%send(D2, above(D3)),
	send(G, append, E),
	send(G, open_centered).

menualteraDescricaoDespesa:-
	new(G, frame('Alterar Despesa - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID da Despesa')),
	send(D1, append, C1),
	new(C2, text_item('Nova descricao da despesa')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraDescricaoDespesa,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraValorDespesa:-
	new(G, frame('Alterar Despesa - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID da Despesa')),
	send(D1, append, C1),
	new(C2, text_item('Novo valor da despesa')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraValorDespesa,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraStatusDespesa:-
	new(G, frame('Alterar Despesa - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID da Despesa')),
	send(D1, append, C1),
	new(C2, text_item('Novo status  da despesa')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraStatusDespesa,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

menualteraCodigoFuncionarioDespesa:-
	new(G, frame('Alterar Despesa - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('ID da Despesa')),
	send(D1, append, C1),
	new(C2, text_item('Novo cod funcionario da despesa')),
	send(D1, append, C2),
	send(E, append, button('Alterar', message(@prolog, alteraCodigoFuncionarioDespesa,C1?selection,C2?selection))),
	send(E, append, button('Fechar', message(G,destroy))),
	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).



alteraDescricaoDespesa(C1,C2):-
	consult('despesa.pl'),
	despesa(C1,_,B,C,D),
	retractall(despesa(C1,_,_,_,_)),
	assert(despesa(C1,C2,B,C,D)),
	tell('despesa.pl'),
	listing(despesa),
	told.

alteraValorDespesa(C1,C2):-
	consult('despesa.pl'),
	despesa(C1,A,_,C,D),
	retractall(despesa(C1,_,_,_,_)),
	assert(despesa(C1,A,C2,C,D)),
	tell('despesa.pl'),
	listing(despesa),
	told.

alteraStatusDespesa(C1,C2):-
	consult('despesa.pl'),
	despesa(C1,A,B,_,D),
	retractall(despesa(C1,_,_,_,_)),
	assert(despesa(C1,A,B,C2,D)),
	tell('despesa.pl'),
	listing(despesa),
	told.

alteraCodigoFuncionarioDespesa(C1,C2):-
	consult('despesa.pl'),
	despesa(C1,A,B,C,_),
	retractall(despesa(C1,_,_,_,_)),
	assert(despesa(C1,A,B,C,C2)),
	tell('despesa.pl'),
	listing(despesa),
	told.





removeDespesa:-
	new(G, frame('Remover Despesa - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Codigo da Despesa')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).



% ------------------------------------------------------------------------
% -----------------------------------------------------------------------

cadastroCaixa:-
	new(G, frame('Cadastro de Caixa - Video Locadora')),
	new(D1, dialog),
	new(D2, dialog),
	new(D3, dialog),
	new(D4, dialog),
	new(D5, dialog),
	%new(D6, dialog),
	%new(D7, dialog),

	new(E, dialog),

	new(C1, text_item('Data')),
	send(D1, append(C1)),
	new(C2, text_item('Valor Recebido R$')),
	send(D2, append(C2)),
	send(D2, right, D1),
	new(C3, text_item('Valor Gasto R$')),
	send(D3, append(C3)),
	send(D3, right, D2),
	new(C4, text_item('Cdigo do Funcionrio')),
	send(D4, append(C4)),

	new(C5, text_item('Status')),
	send(D5, append(C5)),
	send(D5, right, D4),


	send(E, append, button(gravar,message(@prolog, inserirCaixa,C1?selection,C2?selection,C3?selection,C4?selection,C5?selection))),

	send(E, append, button(fechar, message(G,destroy))),
	send(D1, above(D4)),
	send(E, right, D5),

	%send(D3, above(D4)),
	send(G, append, D1),
	send(G, open_centered).





% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
% funo que insere as informaes enviados da funo casdastroLocao


inserirCaixa(C1,C2,C3,C4,C5):-
	consult('caixa.pl'),
	contador_caixa(X),
	assert(caixa(X,C1,C2,C3,C4,C5)),
	tell('caixa.pl'),
	listing(caixa),
	told.

consultaCaixa:-
	new(G, frame('Consulta de Caixa - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo do Caixa')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

alteraCaixa:-
	new(G, frame('Alterar Caixa - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo do Caixa')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


removeCaixa:-
	new(G, frame('Remover Caixa - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Cdigo do Caixa')),

	send(D1, append, C1),
	send(E, append, button('Procurar', message(@prolog, menuCliente))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).

cadastroCaixaInicial:-

	new(G, frame('Cadastro Caixa Inicial - Video Locadora')),
	new(D1, dialog),
	new(E, dialog),
	new(C1, text_item('Valor')),

	send(D1, append, C1),
	send(E, append, button('Cadastro', message(@prolog, inserirCaixaInicial,C1?selection))),
	send(E, append, button('Fechar', message(G,destroy))),

	send(E, right, D1),
	send(G, append, D1),
	send(G, open_centered).


inserirCaixaInicial(C1):-
	consult('caixainicial.pl'),
	assert(caixainicial(C1)),
	tell('caixainicial.pl'),
	listing(caixainicial),
	told.




janelaInfo(Status, Msg):-
new(D, dialog('Info')),
new(S, text(Status)),
new(T, text(Msg)),
new(Ok, button('OK', message(D, destroy))),
send(D, append(S)),
send(D, append(T)),
send(D, append(Ok)),
send(D, open_centered).






contador_categoria(X):-
	retract(cont_categoria(X)),
	!,
	X1 is X+1,
	assert(cont_categoria(X1)).
contador_categoria(0):-
	assert(cont_categoria(1)).

contador_cliente(X):-
	retract(cont_cliente(X)),
	!,
	X1 is X+1,
	assert(cont_cliente(X1)).
contador_cliente(0):-
	assert(cont_cliente(1)).


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


contador_dependente(X):-
	retract(cont_dependente(X)),
	!,
	X1 is X+1,
	assert(cont_dependente(X1)).
contador_dependente(0):-
	assert(cont_dependente(1)).
