apiVersion: apps/v1
kind: Deployment
metadata:
  name: "nextcloud-deployment"
spec:
  replicas: 1
  selector:
      matchLabels:
        app: "nextcloud"
  template:
    metadata:
      labels:
        app: "nextcloud"
    spec:
      containers:
      - image: nextcloud:latest
        imagePullPolicy: Always
        name: "nextcloud"
        ports:
        - containerPort: 80
        env:
        - name: MYSQL_DATABASE
          value: "nextcloud_db"
        - name: MYSQL_USER
          value: "worker"
        - name: MYSQL_PASSWORD
          value: "${database_password}"
        - name: MYSQL_HOST
          value: "${database_endpoint}"
        - name: NEXTCLOUD_ADMIN_USER
          value: "admin"
        - name: NEXTCLOUD_ADMIN_PASSWORD
          value: "${admin_password}"
        - name: NEXTCLOUD_TRUSTED_DOMAINS
          value: "${trusted_domain}"
        volumeMounts:
        - name: nextcloud
          mountPath: /var/www/html/config
      volumes:
      - name: nextcloud
        persistentVolumeClaim:
          claimName: efs-claim
---
apiVersion: v1
kind: Service
metadata:
  annotations:
    alb.ingress.kubernetes.io/target-type: ip
  name: "nextcloud-service"
spec:
  ports:
  - port: 80
    targetPort: 80
    protocol: TCP
  type: NodePort
  selector:
    app: "nextcloud"
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: "nextcloud-ingress"
  annotations:
    kubernetes.io/ingress.class: alb
    alb.ingress.kubernetes.io/scheme: internet-facing
    alb.ingress.kubernetes.io/listen-ports: '[{"HTTPS":443}, {"HTTP":80}]'
    alb.ingress.kubernetes.io/certificate-arn: ${certificate_arn}
  labels:
    app: nextcloud-ingress
spec:
  rules:
  - http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: "nextcloud-service"
            port:
              number: 80
