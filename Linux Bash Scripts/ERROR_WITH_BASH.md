# Erros Running Bash Scripts?

"I had the same problem. Turned out the problem was \r\n line endings.

To fix it, do"



```tr -d "\r" < oldname.sh > newname.sh```

Solved