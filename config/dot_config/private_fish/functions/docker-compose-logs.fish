function docker-compose-logs -d "Show compose logs (docker compose or podman compose)"
    # Detect which compose runtime is available, prefer podman on Linux
    if command -v podman >/dev/null 2>&1
        and not command -v docker >/dev/null 2>&1
        eval "podman compose logs" $argv
    else if command -v docker >/dev/null 2>&1
        eval "docker compose logs" $argv
    else
        echo "Error: neither docker nor podman found" >&2
        return 1
    end
end

# Convenience aliases: dcl = tail 50, dcf = follow + tail 50
alias dcl="docker-compose-logs --tail=50"
alias dcf="docker-compose-logs -f --tail=50"
