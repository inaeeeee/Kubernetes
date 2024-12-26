ING_HTTP_PORT=$(kubectl get svc ingress-nginx-controller -n ingress-nginx | tail -n +2 | awk '{print $5}' | sed -e 's/80://' -e 's/443://' -e 's;/TCP;;g' | awk -F, '{print $1}')
ING_HTTPS_PORT=$(kubectl get svc ingress-nginx-controller -n ingress-nginx | tail -n +2 | awk '{print $5}' | sed -e 's/80://' -e 's/443://' -e 's;/TCP;;g' | awk -F, '{print $2}')
# /etc/hosts 파일에 이름 추가
DOMAIN=https-example.foo.com
if ! egrep "$DOMAIN" /etc/hosts; then   echo "$ING_IP  $DOMAIN" >> /etc/hosts; fi
# 실행할 명령어 형식 예시 보여주기
cat << EOF
###########################################
curl -vl -k https://$DOMAIN:$ING_HTTPS_PORT
curl -k https://$DOMAIN:$ING_HTTPS_PORT
###########################################
EOF

curl -vl -k https://https-example.foo.com:32686
kubectl delete 0f .
kubectl delete -f .
mkdir -p ~/kube/09/label && cd ~/kube/09/label
kubectl get pods
kubectl run cmd-pod --image=nginx --port=80
kubectl get pods --show labels
kubectl get pods --show-labels
touch nolabel-pod.yml
kubectl apply -f nolabel-pod.yml
cp nolabel-pod.yml label-pod.yml
kubectl apply -f label-pod.yml
kubectl get pods -l name=mainui
c
kubectl get pods --show-labels
kubectl get nolabel-pod -o yaml
kubectl label pod nolabel-pod name=test
kubectl get pods --show-labels
kubectl label pod nolabel-pod name=login
kubectl label pod nolabel-pod name=login --overwrite
kubectl label pod cmd-pod name=order rel=stable
kubectl get pods --show-labels
kubectl label pod cmd-pod run-
kubectl get pods --show-labels
kubectl label pod cmd-pod rel=beta --overwrite
kubectl get pods --show-labels
kubectl get pods -l name=login
kubectl get pods -l name=stable
kubectl get pods -l rel=stable
c
kubectl get nodes --show-labels
kubectl get nodes -L disk.gpu
kubectl get nodes --show-labels
c
kubectl label nodes noe1.example.com gpu=true disk=ssd
kubectl label nodes node1.example.com gpu=true disk=ssd
kubectl label nodes node2.example.com gpu=true 
kubectl label nodes node3.example.com disk=ssd
kubectl get nodes --show-labels
mkdir -p ~/kube/09/nodelabel && cd ~/kube/09/nodelabel
touch nodeselector.yml
kubectl apply -f nodeselector.yml
cp nodeselector.yml wrong_nodeselector.yml 
kubectl apply -f wrong_nodeselector.yml
c
rmpod
mkdir -p ~/kube/09/annotations && cd ~/kube/09/annotations
vi pod-annotation.yml
kubectl apply -f pod-annotation.yml
kubectl get pods 
kubectl describe pods pod-annotation | head -20
cd ~/kube/06/deploy/
ls
cd -
ls
cp ~/kube/06/deploy/rollingupdate-deploy2.yml rollingupdate-deploy2.yml.STUDY
ls
cat rollingupdate-deploy2.yml.STUDY
kubectl delete pods pod-annotation
c
mkdir -p ~/kube/09/canary && cd ~/kube/09/canary
kubectl get pods
touch mainui-stable.yml
kubectl apply -f .
kubectl get pods
kubectl get pods -L app
touch mainui-service.yml 
kubectl apply -f .
curl 10.100.116.81
c
kubectl describe service/mainui
cp mainui-stable.yml mainui-canary.yml
kubectl apply -f mainui-canary.yml
curl 10.100.116.81:80
c
kubectl describe svc mainui-svc
kubectl describe svc mainui
kubectl scale deploy mainui-canary --replicas=2
kubectl scale deploy mainui-stable --replicas=1
curl 10.100.116.81:80
kubectl scale deploy mainui-stable --replicas=1
curl 10.100.116.81:80
c
kubectl scale deploy mainui-canary --replicas=3
kubectl scale deploy mainui-stable --replicas=0
kubectl delete deployment.apps mainui-stable
kubectl delete -f .
mkdir -p ~/kube/09/blue-green && cd ~/kube/09/blue-green
touch blue-green-svc.yml
touch blue.yml
touch green.yml
kubectl apply -f .
kubectl edit service/blue-green-svc
kubectl get svc -o wide
kubectl apply -f blue-green-svc.yml
kubectl get svc blue-green-svc -o wide
kubectl delete -f .
mkdir -p ~/kube/09/rolling && cd ~/kube/09/rolling
c
touch rolling-svc.yml
touch rolling-deploy.yml
kubectl apply -f .
kubectl get all
kubectl get deploy -o wide
kubectl apply -f .
kubectl rollout history deploy rolling-deploy
kubectl rollout undo deploy rolling-deploy
kubectl get deploy rolling-deploy -o wide
kubectl delete -f .
c
mkdir -p ~/kube/10/cm && cd ~/kube/10/cm
mkdir -p ~/kube/10/cm/config 
vi config/nginx.conf 
kubectl create cm test-config --from-literal INTERVAL=2 --from-literal OPTION=boy --from-file=config/
kubectl get cm
exit
cd ~?.kube/11/mongodb
cd ~/.kube/11/mongodb
cd ~/kube/11/mongodb
cat mongo-secret.yml
kubectl apply -f .
c
kubectl get deployment mongodb-deployment
kubectl apply -f mongo.ym
kubectl get deployment mongodb-deploy
kubectl get all
kubectl apply -f mongo.yml
kubectl get service -o wide
kubectl apply -f mongo-configmap.yml
kubectl get pods
kubectl logs mongodb-express-669f54c775-44pg5
kubectl delete -f .
mongodb-express-669f54c775-44pg5
ls
kubectl apply -f mongo-secret.yml
kubectl apply -f mongo.yml
kubectl get deployment mongodb-deploy
kubectl get all
kubectl apply -f mongo.yml
kubectl describe service mongodb-svc
kubectl apply -f mongo.yml
kubectl describe service mongodb-svc
kubectl get all
ls
kubectl apply -f mongo-configmap.yml
kubectl apply -f mongo-express.yml
kubectl get pods
kubectl apply -f mongo-express.yml
kubectl get pods
kubectl apply -f mongo-express.yml
kubectl get pods
kubectl delete -f .
clear
kubectl apply -f .
kubectl get pods
kubectl logs mongodb-express-6cfbc86cb6-bx66m
c
kubectl get service
kubectl apply -f mongo-express.yml
kubectl get service
mongodb-express-6cfbc86cb6-bx66m
firefox http://192.168.10.11:30000 &
kubectl delete -f .
cd
exit
clear
echo -n "username" | base64
echo -n 'password' | base64
mkdir -p ~/kube/11/mongodb && cd ~/kube/11/mongodb
vi mongo-secret.yml
ls
kubectl create -f mongo-secret.yml
kubectl get secrets mongo-secret -o yaml
clear
kubectl create secret generic --from-literal username='username' --from-literal password='password' --dry-run=client -o yaml
kubectl create secret generic mongodb-secret --from-literal username='username' --from-literal password='password' --dry-run=client -o yaml
clear
touch mongo.yml
kubectl appliy -f .
kubectl apply -f .

