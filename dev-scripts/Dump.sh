1  exit
2  ls
3  mkdir loca-spark-cluster
4  rm loca-spark-cluster/
5  mkdir spark-cluster
6  ls
7  mv ./* spark-cluster/
8  mv * spark-cluster/
9  mv -r * ./spark-cluster/
10  mv --help
11  mv * ./spark-cluster/
12  mv * spark-cluster/
13  mv * ~/spark-cluster/
14  pwd
15  mv * /home/cloud-user/spark-cluster/
16  ls
17  cd spark-cluster/
18  ls
19  rmdir loca-spark-cluster/
20  docker-machine start default
21  sudo yum update
22  ls
23  cd spark-cluster/
24  ls
25   sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
26  [dockerrepo]
27  name=Docker Repository
28  baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
29  enabled=1
30  gpgcheck=1
31  gpgkey=https://yum.dockerproject.org/gpg
32  EOF
33  cd /etc/yum.repos.d/docker.repo
34  cd /etc/yum.repos.d
35  ls
36  cd ..
37  sudo yum install docker-engine
38  sudo service docker start
39  sudo docker run hello-world
40  cd ..
41  ls
42  cd usr
43  cd ..
44  cd home
45  ls
46  cd cloud-user/
47  ls
48  cd spark-cluster/
49  ld
50  ls
51  docker build -t cae/base-spark .
52  docker-machine start default
53  docker
54  docker-machine start default
55  docker on
56  service docker start
57  sudo service docker start
58  docker build
59  docker build -t cae/base-spark .
60  sudo docker build -t cae/base-spark .
61  docker-compose -f docker-compose.yml.multi up -d
62  sudo docker-compose -f docker-compose.yml.multi up -d
63  sudo curl -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
64  sudo chown -R $(whoami) /usr/local/bin
65  curl -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
66  chmod +x /usr/local/bin/docker-compose
67  sudo docker-compose -f docker-compose.yml.multi up -d
68  docker-compose --version
69  sudo docker-compose -f docker-compose.yml.multi up -d
70  docker-compose -f docker-compose.yml.multi up -d
71  cd spark-cluster/
72  docker-compose -f docker-compose.yml.multi up -d
73  sudo chkconfig docker on
74  sudo service docker start
75  docker-compose -f docker-compose.yml.multi up -d
76  echo $DOCKER_HOST
77  docker-compose --version
78  sudo docker run hello-world
79  docker-compose -f docker-compose.yml.multi up -d
80  sudo docker-machine start default
81  eval $(docker-machine env dev)
82  docker ps
83  sudo service docker start
84  eval $(docker-machine env dev)
85  sudo docker-machine
86  eval $(docker-machine env --no-proxy default)
87  docker-machine ls
88  docker --version
89  sudo usermod -aG docker $(whoami)
90  sudo systemctl start docker.service
91  sudo docker-machine
92  docker-compose --version
93  sudo systemctl start docker.service --verbose
94  sudo systemctl start docker.service -verbose
95  sudo service docker status
96  sudo docker daemon
97  sudo rm /var/run/docker.pid
98  sudo docker daemon
99  sudo docker-machine start default
100  curl -L https://github.com/docker/machine/releases/download/v0.6.0/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine && chmod +x /usr/local/bin/docker-machine
101  chmod +x /usr/local/bin/docker-machine
102  sudo docker-machine start default
103  docker-machine version
104  docker-machine start default
105  eval "$(docker-machine env default)"
106  docker-machine default
107  docker-machine env default
108  docker-machine ls
109  cd spark-cluster/
110  docker-compose -f docker-compose.yml.multi up -d
111  docker-machine
112  docker-machine start default
113  docker ps
114  docker exec -t 8b7e1ea9570d bash
115  docker inspect 8b7e1ea9570d
116*
117  docker inspect 8b7e1ea9570d /bin/bash
118* docker inspect 8b7e1ea9570d ba
119  docker exec -t 8b7e1ea9570d /bin/bash
120  docker-compose -f docker-compose.yml.multi kill -d
121  docker-compose -f docker-compose.yml.multi stop -d
122  docker-compose -f docker-compose.yml.multi kill
123  docker-compose -f docker-compose.yml.multi up -d
124  docker ps
125  docker exec -it 9f72d5ab423b bash
126  history
