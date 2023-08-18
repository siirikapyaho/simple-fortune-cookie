docker_username_lower=$(echo "$docker_username" | tr '[:upper:]' '[:lower:]')
echo "$docker_password" | docker login ghcr.io --username "$docker_username" --password-stdin
docker push "ghcr.io/$docker_username/frontend:1.0-${GIT_COMMIT::8}" 
docker push "ghcr.io/$docker_username/frontend:latest" &
wait