ls
kubectl apply -f .
clear
kubectl apply -f .
c
kubectl apply -f .
c
kubectl apply -f .
touch mongo-configmap.yml
cl
c
kubectl apply -f .
kubectl get cm mongodb-configmap -0 yaml
kubectl get cm mongodb-configmap -o yaml
c
kubectl get cm mongodb-configmap -o yaml
touch mongo-express.yml
kubectl get cmmm mongodb-configmap -o yaml
kubectl get cm mongodb-configmap -o yaml
kubectl appply -f .
kubectl apply -f .
c
kubectl apply -f .
firefox http://192.168.10.11:30000 &
firefox http://10.101.246.238:8081 &
kubectl delete -f .
c
kubectl get cm,secrets,po,rs,deploy,svc -o wide
mkdir ~/kube/11/postgres && cd ~/kube/11/postgres
c
touch db-secret-deploy-svc.yml
touch adminer-deploy-svc.yml
kubectl apply -f .
c
kubectl apply -f .
c
kubectl apply -f .
kubectl get svc
firefox http://10.106.87.137:8080 &
kubectl delete -f .
c
cd
echo -n 'username' | base64
dXNlcm5hbWU=
echo -n 'password' | base64
cd ~/kube/11/mongodb
kubectl apply -f mongo-secret.yml
kubectl apply -f mongo.yml
kubectl get deployment mongodb-deployment
kubectl apply -f mongo.yml
kubectl get service -o wide
kubectl describe service mongodb-service
kubectl apply -f mongo-configmap.yml
kubectl apply -f mongo-express.yml
kubectl get pods
kubectl logs mongodb-express-6cfbc86cb6-w5p55
kubectl apply -f mongo-express.yml
c
kubectl get service
firefox http://10.107.182.180:8081 &
kubectl delete -f .
c
exit
watch 'kubectl get all,secret -o wide'
watch 'kubectl get all,cm,secret -o wide'
watch 'kubectl get cm,secrets,po,rs,deploy,svc -o wide'
watch 'kubectl get all,cm,secret -o wide'
# (master)
for i in node1 node2 node3; do     ssh $i "mkdir -p /webdata";     NODENAME=$(echo $i | tr '[a-z]' '[A-Z]');     ssh $i "echo $NODENAME > /webdata/index.html"; done
#  웹페이지 확인
for I in node1 node2 node3; do     ssh “$i” cat /webdata/index.html; done
c
mkdir -p ~/kube/12/storage && cd ~/kube/12/storage
vi hostpath.yml
kubectl apply -f hostpath.yml
kubectl get pods -o wide
curl 172.16.221.2
kubectl delete pods web
kubectl get all,cm,secret -o wide
exit
kubectl get all -o wide
kubectl get pods
kubectl get pod
c
kubectl get all -o wide
watch'kubectl get all -o wide'
watch 'kubectl get all -o wide'
watch 'kubectl get all,pv,pvc -o wide'
watch 'kubectl get all -n kube-system'
watch kubectl get all,hpa -o wide --show-labels
watch 'kubectl get nodes -L gpu : echo : kubectl pod -o wide --show-labels'
watch 'kubectl get nodes -L gpu ; echo ; kubectl pod -o wide --show-labels'
watch 'kubectl get nodes -L gpu ; echo ; kubectl get pod -o wide --show-labels'
exit
# (master)
for i in node1 node2 node3; do     ssh $i "mkdir -p /webdata";     NODENAME=$(echo $i | tr '[a-z]' '[A-Z]');     ssh $i "echo $NODENAME > /webdata/index.html"; done
cl
clear
cd /root/kube/12/storage
ls
touch empty.yml
kubectl apply -f empty.yml
kubectl get pods -o wide
curl 172.16.221.1
kubectl exec empty-pod -it -- /bin/bash
curl 172.16.221.1
c
kubectl deleete pod empty-pod
kubectl delete pod empty-pod
cd
c
# (master)
# Worker Node 전체에 NFS 드라이버(nfs-utils 패키지) 설치 - CentOS 9버전에서
for i in node1 node2 node3; do     ssh "$i" 'yum -y install nfs-utils';     ssh "$i" "echo 'modprobe {nfs,nfsd,rpcsec_gss_krb5}' >> /etc/rc.d/rc.local";     ssh "$i" 'chmod 755 /etc/rc.d/rc.local';     ssh "$i" 'modprobe {nfs,nfsd,rpcsec_gss_krb5}'; done
clear
yum -y install nfs-utils
c
showmount -e 192.168.10.15
cd ~/kube/12/storage
touch nfs.yml
kubectrl apply -f nfs.yml
kubectl apply -f nfs.yml
kubectl get pods -o wide
curl 172.16.221.4
kubectl delete -f nfs.yml
kubectl apply -f nfs.yml
kubectl get pods -o wide
curl 172.16.178.239
kubectl delete -f nfs.yml
c
kubectl get pv
mkdir -p ~/kube/12/pv && cd ~/kube/12/pv
touch pv.yml
kubectl apply -f pv.yml
kubectl get pv
cd ~/kube/12/pv 
clear
touch pvc.yml
kubectl apply -f pvc.yml
clear
kkubectl get pvc
kubectl get pvc
touch pvc-web-pod.yml
kubectl apply -f pvc-web-pod.yml 
kubectl get pods
kubectl get all -o wide
curl 172.16.178.240
kubectl get pvc
kubectl edit pvc pvc-web
kubectl delete -f pvc-web-pod.yml 
kubectl delete -f pvc.yml
kubectl apply -f pvc.yml
kubectl get pvc
c
kubectl apply -f pvc-web-pod.yml
kubectl delete -f .
clear
kubectl top nodes
kubectl top pods
kubectl get nodes -o wide
mkdir ~/kube/13/hpa/metric-server && cd ~/kube/13/hpa/metric-server
mkdir -p ~/kube/13/hpa/metric-server && cd ~/kube/13/hpa/metric-server
c
wget  https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/high-availability-1.21+.yaml
ls
wget https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
vi components.yaml
kubectl apply -f components.yaml
clear
kubectl top nodes
c
kubectl top pods -A
c
mkdir -p ~/kube/13/hpa && cd ~/kube/13/hpa
ls
vi deploy-web.yml
kubectl apply -f deploy-web.yml
kubectl version 
vi hpa-web.yml
kubectl apply -f hpa-web.yml
kubectl get hpa
kkubectl get svc
kubectl get svc
curl 10.99.194.197
while true; do curl 10.99.194.197; done
kubectl delete -f hpa-web.yml -f deploy-web.yml]
kubectl delete -f hpa-web.yml -f deploy-web.yml
clear
cd
kubectl get nodes
kubectl get nodes --show-labels
kubectl label nodes node1.example.com disktype=ssd
kubectl get nodes node1.example.com --show-labels
kubectl label nodes node1.example.com disktype-
kubectl label node node{2,3}.example.com apu=true
kubectl get nodes -L gpu
mkdir -p ~/kube/14/nodeSelector && cd ~/kube/14/nodeSelector
vi tensorflow-gpu.yml
kubectl apply -f tensorflow-gpu.yml
ls
kubectl get pods -o wide
exit
mkdir -p ~/kube/14/nodeAffinity && cd ~/kube/14/nodeAffinity
kubectl label node node{1,2} disktype=ssd
kubectl label node node{1,2}example.com disktype=ssd
kubectl label node node{1,2}.example.com disktype=ssd
kubectl get node -L gpu,disktype
vi tensorflow-gpu-ssd.yml
 kubectl apply -f tensorflow-gpu-ssd.yml
