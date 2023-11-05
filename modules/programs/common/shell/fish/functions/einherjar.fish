function einherjar
    git config core.sshCommand 'ssh -o IdentitiesOnly=yes -i ~/.ssh/id_ed25519-sk -F /dev/null'
    git config user.signingKey '0x7D8FCB8DE55EF33F!'
    git config user.email 'realeinherjar@proton.me'
    git config user.name Einherjar
end
