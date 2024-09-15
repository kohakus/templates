# compress with gpg
tar -zcvf - XXX | gpg --symmetric --cipher-algo aes256 -o XXX.tar.gz.gpg
gpg -d XXX.tar.gz.gpg | tar -zxvf -
