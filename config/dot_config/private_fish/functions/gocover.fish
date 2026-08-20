function gocover
    go test -coverprofile=coverage.out $args[1]
    go tool cover -html=coverage.out
end
