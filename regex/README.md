exclude word
```
^(?!.*text).*?(?:te|xt).*
```

between words
```
[a-zA-z]*between*[a-zA-z]
```

2 words in a sentence
```
(start).*(end1|end2)|\2.*\1
```

except with start
```
^((?!start).)*text1
```
