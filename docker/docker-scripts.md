# Helper scripts for docker

Copy aliases into your `~/.bash_aliases file`

## For cleaning up
Using docker system prune is the main recommended way for cleaning up. 
You can use the other provided methods if system prune is not working for you.

```bash
alias docker_prune="sudo docker system prune"  

# System prune should remove all the dangling images (and volumes with --volumes option)
alias docker_rmi_dangling="sudo docker rmi \'sudo docker images -qa -f dangling=true\'"  
alias docker_rm_volumes_dangling="sudo docker volume ls -qf dangling=true | xargs -r sudo docker volume rm"

# System prune with --all option should remove all unused images. Note that this can be dangerous.
alias docker_rm_all="sudo docker rm \'sudo docker ps -a -q\'"  
alias docker_rmi_all="sudo docker rmi \'sudo docker images -q\'"  

# Use this if you have removed all the dangling images and volumes and there are still diffs taking up your precious space.
alias docker_clean_aufs="sudo service docker stop && sudo rm -rf /var/lib/docker/{aufs,image/aufs,linkgraph.db} && sudo service docker start"  
````
