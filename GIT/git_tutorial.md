```
branch
```

> versão do código, geralmente usada quando o software esta em desenvolvimento. Utiliza-se branch principalmente quando há várias pessoas trabalhando em um mesmo projeto. Geralmente é utilizada para referenciar alguma alteração no código principal como um BUGFIX, HOTFIX, FEATURE ou RELEASE

```
HEAD
```

> indica o ultimo commit.

```
git init
```

> inicia projeto git

```
git add .
```

> stage arquivos para serem comitados

```
git remote show remote
```

> mostra todas as informações de um repositorio remoto

```
git remote -v
```

> mostra quantos repositorios remoto estão configurados

```
git status
```

> ver alteracoes no branch

```
git checkout (arquivo)
```

> reverte o arquivo ao estado original

```
git checkout (arquivo)
```

```
git checkout (branch)
```

```
git checkout -b (branch)
```

> reverte o arquivo ao estado original ou para uma branch, flag -b cria uma branch com a versão da branch atual

```
git checkout -b remoto/branch branchName
```

> cria nova branch a partir de um remoto/branch e da um checkout para ela

```
git commit -m "texto do comit"
```

> envia os commits para o repositório remoto

```
git push
```

```
git push remote branch
```

```
git push remote branch -f
```

> atualiza um repositorio remoto, a flag -f no final força a atualização

```
git pull remote branch --rebase
```

> atualiza a minha versão local a partir de um repositorio remoto e um branch
> ideal para trabalhar no mesmo arquivo

```
git pull rebase  --continue
```

> continua o rebase a partir dos conflitos resolvidos

```
git remote add origin (url)
```

> adiciona projeto remoto ao meu repositorio local

```
git clone (url)
```

> clona projeto

```
ignorando todos os arquivos de uma pasta
```

>

        *
        */
        !.gitignore

```
git checkout (arquivo)
```

> reverte o arquivo ao estado original

```
git fetch --all
```

> adquire todas as branch criadas no repositorio(s) remoto

```
git reset .
```

> unstaged todos os arquivos

```
git reset --soft commit
```

```
git reset --soft HEAD^
```

```
git reset --soft remote/branch
```

> revertendo commit ou remote/branch mantendo alterações na sua arvore de trabalho

```
git reset --hard commit
```

```
git reset --hard HEAD^
```

```
git reset --hard remote/branch
```

> revertendo commit ou remote/branch NÃO mantém alterações na sua arvore de trabalho
> atualiza arvore de trabalho a partir de uma branch remota

```
git cherry-pick --no-commit <SHA>, <SHA>
```

> pega conteudo de commits e atualiza minha working tree, deixando essas alterações em staged

```
git branch --set-upstream-to origin/branch branch
```

> set o push padrao
