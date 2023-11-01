function einherjar
    git config core.sshCommand 'ssh -o IdentitiesOnly=yes -i ~/.ssh/id_ed25519-sk -F /dev/null'
    git config user.signingKey '0xDDAC7E0DD0488D36!'
    git config user.email 'realeinherjar@proton.me'
    git config user.name Einherjar
end
