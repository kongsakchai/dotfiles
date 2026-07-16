function kexec
kubectl exec -it $(kubectl get pods --template "{{range .items}}{{.metadata.name}}{{\"\\n\"}}{{end}}" | fzf) -- $argv
end
