# Post-mortem: IntelliJ IDEA não encontrava a JDK 21 do projeto

## Resumo

O IntelliJ IDEA apresentava o seguinte erro ao tentar compilar um módulo Maven:

```text
Cannot find JDK 'zulu-21' for module 'sample-module.app'
```

A mensagem sugeria que a JDK 21 estava ausente ou configurada incorretamente. Entretanto, a instalação física da JDK estava funcional, o terminal conseguia executar Java 21 e o Maven também utilizava a mesma versão corretamente.

A causa raiz foi uma divergência entre:

- o nome do SDK referenciado pelo projeto;
- o SDK armazenado no Settings Repository do IntelliJ;
- os SDKs efetivamente registrados na configuração ativa da instância atual do IntelliJ.

O projeto solicitava um SDK chamado `zulu-21`. O Settings Repository continha esse SDK, mas a tabela ativa de SDKs do IntelliJ IDEA Community 2025.2 não possuía uma entrada com esse nome.

A correção foi cadastrar novamente a instalação da JDK 21 no IntelliJ com o nome exato `zulu-21`.

---

## Ambiente

```text
Sistema operacional: Windows
Shell: PowerShell
IDE: IntelliJ IDEA Community 2025.2
Build tool: Maven
Java: Azul Zulu OpenJDK 21.0.12
Tipo de projeto: Maven multimódulo
```

---

## Impacto

O problema bloqueava a compilação interna do IntelliJ para um dos módulos do projeto. Entre os impactos observados estavam:

- falha ao executar `Build Project`;
- impossibilidade de compilar o módulo pelo compilador interno do IntelliJ;
- risco de falha em testes e execuções dependentes do SDK do módulo;
- comportamento inconsistente entre o terminal e o IDE;
- aumento do tempo de diagnóstico, pois Java e Maven funcionavam externamente.

O código-fonte e a instalação física da JDK não estavam comprometidos.

---

## Sintoma inicial

O IntelliJ apresentava:

```text
Cannot find JDK 'zulu-21' for module 'sample-module.app'
```

Ao mesmo tempo, Java e Maven funcionavam normalmente no terminal:

```powershell
java --version
mvn --version
```

A saída indicava que ambos utilizavam Java 21.

Essa diferença foi a principal característica do incidente:

```text
Terminal: Java 21 funcionando
Maven: Java 21 funcionando
IntelliJ: SDK zulu-21 não encontrado
```

---

## Componentes envolvidos

### 1. Instalação física da JDK

A JDK estava instalada em um diretório local semelhante a:

```text
C:\<usuario>\Downloads\jdk\zulu21.52.15-ca-jdk21.0.12-win_x64
```

contendo os executáveis:

```text
bin\java.exe
bin\javac.exe
```

### 2. Java utilizado pelo terminal

```powershell
java --version
```

Saída: `openjdk 21.0.12`.

### 3. Java utilizado pelo Maven

```powershell
mvn --version
```

Saída indicando runtime Java 21.

### 4. SDK global do IntelliJ

O projeto armazenava uma referência lógica ao SDK `zulu-21`, que precisava ter uma entrada correspondente na tabela global de SDKs da instância ativa do IntelliJ. Era justamente essa entrada que estava ausente.

---

## Linha do tempo da investigação

### 1. Confirmação da versão Java do projeto

Confirmado que o projeto era Java 21:

```text
Project SDK: zulu-21
Language level: 21
```

### 2. Validação da instalação da JDK

```powershell
java --version
mvn --version

$jdk = 'C:\<usuario>\Downloads\jdk\zulu21.52.15-ca-jdk21.0.12-win_x64'
Test-Path "$jdk\bin\java.exe"
Test-Path "$jdk\bin\javac.exe"
& "$jdk\bin\java.exe" --version
& "$jdk\bin\javac.exe" --version
```

Resultado: instalação física válida.

### 3. Busca pela referência `zulu-21` no projeto

```powershell
Get-ChildItem -Force -Recurse -File -Include *.iml,*.xml |
    Select-String 'zulu-21'
```

Encontrado em `.idea\misc.xml`:

```xml
<component
    name="ProjectRootManager"
    version="2"
    languageLevel="JDK_21"
    default="true"
    project-jdk-name="zulu-21"
    project-jdk-type="JavaSDK">
```

### 4. Verificação dos módulos

```powershell
Get-ChildItem -Force -Recurse -File -Include *.iml |
    Select-String 'jdkName='
```

Nenhuma ocorrência encontrada — nenhum módulo declarava SDK próprio divergente.