kubectl delete -f tensorflow-gpu-ssd.yml
 kubectl apply -f tensorflow-gpu-ssd.yml
kubectl get pods -o wide
c
kubectl delete -f tensorflow-gpu-ssd.yml
kubectl label node node2 disktype-
kubectl label node node2.example.com disktype-
kubectl label node node3.example.com disktype=ssd
kubectl delete -f tensorflow-gpu-ssd.yml
kubectl label node node{1..3}.example.com disktype-
kubectl label node node{1..3}.example.com gpu-
mkdir -p ~/kube/14/podAffinity && cd ~/kube/14/podAffinity
kubectl run backend --image=busybox -l app=backend -- sleep 1d 
kubectl get pods -o wide --show-labels
c
vi pod-affinity.yml
kubectl apply -f pod-affinity.yml
kubectl delete -f pod-affinity.yml
vi pod-antiaffinity.yml
kubectl apply -f pod-antiaffinity.yml
kubectl delete -f pod-antiaffinity.yml
kubectl delete pod backend
c
kubectl get pod -A
c
kubectl describe nodes master.example.com | grep -i taint -A 1
kubectl run testpod --image=nginx --port=80
kubectl get pods testpod -o yaml | grep tolerations -A 8
kubectl get nodes
kubectl get nodes -o yaml | egrep 'node.kubernetes.io/not-ready|node.kubernetes.io/unreachable'
kubectl get nodes -o yaml | egrep 'node-role.kubernetes.io/master|node-role.kubernetes.io/control-plane'
kubectl get pods etcd-master.example.com -n kube-system -o yaml
kubectl get pods etcd-master.example.com -n kube-system -o yaml | grep -i 'toleration'
kubectl get pods etcd-master.example.com -n kube-system -o yaml | grep -i 'toleration' -A 8
kubectl get pods kube-apiserver-master.example.com -n kube-system -o yaml | grep -i 'toleration' -A 8
mkdir -p ~/kube/14/taint_toleration && cd ~/kube/14/taint_toleration
kubectl taint nodes node1.example.com role=web:NoSchedule
kubectl taint nodes node2.example.com role=web:NoSchedule
kubectl describe nodes node{1..3}.example.com | grep -A 1 -i taint
vi nginx-deploy.yml
kubectl apply -f nginx-deploy.yml
kubectl get pods -o wide
kubectl delete -f nginx-deploy.yml
cp nginx-deploy.yml nginx-toleration-deploy.yml
vi nginx-toleration-deploy.yml
kubectl apply -f nginx-toleration-deploy.yml
kubectl taint nodes node1.example.com role-
kubectl taint nodes node2.example.com role-
kubectl describe nodes node{1..3}.example.com | grep -A 4 -i taint
kubectl describe nodes master.example.com | grep -A 1 -i taint 
c
kubectl delete -f nginx-toleration-deploy.yml
rmpod
kubectl taint nodes master.example.com node-role.kubernetes.io/control-plane-
kubectl taint nodes master.example.com node-role.kubernetes.io/master-
ls
kubectl apply -f nginx-deploy.yml
kubectl delete -f nginx-deploy.yml
kubectl taint nodes master node-role.kubernetes.io/control-plane:NoSchedule
kubectl taint nodes master.example.com node-role.kubernetes.io/control-plane:NoSchedule
c
mkdir -p ~/kube/14/cordon_drain && cd ~/kube/14/cordon_drain
kubectl get pods
kubectl cordon node2.example.com
vi nginx-deploy.yml
kubectl get nodes
kubectl apply -f nginx-deploy.yml
kubectl uncordon node2.example.com
kubectl get no
kubectl run testpod --image=nginx --port=80
kubectl delete -f nginx-deploy.yml
kubectl delete pods testpod 
c
cd ~/kube/14/cordon_drain 
 kubectl apply -f nginx-deploy.yml
