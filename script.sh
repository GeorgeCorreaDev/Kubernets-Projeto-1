#! /bi/bash

echo "criando as imagens...."

docker build -t georgeacdev/projeto-backend:1.0 backend/.
doker build -t georgeacdev/projeto-database:1.0 database/.

echo "realizando push das imagens..."

doker push georgeacdev/projeto-backend:1.0
doker push georgeacdev/projeto-database:1.0

echo "criando serviço no cluster kubernets."

kubectl apply -f ./services.yml

echo "criando deployments."

kubectl apply -f ./deployment.yml