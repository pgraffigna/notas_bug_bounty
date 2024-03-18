# knockpy
python knock/knockpy.py -d $DOMAIN --recon --bruteforce --save ~/$DOMAIN/knockpy-$DOMAIN.log

#  crt-cli
./crt.sh -d $DOMAIN | ~/go/bin/httpx -sc -cl -td -method -ip -cname -o ~/$DOMAIN/httpx-$DOMAIN.log

# amass
~/go/bin/amass enum -active -d $DOMAIN -o ~/$DOMAIN/amass-$DOMAIN.log
~/go/bin/amass enum -passive -d $DOMAIN -o ~/$DOMAIN/amass-passive-$DOMAIN.log
~/go/bin/amass enum -d $DOMAIN -o ~/$DOMAIN/amass-$DOMAIN.log

# subfinder
~/go/bin/subfinder -dL $DOMAIN/subs.txt -oD $DOMAIN/subfinder-$DOMAIN.log

# massdns
/massdns/bin/massdns -r lists/resolvers.txt -t CNAME -o S -w massdns-CAME.txt ../../$DOMAIN/$DOMAIN.txt
/massdns/bin/massdns -r lists/resolvers.txt -t AAAA -o S -w ../../$DOMAIN/massdns-AAAA.txt ../../$DOMAIN/subfinder-$DOMAIN.log
/massdns/bin/massdns -r lists/resolvers.txt -t A -o S -w ../../$DOMAIN/massdns-A.txt ../../$DOMAIN/subfinder-$DOMAIN.log

# sublist3r
python sublist3r.py -d $DOMAIN -p 80,443 -o ~/$DOMAIN/sublist3r-$DOMAIN.log

# subzy // subdomain takeover
~/go/bin/subzy r --targets ~/$DOMAIN/subfinder-$DOMAIN.log
~/go/bin/subzy r --hide_fails --verify_ssl --targets ~/$DOMAIN/subfinder-$DOMAIN.log
---

## http/https checkers
# httprobe 
cat ~/$DOMAIN/subfinder-$DOMAIN.log | httprobe
cat ~/$DOMAIN/subfinder-$DOMAIN.log | httprobe --prefer-https
cat ~/$DOMAIN/subfinder-$DOMAIN.log | httprobe -p http:81 -p http:3000 -p https:3000 -p http:3001 -p https:3001 -p http:8000 -p http:8080 -p https:8443 -c 50 | tee httprobe-active-$DOMAIN.log

# httpx
~/go/bin/httpx -l $DOMAIN/subfinder-$DOMAIN.log -sc -cl -td -method -ip -cname -o ~/$DOMAIN/httpx-$DOMAIN.log
---

## fuzzers
# ffuf - discover files and directories
ffuf -ac -v -u $DOMAIN/FUZZ -w wordlist.txt
---

## crawlers
# LinkFinder // buscando vulns en archivos js
python3 linkfinder.py -d -i $DOMAIN

# jsfinder
echo '$DOMAIN' > subs.txt
cat subs.txt | ~/go/bin/jsfinder -read -o jsfinder-$DOMAIN

# katana - javascript finder
~/go/bin/katana -u $DOMAIN -kf -o ~/$DOMAIN/katana-$DOMAIN.log
~/go/bin/katana -u $DOMAIN -jc -d 2 | grep '.js$' | uniq | sort > ~/$DOMAIN/katana-$DOMAIN.log

# secretfinder
python SecretFinder.py -i ~/$DOMAIN/katana-$DOMAIN.log -o cli >> ~/$DOMAIN/secretfinder-$DOMAIN.log
---

## vuln scanner
# nuclei
subfinder -d $DOMAIN -silent | httpx | nuclei -t technologies/tech-detect.yaml
~/go/bin/nuclei -u $DOMAIN -l subs.txt -t ~/nuclei-templates/dns/ -mhe 5 -rl 50 -c 15 -v
~/go/bin/nuclei -u $DOMAIN -tags rce
~/go/bin/nuclei -u $DOMAIN -es info,low
~/go/bin/nuclei -ut # actualizar app + templates
~/go/bin/nuclei -tl # listar templates
~/go/bin/nuclei -u $DOMAIN -t ~/nuclei-wordfence-cve/nuclei-templates/ -c 10 -resume /home/vagrant/.cache/nuclei/resume-c6g.cfg
---

## s3 recon
./slurp-1.1.0-linux-amd64 domain -t $DOMAIN -p permutations.json -c 25

# recuperar todas los links de la pagina
console.table($$('a'),['href'])