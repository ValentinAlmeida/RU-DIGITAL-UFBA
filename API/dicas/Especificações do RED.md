## Organizando Banco de Dados

### Gerenciando objetos da classe User com RED-NODE

```
/insert-user-ruPOST
/update-user-ruPUT
/remove-user-ruDELETE
/recover-all-user-ruGETALL
/remove-all-user-ruDELETEALL
```

- Objeto User - cargo 0 = Aluno
{
    "nome": "Aluno Comum",
    "email": "aluno@ufba.br",
    "matricula": 123456789,
    "password": "123",
    "cargo": 0
}

- Objeto User - cargo 1 = Aluno (BOLSISTA)
{
    "nome": "Aluno Bolsista",
    "email": "alunobolsista@ufba.br",
    "matricula": 987654321,
    "password": "123",
    "cargo": 1
}

- Objeto User - cargo 2 = Admin-1 (Cadastrador de cardápio e bolsistas)
{
    "nome": "Admin Cadastrador",
    "email": "admincadastrador@ufba.br",
    "matricula": 111222333,
    "password": "123",
    "cargo": 2
}

- Objeto User - cargo 3 = Admin-2 (Verificador de QR code)
{
    "nome": "Admin Verificador",
    "email": "adminverificador@ufba.br",
    "matricula": 333222111,
    "password": "123",
    "cargo": 3
}

### Gerenciando objetos da classe Cardapio com RED-NODE

```
/insert-cardapio-ruPOST
/update-cardapio-ruPUT
/remove-cardapio-ruDELETE
/recover-all-cardapio-ruGETALL
/remove-all-cardapio-ruDELETEALL
```

- Objeto Cardapio -> turno = 0 (almoço), 1 (janta)
{
    "turno": 0,
    "bebida": "Suco de Limão",
    "acompanhamento": "Feijão e Arroz",
    "salada": "Alface e Tomate",
    "proteina": "Frango desfiado",
    "vegetariana": "Panqueca de Soja",
    "sobremesa": "Paçoca",
    "dia": 10,
    "mes": 12,
    "ano": 2023
}
