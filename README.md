This is what the cool kids call a 'sidecar' image.

It mounts the cassandra data-dir and a backups tree that
I crufted in myself. Then watches (a) for a new snapshot.
It then collects the various snapshot files, tars them up
and dumps them in the backup tree.

Later, an actual disk snapshot happens out of band so as to 
make sure there are several copies of the data. Probably.

... Oh. Yeah. Don't add kubectl to the git tree. 
That would be tiresome.


What's that localhost:5000 business? Aren't they a metal band?

https://mtpereira.com/local-development-k8s.html
and
eval $(minikube docker-env)

... You are now dockering in the same context as yr minikube install.

