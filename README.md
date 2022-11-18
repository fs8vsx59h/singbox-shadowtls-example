# singbox-shadowtls-example How to use guide

1. Install docker.( Can be auto installed by official script <https://get.docker.com> )
2. Make a new folder name what you want.
3. Make a new file in this folder named "compose.yml", Copy the content in "compose.yml" and paste it in.
4. Make a new file in this folder named "config.json",Copy the content in "server-config-v2.json" and paste it in,edit the "listen port" and "password" to what you want.
5. Run command  in the folder you created in step 2 .

  ```shell
  docker compose up -d
  ```
 DONE   
 
 
If you are a new linux user or just too lazy to edit configrations ,there is an auto deploy way.  (after your docker installed)
Run these commands:  

apt install git 
git clone https://github.com/fs8vsx59h/singbox-shadowtls-example.git  
cd singbox-shadowtls-example  
docker buildx build -t sstls:latest .
docker run sstls:latest

DONE
