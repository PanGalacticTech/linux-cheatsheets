# Yes Actually a Windows CheatSheet - Sue Me

## Using PowerSheel (Win Equivilent of Bash)

### Network Tools

## Renew DHCP Licence

`ipconfig /renew`

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

###  Search all ips on network ### Look for str1 ### return all results that do not include str2

`arp -a | findstr "192.168.1." | findstr /V "255"`

## Find stringA in file
`findstr "113" "C:\Users\dheard\Documents\0000.REMOTE LABS\SBC_Testing\SBC_arp.csv"`
