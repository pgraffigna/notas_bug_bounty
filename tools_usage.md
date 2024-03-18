## knockpy
```command
python knock/knockpy.py -d $DOMAIN --recon --bruteforce --save ~/$DOMAIN/knockpy-$DOMAIN.log
```

## crt-cli
```command
crt.sh -d $DOMAIN | ~/go/bin/httpx -sc -cl -td -method -ip -cname -o ~/$DOMAIN/httpx-$DOMAIN.log
```

## amass
```command
go/bin/amass enum -active -d $DOMAIN -o ~/$DOMAIN/amass-$DOMAIN.log
go/bin/amass enum -passive -d $DOMAIN -o ~/$DOMAIN/amass-passive-$DOMAIN.log
go/bin/amass enum -d $DOMAIN -o ~/$DOMAIN/amass-$DOMAIN.log
```

## subfinder
```command
go/bin/subfinder -dL $DOMAIN/subs.txt -oD $DOMAIN/subfinder-$DOMAIN.log
```

## massdns
```command
massdns/bin/massdns -r lists/resolvers.txt -t CNAME -o S -w massdns-CAME.txt ../../$DOMAIN/$DOMAIN.txt
massdns/bin/massdns -r lists/resolvers.txt -t AAAA -o S -w ../../$DOMAIN/massdns-AAAA.txt ../../$DOMAIN/subfinder-$DOMAIN.log
massdns/bin/massdns -r lists/resolvers.txt -t A -o S -w ../../$DOMAIN/massdns-A.txt ../../$DOMAIN/subfinder-$DOMAIN.log
```

## sublist3r
```command
python sublist3r.py -d $DOMAIN -p 80,443 -o ~/$DOMAIN/sublist3r-$DOMAIN.log
```

## subzy 
```command
go/bin/subzy r --targets ~/$DOMAIN/subfinder-$DOMAIN.log
go/bin/subzy r --hide_fails --verify_ssl --targets ~/$DOMAIN/subfinder-$DOMAIN.log
```

## httprobe 
```command
cat subfinder-$DOMAIN.log | httprobe
cat subfinder-$DOMAIN.log | httprobe --prefer-https
cat subfinder-$DOMAIN.log | httprobe -p http:81 -p http:3000 -p https:3000 -p http:3001 -p https:3001 -p http:8000 -p http:8080 -p https:8443 -c 50 | tee httprobe-active-$DOMAIN.log
```

## httpx
```command
go/bin/httpx -l $DOMAIN/subfinder-$DOMAIN.log -sc -cl -td -method -ip -cname -o ~/$DOMAIN/httpx-$DOMAIN.log
```

## ffuf 
```command
ffuf -ac -v -u $DOMAIN/FUZZ -w wordlist.txt
```

## linkfinder
```command
python3 linkfinder.py -d -i $DOMAIN
```

## jsfinder
```command
echo '$DOMAIN' > subs.txt
cat subs.txt | ~/go/bin/jsfinder -read -o jsfinder-$DOMAIN
```

## katana 
```command
go/bin/katana -u $DOMAIN -kf -o ~/$DOMAIN/katana-$DOMAIN.log
go/bin/katana -u $DOMAIN -jc -d 2 | grep '.js$' | uniq | sort > ~/$DOMAIN/katana-$DOMAIN.log
```

## secretfinder
```command
python SecretFinder.py -i ~/$DOMAIN/katana-$DOMAIN.log -o cli >> ~/$DOMAIN/secretfinder-$DOMAIN.log
```

## nuclei
```command
subfinder -d $DOMAIN -silent | httpx | nuclei -t technologies/tech-detect.yaml
go/bin/nuclei -u $DOMAIN -l subs.txt -t ~/nuclei-templates/dns/ -mhe 5 -rl 50 -c 15 -v
go/bin/nuclei -u $DOMAIN -tags rce
go/bin/nuclei -u $DOMAIN -es info,low
go/bin/nuclei -ut 
go/bin/nuclei -tl 
go/bin/nuclei -u $DOMAIN -t ~/nuclei-wordfence-cve/nuclei-templates/ -c 10 -resume /home/vagrant/.cache/nuclei/resume-c6g.cfg
```

## s3 recon
```command
slurp-1.1.0-linux-amd64 domain -t $DOMAIN -p permutations.json -c 25
```

## recuperar todas los links de la pagina
```command
console.table($$('a'),['href'])
```