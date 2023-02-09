# Adding New SSH Key to Github

## On Local Machine

1. generate key against github email address <br>

`$ ssh-keygen -t ed25519 -C "your_email@example.com"`

2. save keys in the _DEFAULT_ location! Press **Enter** <br>
`> Enter a file in which to save the key (/c/Users/YOU/.ssh/id_ALGORITHM):[Press enter]`

3. Enter Passphrase <br.

4. start the ssh-agent in the background <br>
 `$ eval "$(ssh-agent -s)"`
> Agent pid 59566

5. Add SSH private key to ssh-agent <br>
`$ ssh-add ~/.ssh/{id_ed25519}`
Replace `{ }` with the file name you saved.

6. Add Key to GitHub by going into profile settings > SSH and GPG Keys. Click "New SSH Key"


7. Paste the entirety of the public key and save. 


## Copying SSH key to remote server
```
ssh-copy-id -i ~/.ssh/mykey user@host
```

Note: Is unclear if should copy `mykey` or `mykey.pub` file. Went with `mykey.pub`
