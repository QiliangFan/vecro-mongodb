run:
	kubectl delete configmap mongo-initjs || true
	kubectl create configmap mongo-initjs --from-file=mongo-init.js
	sh ./build_image.sh
	kubectl delete -f ben-mongodb-pod.yaml --force || true
	kubectl apply -f ben-mongodb-pod.yaml