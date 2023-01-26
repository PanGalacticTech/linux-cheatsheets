# Adding New SSH Key to Github

## On Local Machine

1. generate key against github email address

`$ ssh-keygen -t ed25519 -C "your_email@example.com"`

2. save keys in the _DEFAULT_ location! Press **Enter**
`> Enter a file in which to save the key (/c/Users/YOU/.ssh/id_ALGORITHM):[Press enter]`

3. Enter Passphrase

4. Add SSH private key to ssh-agent
`$ ssh-add ~/.ssh/{id_ed25519}`
Replace `{ }` with the file name you saved.

5. Add Key to GitHub by going into profile settings > SSH and GPG Keys. Click "New SSH Key"
6. Paste the entirety of the public key and save. 
