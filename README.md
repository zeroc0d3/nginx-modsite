# nginx-modsite #
nginx modsite enable / disable 

## Install ##
* Clone / download this repo
* Copy "nginx_modsite" file to "/usr/bin"
```
cp nginx_modsite /usr/bin/nginx_modsite
```
* Change permission to execute 
```
sudo chmod +x /usr/bin/nginx_modsite
```
* Done.


## Configuration for Laravel PHP Framework ##
* Copy "mylaravel.app" to folder "/etc/nginx/site-available"
```
cp mylaravel.app /etc/nginx/site-available/mylaravel.app
```
* Edit "mylaravel.app" as hosts
```
sudo vi /etc/hosts
```
Add line :
```
127.0.0.1   mylaravel.app
```
* Edit configuration site "mylaravel.app" for your own root folder:
```
sudo vi /etc/nginx/site-available/mylaravel.app
``` 
Change line to:
```
access_log      /usr/share/nginx/html/mylaravel.app/access.log;  
error_log       /usr/share/nginx/html/mylaravel.app/error.log;
...
root            /usr/share/nginx/html/mylaravel.app/public;
```
* Done.



## Running nginx_modsite ##
* Enable site
```
sudo nginx_modsite -e
```
Choose your number for activate your domain.
* Disable site
```
sudo nginx_modsite -d
```
Choose your number for deactivate your domain.
* For manual reload configuration
```
sudo service nginx reload
sudo service nginx restart
```
or
```
sudo /etc/init.d/nginx reload
sudo /etc/init.d/nginx restart
```
