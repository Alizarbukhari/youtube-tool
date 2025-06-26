


------------------------------------------Domain already add in cloudflare------------------------------------------


mp3down.pro

--------------------



sudo apt install nginx
sudo apt install python3-pip
sudo apt install python3-virtualenv





-------------------------------------------------Create Users for server-----------------------------------

sudo adduser develoepr
Steps to follow up


-------------------------------------------------Give permission to users----------------------------------

sudo visudo

developer    ALL=(ALL:ALL) ALL


Ctrl+x then type (Y) and then (Enter)

Then go to login with user account which we create 





sudo apt install zip



-----------------------------------------------------------------------


------Create Virtual env------
Example:- virtualenv mb


------Activate Virtual env------
Example:- source mb/bin/activate



------install django & other packages------
pip install django pytube gunicorn youtube_search PyJwt python-dotenv django-ckeditor django-cors-headers Pillow requests --break-system-packages

pip list



------Deactivate Virtualenv------ 
deactivate



------------Create System Socket File for Gunicorn------------
Example:- sudo nano /etc/systemd/system/mp3down.pro.gunicorn.socket

[Unit]
Description=mp3down.pro.gunicorn socket

[Socket]
ListenStream=/run/mp3down.pro.gunicorn.sock

[Install]
WantedBy=sockets.target





------------Create System Service File for Gunicorn------------
Example:- sudo nano /etc/systemd/system/mp3down.pro.gunicorn.service


[Unit]
Description=mp3down.pro.gunicorn daemon
Requires=mp3down.pro.gunicorn.socket
After=network.target

[Service]
WorkingDirectory=/home/developer/mp3down.pro/youtube_downloader
ExecStart=/home/developer/mp3down.pro/youtube_downloader/mb/bin/gunicorn \
          --access-logfile - \
          --workers 3 \
          --bind unix:/run/mp3down.pro.gunicorn.sock \
          youtube_downloader.wsgi:application

[Install]
WantedBy=multi-user.target



------------Start Gunicorn Socket and Service------------
Example:- sudo systemctl start mp3down.pro.gunicorn.socket
Example:- sudo systemctl start mp3down.pro.gunicorn.service

Stop Gunicorn Socket and Service
Example:- sudo systemctl stop mp3down.pro.gunicorn.socket
Example:- sudo systemctl stop mp3down.pro.gunicorn.service


Enable Gunicorn Socket and Service
Example:- sudo systemctl enable mp3down.pro.gunicorn.socket
Example:- sudo systemctl enable mp3down.pro.gunicorn.service

sudo systemctl daemon-reload
sudo systemctl restart mp3down.pro.gunicorn



------------Check Gunicorn Status------------
sudo systemctl status mp3down.pro.gunicorn.socket
sudo systemctl status mp3down.pro.gunicorn.service



------------Restart Gunicorn (You may need to restart evermbime you make change in your project code)------------
sudo systemctl daemon-reload
sudo service nginx restart
sudo systemctl restart mp3down.pro.gunicorn





------------------------------------ Setup of nginx ------------------------------

Example:- sudo nano /etc/nginx/sites-available/mp3down.pro

server{
    listen 80;
    listen [::]:80;

    server_name mp3down.pro www.mp3down.pro;
    location / {
        proxy_set_header Host $http_host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_pass http://unix:/run/mp3down.pro.gunicorn.sock;
    }

}

------------------Enable Virtual Host or Create Symbolic Link of Virtual Host File------------------
Example:- sudo ln -s /etc/nginx/sites-available/mp3down.pro /etc/nginx/sites-enabled/mp3down.pro




------------Check Configuration is Correct or Not------------
sudo nginx -t


------------------------Restart Nginx------------------------
sudo service nginx restart





------------------------------------------------Node js------------------------------------------------------



------------------------------------------ Install Node and NPM------------------------------------------------------------

sudo apt install nodejs
node --version
sudo apt install npm
npm install
npm install -g pm2


pm2 start filename.js



------------------------------ Other pm2 commands------------------------------Optional------------------------------------------------------
pm2 show app
pm2 status
pm2 restart app
pm2 stop app
pm2 logs (Show log stream)
pm2 flush (Clear logs)


Setup Firewall
sudo ufw enable
sudo ufw status
sudo ufw allow ssh (Port 22)
sudo ufw allow http (Port 80)
sudo ufw allow https (Port 443)




------------------------------------------------PM2 LOGS Setup------------------------------------------


sudo nano /etc/nginx/sites-available/v1.mp3down.pro

 
server {
    listen 80;
    server_name v1.mp3down.pro  www.v1.mp3down.pro;

    location / {
        proxy_pass http://localhost:9001;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
        # Increase timeout values to 1000 seconds
        proxy_connect_timeout       1000s;
        proxy_send_timeout          1000s;
        proxy_read_timeout          1000s;
        send_timeout                1000s;
    }
}

Example:- sudo ln -s /etc/nginx/sites-available/v1.mp3down.pro /etc/nginx/sites-enabled/v1.mp3down.pro




------------------------------------------------Cobalt-API Setup COmmands------------------------------------------



sudo nano /etc/nginx/sites-available/api.mp3down.pro



 
server {
    listen 80;
    server_name api.mp3down.pro  www.api.mp3down.pro;

    location / {
        proxy_pass http://localhost:9000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
        # Increase timeout values to 1000 seconds
        proxy_connect_timeout       1000s;
        proxy_send_timeout          1000s;
        proxy_read_timeout          1000s;
        send_timeout                1000s;
    }
}


Example:- sudo ln -s /etc/nginx/sites-available/api.mp3down.pro /etc/nginx/sites-enabled/api.mp3down.pro


----------------------------------------Cobalt Restart Commands---------------------------------------------------------

sudo docker compose up -d
sudo docker compose restart






------------------------------------# Check NGINX config------------------------------------------------------
sudo nginx -t
sudo service nginx restart

------------------------------------# Restart NGINX-------------------------------------------------------------
sudo nginx -s reload
sudo service nginx restart
sudo systemctl restart mp3down.pro.gunicorn





------------------------------------------------------------------------SSL nginx Setup -------------------------------------------
8. Add SSL with LetsEncrypt
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install pmbhon3-certbot-nginx
sudo certbot --nginx -d audio2.music-mp3down.prom -d www.audio2.music-mp3down.prom

# Only valid for 90 days, test the renewal process with
certbot renew --dry-run










-------------------------------------------snowflake download link---------------------------------------------------


https://sourceforge.net/projects/snowflake-ssh/






