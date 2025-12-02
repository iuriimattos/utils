# PT
Esse comando força o Windows a redefinir ("zerar") todas as configurações de rede, renovar seu endereço IP e limpar memórias antigas de navegação para tentar corrigir problemas de internet.

```bash
netsh winsock reset && netsh int ip reset && ipconfig /release && ipconfig /renew && ipconfig /flushdns
```

## details

https://gemini.google.com/share/7e9354def95f
