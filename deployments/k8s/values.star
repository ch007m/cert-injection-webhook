load("@ytt:data", "data")
load("@ytt:base64", "base64")
load("@ytt:assert", "assert")

data.values.docker_server or assert.fail("missing docker_server")
data.values.docker_username or assert.fail("missing docker_username")
data.values.docker_password or assert.fail("missing docker_password")

# export
values = data.values

# extract the docker registry from the repository string
docker_server = "https://index.docker.io/v1/"
parts = data.values.docker_registry.split("/", 1)
if len(parts) == 2:
    if '.' in parts[0] or ':' in parts[0]:
        docker_server = parts[0]
    end
end