kubectl run db --image=redis 
kubectl drain node1.example.com
kubectl drain node1 --ignore-daemonsets --force --delete-emptydir-data
kubectl drain node1.example.com --ignore-daemonsets --force --delete-emptydir-data
kubectl get pods -o wide
c
kubectl get pods -o wide
kubectl uncordon node1.example.com
kubectl run testpod --image=nginx --port=80
kubectl run testpod2 --image=nginx --port=80
kubectl delete -f nginx-deploy.yml
kubectl delete pods testpod testpod2
kubectl delete pods pod
kubectl delete pods db
c
kubectl label node node{2,3}.example.com disktype=ssd
kubectl label node node1.example.com disktype=hdd
kubectl label node node{1,3}.example.com gpu=true
kubectl label node node2.example.com gpu=false
c
mkdir -p ~/kube/14/project5 && cd ~/kube/14/project5
vi tensorflow.yml
kubectl apply -f tensorflow.yml
touch mongo.yml
kubectl apply -f mongo.yml
kubecl delete -f mongo.yml
kubectl delete -f mongo.yml
kubectl apply -f mongo.yml
kubectl get pod -o wide
c
cd
kubectl get nodes -o wide
cd ..
cd
cd -
cd
cd /kube/14/project5
cd ~/kube/14/project5
ls
kubectl delete -f mongo.yml
kubectl delete -f tensorflow.yml
c
cd
c
kubectl get nodes
kubectl config view
id
cat ~/.kube/config
kubectl label node node{1..3}.example.com gpu-
kubectl label node node{1..3}.example.com disktype-
cd
mkdir -p ~/kube/15/useradd && cd ~/kube/15/useradd
c
openssl genrsa -out myuser.key 2048
ls
file *
cat myuser.key
openssl req -new -key myuser.key -out myuser.csr -subj "/CN=myuser"
ls
c
cat myuser.csr | base64 | tr -d "\n"
cat << EOF > csr-myuser.yml
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: myuser
spec:
  request: $(cat myuser.csr | base64 | tr -d "\n")
  signerName: kubernetes.io/kube-apiserver-client
  expirationSeconds: 864000  # one day: 86400, 10 days: 864000
  usages:
  - client auth
