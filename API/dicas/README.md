**Guia de Boas Práticas com Git**

Olá equipe!

Para garantir uma colaboração eficiente e organizada no nosso projeto, é importante seguir algumas práticas ao trabalhar com o Git. Abaixo estão as diretrizes que devemos seguir:

### Padrão de Branch

Ao criar uma nova funcionalidade, utilize o padrão de nomenclatura de branch:

```bash
git checkout develop               # Certifique-se de estar na branch develop
git pull origin develop            # Atualize sua branch local com as últimas alterações
git checkout -b feature/GRANK-01-criando-algo-novo  # Crie uma nova branch para sua funcionalidade
```

### Atualização da Branch Atual

Antes de começar a trabalhar em uma nova funcionalidade, sempre atualize a sua branch com a `develop`:

```bash
git checkout develop               # Certifique-se de estar na branch develop
git pull origin develop            # Atualize sua branch local com as últimas alterações
git checkout feature/GRANK-01-criando-algo-novo  # Volte para sua branch de trabalho
git merge develop                   # Integre as últimas alterações da develop na sua branch
```

### Adicionar Alterações

Para adicionar alterações ao stage, utilize o seguinte comando:

```bash
git add .                           # Adiciona todas as alterações
# ou
git add nome_do_arquivo             # Adiciona um arquivo específico
```

### Commit

Após adicionar as alterações ao stage, faça o commit com uma mensagem significativa:

```bash
git commit -m "Mensagem detalhada explicando as alterações realizadas"
```

### Push

Na primeira vez que estiver empurrando para a branch remota, utilize o seguinte comando:

```bash
git push --set-upstream origin feature/GRANK-01-criando-algo-novo
```

Nas vezes subsequentes, use:

```bash
git push
```

### GitHub Desktop

Para quem prefere utilizar o GitHub Desktop, siga estes passos:

1. Abra o GitHub Desktop.
2. Selecione o repositório desejado.
3. Crie uma nova branch no botão "Current Branch".
4. Realize as alterações no seu editor favorito.
5. No GitHub Desktop, visualize as alterações e adicione-as ao commit.
6. Faça o commit e, em seguida, clique em "Push origin" para enviar para o repositório remoto.
7. Abra o GitHub no navegador e crie uma Pull Request.

### Revisão e Aprovação

Depois de enviar a Pull Request, aguarde a revisão e aprovação de Valentin ou Felipe antes de mesclar as alterações na branch principal.

Lembre-se de seguir essas práticas para manter nosso fluxo de trabalho organizado e eficiente. Qualquer dúvida, estou à disposição para ajudar!

Atenciosamente,
[Valentin Almeida]
