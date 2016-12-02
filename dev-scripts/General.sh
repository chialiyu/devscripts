#Recursive copy
cp -R ~/Downloads/SpringiA4_SourceCode ~/gitks/SpringA1_SourceCode/

#scp - copy directory to remote host
scp -r foo your_username@remotehost.edu:/some/remote/directory/bar
#scp - copy from remote to local .
scp -r ftinr02t@dseax0111.target.com:/work/CAE/fair-item/ .

## List complete file information
ls -G -al
ls -t

## Count all files in a directory
ls -1 | wc -l
#sort
ls sp*/done/ | sort -n | uniq -c | wc -l

## Display .gz file information
zcat
zmore
zless

#sort
ls sp*/done/ | sort -n | uniq -c | wc -l

## Find storage information
du -j --max-depth=1
df -Th
sudo du -chs /

man du (or df)

# Grant execution right
chmod +x getTgtCert.sh

## sudo, general, etc
# elevate to sudo level
sudo -i
#then you can do cd etc.


##############
# SSH
##############
#Remove key
ssh-keygen -R 10.63.223.189

#SSH
ssh cloud-user@10.63.170.46 -i ~/.vagrant.d/insecure_private_key -vvv

#Output public key from PEM file
openssl rsa -in cae-ci.pem -pubout -out cae-ci.pub

#Grep
grep -r -l "foo" ~/git

#search a specific pattern in a folder and recursively
grep -nwr -e "AirportLocationDAO" *
grep -nwr -e "AirportLocationDAO" .


## Search /etc/ directory for 'nameserver' word in all *.conf files ##
find /etc/ -type f -name "*.conf" -print0 | xargs -I {} -0 grep "nameserver" "{}"

find ~/git/ -type f -name "*.java" -print0 | xargs -I {} -0 grep "hdfs" "{}"

##############
# Bash commands
##############
#Dump all commands
history
#Reverse search commands history
Control-R

#Remove line
Control-U

#go back to the previous directory
cd -
#############
# Get IP Address
#############

netstat -i
ipconfig getifaddr en0
ipconfig getifaddr en1

#############
# diff tool
#############
gitk

#############
# Find path
#############
which gitk

#list all processes
ps -ef

###
# Check logs
###
tail -n100 <filename>

################
# vi cheatsheet http://www.lagmonster.org/docs/vi.html
################

## md5
MD5 (/Users/a554874/Downloads/locations_2016-02-09.xml) = 101a011d4e564894b0ec43b764458875

## Cat last 100 lines
per cat ~/Downloads/locations_2016-02-09.xml| rev | cut -c -100 | rev


###############
## SSL problem
###############
#https://github.com/Homebrew/homebrew/issues/32019
unset SSL_CERT_FILE
export SSL_CERT_FILE="" #unset SSL_CERT_FILE
#Generate ssh key pair
ssh-keygen -t rsa -b 4096 -C "svcaelr1@target.com" -f /Users/z037900/svcaelr1/id_rsa

##Curl
curl --user "caspyin" --request POST --data '{"description":"Created via API","public":"true","files":{"file1.txt":{"content":"Demo"}}' https://api.github.com/gists
curl --user "caspyin" --data @- https://api.github.com/gists
{
  "description":"Test",
  "public":false,
  "files": {
    "file1.txt": {
      "content":"Demo"
    }
  }
}
end with ctrl+d

## Curl with HTML header
curl -H "Content-Type: application/json" -H "authToken: 349ab29a-xtab-423b-a5hc-5623bc39b8c8" --data '{}' https://api.example.com/endpoint

## Curl without proxy
curl --noproxy '*' <URL>
curl --noproxy '*' -X GET -i http://localhost:8081/subjects/