EOF

ls
cat csr-myuser.yml
kubectl apply -f csr-myuser.yml
kubectl certificate approve myuser
kubectl get csr myuser -o yaml
kubectl get csr myuser -o jsonpath='{.status.certificate}'| base64 -d > myuser.crt
ls
c
ls
kubectl get sa
kubectl run testpod --image=nginx --port=80
kubectl get pods testpod -o yaml
c
kubectl create sa pod-viewer
kubectl get sa
kubectl get pods testpod -o yaml > testpod.yml
vi testpod.yml
kubectl delete pods testpod
kubectl apply -f testpod.yml
kubectl get pods testpod -o yaml
kubectl exec -it testpod -- /bin/bash
c
kubectl create role developer --verb=create --verb=get --verb=list --verb=update --verb=delete --resource=pods
kubectl get role developer -o yaml
kubectl describe role developer
kubectl create rolebinding developer-binding-myuser --role=developer --user=myuser --dry-run=client -o yaml
kubectl create rolebinding developer-binding-myuser --role=developer --user=myuser --dry-run=client -o yaml
kubectl describe rolebindings developer-binding-myuser
kubectl create rolebinding developer-binding-myuser --role=developer --user=myuser
c
kubectl config view
kubectl config set-credentials myuser --client-key=myuser.key --client-certificate=myuser.crt --embed-certs=true
kubectl config view
kubectl config get-contexts
kubectl config set-context myuser --cluster=kubernetes --user=myuser
kubectl config get-contexts
kubectl config view
kubectl config get-contexts
kubectl config set-context myuser
kubectl config get-contexts
kubectl config use-context myuser
kubectl config view
kubectl config get-contexts
kubectl get services
kubectl get nodes
kubectl get pvc
ubectl get pods -n kube-system
kubectl get pods -n kube-system
kubectl get pods
kubectl delete pods testpod
kubectl get pods
kubectl run myweb --image=nginx --port=80 
kubectl get pods
kubectl config current-context
kubectl config get-context
kubectl config use-context kubernetes-admin@cluster.local
kubectl config use-context kubernetes-admin@kubernetes
kubectl config get-context
kubectl config set-context
kubectl config get-contexts
kubectl get role,rolebindings
kubectl delete rolebinding developer-binding-myuser
kubectl delete role developer
kubectl config get-contexts
kubectl config set-context mycontext --cluster=kubernetes --user=kubernetes-admin
kubectl config use-context mycontext
 kubectl config view 
