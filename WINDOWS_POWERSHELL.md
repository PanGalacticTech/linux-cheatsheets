# Yes Actually a Windows CheatSheet - Sue Me

## Using PowerSheel (Win Equivilent of Bash)

### Network Tools

#### Find Hostname

`cmd /k hostname`


### Looping Commands in Powershell

```
while ($true) {
  my_command;
}
```
Example - Loop SSH Attempts till connect

```
while ($true) {
ssh pi@piog.local
}
```


