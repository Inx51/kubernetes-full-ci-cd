$NEWPASS="admin"

$PASS=$(kubectl -- namespace argocd get secret argocd-initial-admin-secret --output jsonpath="{.data.password}" | base64 --decode)
argocd login --insecure --username admin --password $PASS --grpc-web argo-cd.$BASE_HOST
argocd account update-password --current-password $PASS --new-password $NEWPASS