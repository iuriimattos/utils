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

chrome bookmark
```
javascript:(function(){var p=/(\>{1}[^\n\<]*?)([^\n\<]{0,30}"text1"|"text2"[^\n\<]{0,10})/gi,b=document.body;b.innerHTML=b.innerHTML.replace(p,%27$1<span style="background-color:LimeGreen;">$2</span>%27);})();
```
