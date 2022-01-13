exclude word
```
^(?!.*text).*?(?:te|xt).*
```

between words
```
[a-zA-z]*between*[a-zA-z]
```

except with start
```
(^(?!.*start).*?(?:sta|rt).*|text)|\2.*\1
```

2 words same line
```
(start).*(end1|end2)|\2.*\1
```
