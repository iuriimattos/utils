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

> prepara as modificações (staged) para versionar

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

> exibe a situação atual da branch

```
git checkout (arquivo)
```

> reverte o arquivo ao estado original

```
git checkout (branch)
```

> envia as mudanças atuais para uma branch

```
git checkout -b (branch)
```

> cria uma branch com as modificações atuais

```
git checkout -b remoto/branch branchName
```

> cria nova branch a partir de um repositório remoto

```
git commit -m "texto do comit"
```

> cria uma nova versão

```
git push
```

> atualiza a branch atual ou uma preconfigurada do repositorio remoto

```
git push --set-upstream <remote> <branch>
```

> preconfigura a branch atual para uma branch do repositorio remoto

```
git push remote branch
```

> atualiza uma branch específica do repositorio remoto

```
git push remote branch -f
```

> força a atualização de uma branch do repositorio remoto

```
git pull remote branch --rebase
```

> atualiza a branch atual a partir de um repositorio remoto (coloca os commits atuais no topo (HEAD))
> ideal para trabalhar no mesmo arquivo

```
git pull rebase --continue
```

> continua o pull --rebase a partir dos conflitos resolvidos

```
git remote add origin (url)
```

> adiciona um repositório remoto ao repositorio local

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

> retira as mudanças não commitas de um arquivo

```
git fetch -p
```

> remove as branchs deletadas no remoto

```
git fetch --all
```

```
git fetch -a
```

> busca as alterações de todas as branchs remotas

```
git log
```

> exibe as modificações da branch atual com seus devidos hash
> o hash é uma sequencia de número e letras após a palavra commit

```
git reset .
```

> retira todas as modificações que seriam commitadas (ustage)
> usado para reverter o git add (diferente de git checkout .)

```
git reset --soft <commit_hash>
```

> reset da a branch atual para um commit específico 
> **e coloca as modificações do HEAD até o <commit_hash> em sua arvore de trabalho para um commit**
> as modificações ficam staged (git add provoca o staged)

```
git reset --soft HEAD~<numero>
```

> reset <numero> commits da branch atual 
> **e coloca as modificações do HEAD até o <numero> em sua arvore de trabalho para um commit**


```
git reset --hard commit
```

```
git reset --hard HEAD~<numero>
```

```
git reset --hard remote/branch
```

> reset da a branch atual para um commit específico **NÃO mantendo alterações não commitadas**


```
git cherry-pick --no-commit <commit_hash>, <commit_hash>
```

> pega  commits e atualiza a working tree, deixando essas alterações em staged

```
git cherry-pick --no-commit <commit_hash>, <commit_hash>
```

