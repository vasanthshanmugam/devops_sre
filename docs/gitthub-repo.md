/pi-sre-lab
├── .github/workflows/deploy.yml   # The "Engine" (CI/CD)
├── k8s/
│   ├── db-init.yaml              # Database initialization
│   ├── app-deployment.yaml       # Tomcat Logic
│   └── web-deployment.yaml       # Nginx Frontend
└── src/
    ├── index.html                # Frontend UI
    └── shop.jsp                  # Backend Logic