kubectl get all -A
kubectl config use-context kkubernetes-admin@kubernetes
kubectl config use-context kubernetes-admin@kubernetes
kubectl config get-contexts
exit
watch 'kubectl get pod -o wide --show-labels'
watch 'kubectl get pod -o wide --show-labels ; echo ; kubectl get node -L gpu,disktype'
watch 'kubectl get pod -o wide'
watch 'kubectl get no,po -o wide'
watch 'kubectl get no -L disktype,gpu ; echo ; kubectl label'
watch 'kubectl get no -L disktype,gpu'
watch 'kubectl get no -L disktype,gpu ; echo ; kubectl get po -o wide'
c
watch 'kubectl get csr'
watch 'kubectl get all -o wide'
exit
kubectl config view
kubectl create clusterrole developer --resource=pods --verb=create --verb=get --verb=list --verb=watch --verb=update --verb=delete 
c
kubectl get clusterrole
kubectl get clusterrole | grep seveloper
kubectl get clusterrole | grep developer
kubectl get clusterrole | grep myuser
kubectl get clusterrolebinding.rbac.authorization.k8s.io | grep developer
kubectl describe clusterrolebindings.rbac.authorization.k8s.io | grep developer
kubectl create clusterrolebinding developer-binding-myuser --clusterrole=developer --user=myuser
kubectl config user-ontext myuser
kubectl config user-context myuser
kubectl config use-context myuser
c
kubectl confing current-context
kubectl config current-context
kubectl config get-contexts
kubectl config use-context kubernetes-admin@kubernetes
kubectl get clusterrolebinding
kubectl get clusterrolebinding | grep develop
kubectl delete clusterrolebinding developer-binding-myuser
kubectl get clusterrole
kubectl get clusterrole | grep develop
kubectl delete clusterrole developer
kubectl config get-contexts
kubectl fet csr
kubectl get csr
kubectl get sa
kubectl delete pods --all
c
kubectl get clusterrole
kubectl get clusterrole view
kubectl get clusterrole view -o yaml
kubectl get clusterrolebinding devel
kubectl get clusterrolebinding 
kubectl get clusterrolebinding | grep developer
kubectl create clusterrolebinding developer-binding-myuser --user=myuser --clusterrole=view 
kubectl get clusterrole | grep admin
kubectl describe clusterrole | grep admin
kubectl describe clusterrole cluster-admin