### 5. Localização do SDK no Settings Repository

```powershell
Get-ChildItem "$env:APPDATA\JetBrains" -Recurse -File -ErrorAction SilentlyContinue |
    Select-String 'zulu-21'
```

Entrada encontrada em:

```text
%APPDATA%\JetBrains\IdeaIC2025.2\settingsRepository\repository\jdk.table.xml
```

```xml
<jdk version="2">
  <name value="zulu-21" />
  <type value="JavaSDK" />
  <version value="Azul Zulu 21.0.12" />
  <homePath value="$USER_HOME$/Downloads/jdk/zulu21.52.15-ca-jdk21.0.12-win_x64" />
</jdk>
```

### 6. Identificação das diferentes tabelas de SDK

```powershell
Get-ChildItem "$env:APPDATA\JetBrains" -Recurse -File -Filter 'jdk.table.xml'
```

Encontradas duas representações relevantes por versão instalada:

```text
options\jdk.table.xml
settingsRepository\repository\jdk.table.xml
```

### 7. Inspeção da tabela ativa

```powershell
Get-Content "$env:APPDATA\JetBrains\IdeaIC2025.2\options\jdk.table.xml" |
    Select-String 'zulu-21'
```

Nenhuma ocorrência.

```powershell
Select-String -Path "$env:APPDATA\JetBrains\IdeaIC2025.2\options\jdk.table.xml" -Pattern '<name value='
```

Resultado: apenas SDKs antigos de Java 8/11, sem `zulu-21`.

---

## Causa raiz

O projeto referenciava `project-jdk-name="zulu-21"`, mas a tabela ativa do IntelliJ (`options\jdk.table.xml`) não possuía essa entrada, embora ela existisse no Settings Repository.

```text
Projeto → solicita "zulu-21"
   ↓
Tabela global ativa do IntelliJ
   ↓
Entrada ausente
   ↓
Cannot find JDK 'zulu-21' for module
```

---

## Por que Java e Maven funcionavam?

Terminal e Maven resolvem a JDK via `JAVA_HOME`/`PATH`. O IntelliJ precisa resolver um **nome lógico de SDK** cadastrado globalmente, independente dessas variáveis de ambiente.

---

## Resolução

```text
File → Project Structure → Platform Settings → SDKs → Add JDK
```

Selecionar a raiz da instalação e nomear exatamente:

```text
zulu-21
```

---

## Validação

```powershell
Select-String -Path "$env:APPDATA\JetBrains\IdeaIC2025.2\options\jdk.table.xml" -Pattern '<name value="zulu-21"'
```

Build funcionando sem o erro original.

---

## Hipóteses descartadas

- JDK 21 ausente
- Maven com Java incorreto
- Projeto configurado para Java 8
- Caminho físico inválido
- Módulo com SDK explícito quebrado
- Necessidade de reinstalar o IntelliJ

---

## Ações a evitar

- Excluir `.idea` sem backup
- Editar `jdk.table.xml` manualmente sem necessidade
- Reinstalar o IDE sem identificar a instância ativa correta

---

## Checklist para casos semelhantes

```text
1. Identificar o nome do SDK solicitado no projeto
2. Validar a JDK física (java/javac)
3. Validar o Maven
4. Localizar todas as instâncias do IntelliJ instaladas
5. Comparar options\jdk.table.xml com settingsRepository\repository\jdk.table.xml
6. Recadastrar o SDK ausente com o nome exato
7. Validar a entrada na tabela ativa
```

---

## Regra operacional

> A presença de uma JDK no sistema, no Maven ou no Settings Repository não garante que o SDK esteja registrado na tabela ativa da instância atual do IntelliJ. Verifique sempre em `File → Project Structure → SDKs` ou diretamente em `options\jdk.table.xml`.

---

## Conclusão

O incidente não foi causado pela JDK, Maven ou código-fonte, mas por uma divergência entre o SDK esperado pelo projeto e o cadastro ativo do IntelliJ. Recadastrar a JDK com o nome exato resolveu definitivamente o problema.

**Status final: resolvido.**

---

## Trecho para o README

```markdown
## IntelliJ IDEA

### Post-mortem: `Cannot find JDK for module`

O IntelliJ não resolvia uma JDK 21 que funcionava normalmente no terminal e no Maven, devido a uma divergência entre o SDK esperado pelo projeto e a tabela ativa de SDKs do IntelliJ.

Correção: recadastrar a JDK em `File → Project Structure → SDKs` com o nome exato esperado pelo projeto.

Post-mortem completo: COLE_AQUI_A_URL_DO_GIST
```
