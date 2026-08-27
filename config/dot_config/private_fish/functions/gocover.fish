function gocover
    go test -coverprofile=coverage.out $argv
    go tool cover -html=coverage.out
end