kubectl delete clusterrolebinding developer-binding-myuser
kubectl create clusterrolebinding developer-binding-myuser --user=myuser --clusterrole=cluster-admin
c
mkdir -p ~/kube/15/labs && cd ~/kube/15/labs
exit
eixt
exit
# (On-premise) master
# Node Labels 설정
kubectl label node node1.example.com disktype=ssd
kubectl label node node2.example.com disktype=hdd
kubectl label node node3.example.com disktype=hdd
# Pod 실행
kubectl run testpod --image=nginx --port=80 
# Deploy 실행
kubectl create deploy testdeploy --image=nginx --port=80 --replicas=5
c
kubectl get nodes
kubectl drain node1.example.com
kubectl drain node1.example.com --force --ignore-daemonsets
# (On-premise) master
kubectl label node node1.example.com disktype-
kubectl label node node2.example.com disktype-
kubectl label node node3.example.com disktype-
kubectl delete pod testpod
kubectl delete deploy testdeploy
kubectl uncordon node1
# (On-premise) master 
kubectl label node node1.example.com disktype-
kubectl label node node2.example.com disktype-
kubectl label node node3.example.com disktype-
kubectl delete pod testpod
kubectl delete deploy testdeploy
kubectl uncordon node1.example.com
c
# (On-premise)
# node3 Power OFF
ssh node3 'systemctl disable --now kubelet'
# node2 taint 설정
kubectl taint node node2.example.com key1=value1:NoSchedule
# 작업 디렉토리 생성
mkdir -p /var/CKA2023
c
kubectl describe node master.example.com
kubectl describe node node1.example.com | grep -i noschedule
kubectl describe node node2.example.com | grep -i noschedule
kubectl describe node master.example.com | grep -i noschedule
kubectl describe nodes
kubectl describe nodes | grep -i noschedule
echo 1 > /var/CKA2023/RN0001
kubectl top nodes
kubectl config get-contexts
kubectl get nodes
kubectl get pods
kubectl uncordon node3.example.com
kubectl get pods
kubectl get nodes
kubectl get pods -A
kubectl get pods -A -o wide
clear
ssh node3
clear
kubectl get pods -A
kubectl top nodes
clear
kubectl top pods
# (On-premise) master
kubectl config set-context hk8s --user=kubernetes-admin --cluster=cluster.local 
# Comment out when killercode environment.
# kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
# 작업 폴더 생성
mkdir -p /var/CKA2023
# 파드 실행
kubectl apply -f - <<EOF
kind: Pod
apiVersion: v1
metadata:
  name: campus-01
  labels:
    name: overloaded-cpu
spec:
  containers:
  - name: campus-container
    image: busybox
    command:
      - "/bin/sh"
      - "-c"
      - >
        a=1;
        while true;
        do
          a=$(expr a + 1);
        done;
    resources:
      requests: 
        memory: "64Mi"
        cpu: "250m"
      limits:
        memory: "128Mi"
        cpu: "1"
EOF

kubectl apply -f - <<EOF
kind: Pod
apiVersion: v1
metadata:
  name: fast-01
  labels:
    name: overloaded-cpu
spec:
  containers:
  - name: fast-container
    image: busybox
    command:
      - "/bin/sh"
      - "-c"
      - >
        a=1;
        while true;
        do
          a=$(expr a + 1);
          sleep 0.001
        done;
    resources:
      requests: 
        memory: "64Mi"
        cpu: "250m"
      limits:
        memory: "128Mi"
        cpu: "1"
EOF

