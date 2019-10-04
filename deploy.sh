docker build -t agkhalil/multi-client -f ./client/Dockerfile ./client
docker build -t agkhalil/multi-server -f ./server/Dockerfile ./server
docker build -t agkhalil/multi-worker -f ./worker/Dockerfile ./worker
docker push agkhalil/multi-client
docker push agkhalil/multi-server
docker push agkhalil/multi-worker
kubectl apply -f k8s
# kubectl rollout restart deployments
kubectl version