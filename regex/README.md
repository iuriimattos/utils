between words
```
[a-zA-z]*between*[a-zA-z]
```

except with start
```
^((?!start).)*text1
```

2 words same line
```
(start).*(end1|end2)|\2.*\1
```
