docker build -t agkhalil/multi-client:latest -t agkhalil/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t agkhalil/multi-server:latest -t agkhalil/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t agkhalil/multi-worker:latest -t agkhalil/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push agkhalil/multi-client:latest
docker push agkhalil/multi-server:latest
docker push agkhalil/multi-worker:latest

docker push agkhalil/multi-client:$SHA
docker push agkhalil/multi-server:$SHA
docker push agkhalil/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=agkhalil/multi-server:$SHA
kubectl set image deployments/client-deployment client=agkhalil/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=agkhalil/multi-worker:$SHA
