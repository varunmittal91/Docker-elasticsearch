A simple elasticsearch config ensuring basic settings.

> Run this command on host, to ensure there are enough number of pages active on the main memory
>
> echo "vm.max_map_count = <max_mem>" | tee -a /etc/sysctl.conf 
>
> <max_mem> = 16*1000*(ram in MB)
>
> After starting the containers and configuring the image, elasticsearch can be started by 'service elasticsearch start'