echo "[  OK  ] Please wait a minute."
sleep 20
c
kubectl top pods
kubectl top pods -l name=overloaded-cpu
kubectl top pods -l name=overloaded-cpu --sort-by=cpu
echo 'campus-01' > /var/CKA2023/cpu_load_pod.txt
exit
watch 'kubectl get nodes -o wide'
exit
gedit &
# 1) On-premise
kubectl config set-context k8s --user=kubernetes-admin --cluster=cluster.local 
# 2) killercoda
# kubectl config set-context k8s --user=kubernetes-admin --cluster=kubernetes 
# Deployment + Service 생성
kubectl apply -f - <<EOF
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: appjs
  namespace: ingress-nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: appjs
  template:
    metadata:
      labels:
        app: appjs
    spec:
      containers:
      - image: whatwant/node-web:2.0
        name: appjs
        ports:
        - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: appjs-service
  namespace: ingress-nginx
spec:
  ports:
  - port: 80
    targetPort: 8080
  selector:
    app: appjs
EOF

clear
kubectl config get-contexts
kubectl config use-context k8s
kubectl config get-contexts
kubectl get svc
clear
systemctl stauts httpd
netstat -antup | grep 8080
clear
kubectl get node
kubectl get pod
kubectl config get-contexts
clear
kubectl config set-context k8s --cluster=kubernetes
kubectl config get-context
kubectl config set-context hk8s --cluster=kubernetes
kubectl config get-context
kubectl config get-contexts
kubectl get no
clear
kubectl get svc
kubectl run nginx --image=nginx -l app=nginx -n ingress-nginx
kubectl get pod -n ingress-nginx
kubectl get pod -n ingress-nginx --show-labels
clear
kubectl expose pod nginx --port 80 --target-port=80 -n ingress-nginx
kubectl get all -n ingress-nginx
curl 10.96.188.78
kubectl describe svc -n ingree-nginx
kubectl describe svc -n ingress-nginx
kubectl describe svc nginx -n ingress-nginx
kubectl describe svc appjs-serivce -n ingress-nginx
kubectl describe svc appjs-service -n ingress-nginx
kubectl get ingressclass
clear
cat << EOF > app-ingress.yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: app-ingress
  namespace: ingress-nginx
  annotations:
    kubernetes.io/ingress.class: nginx
spec:
  ingressClassName: nginx
  rules:
  - http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: nginx
            port:
              number: 80
      - path: /app
        pathType: Prefix
        backend:
          service:
            name: appjs-service
            port:
              number: 80
EOF

kubectl apply -f app-ingress.yaml
kubectl get ingress -n ingress-nginx -w
# Pod 삭제
kubectl delete pods nginx -n ingress-nginx
# Deployment 삭제
kubectl delete deploy appjs -n ingress-nginx
# Service 삭제
kubectl delete svc appjs-service -n ingress-nginx
kubectl delete svc nginx -n ingress-nginx
# Ingress 삭제
kubectl delete ingress app-ingress -n ingress-nginx
clear
kubectl get pod -A
c
cd /var/log
ls
cd podds
ls
cd pods
ls
cd ..
cd containers/
ls
# node2 kubelet 서비스 비활성화
ssh node2 'systemctl disable --now kubelet' >/dev/null 2>&1
cd
c
kubectl get nodes
ssh node2
kubeclt get nodes
kubectl get nodes
c
# 다음 중 자신의 container runtime과 맞는 한가지를 사용한다.
# dockerd 서비스 비활성화
# ssh node2 'sudo systemctl disable --now docker' >/dev/null 2>&1
# containerd 서비스 비활성화
ssh node2 'sudo systemctl disable --now containerd' >/dev/null 2>&1
kubectl get nodes
c
kubectl get nodes
ssh node2
c
kubectl get no
exit
tree
echo " Kubernetes" >>  README.md
git init
tree git
tree .git
git config --list
 git config --global  user.email "wjddlsdo04120109@gmail.com"
git config --global  user.name "wjddlsdo04120109"
cat ~/.gitconfig
ls
git add README.md     //git add .
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/inaeeeee/Kubernetes.git
git push -u origin main
git init
git config --list
git config --global user.email
git add README.md
git commit -m "first commit"
git remote add origin
git brancj -M main
git branch -M main
git remote add origin
git remote add origin http://github.com/inaeeeee/Kubernetes.git
git push -u origin main
vi ~/.bashrc
ls
cat README.md
git
clear
