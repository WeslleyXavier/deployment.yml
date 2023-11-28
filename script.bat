echo "Criando as imagens..."

docker build -t weslleyxavier/projeto-backend:1.0 backend/.
docker build -t weslleyxavier/projeto-database:1.0 database/.

echo "Realizado push das imagens..."

docker push weslleyxavier/projeto-backend:1.0
docker push weslleyxavier/projeto-database:1.0

echo "Criando serviços no Cluster Kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml

