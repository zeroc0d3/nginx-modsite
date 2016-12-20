# Configuration with domain "mylaravel.app"
# edit: nano /etc/hosts
# add: 127.0.0.1   mylaravel.app

server {

    # Port that the web server will listen on.
    listen          80;

     # Host that will serve this project.
    server_name     mylaravel.app;

    # Useful logs for debug.
    access_log      /home/zeroc0d3/repos/mylaravel.app/access.log;
    error_log       /home/zeroc0d3/repos/mylaravel.app/error.log;
    rewrite_log     on;

    # The location of our projects public directory.
    root            /home/zeroc0d3/repos/mylaravel.app/public;

    # Point index to the Laravel front controller.
    index           index.php index.html index.htm;

    location / {

        # URLs to attempt, including pretty ones.
        try_files   $uri $uri/ /index.php?$query_string;

        error_page  404     /404.html;
        error_page  403     /403.html;

        # To allow POST on static pages
        error_page  405     =200 $uri;
    }

    # PHP FPM configuration.
    
    location ~* \.php$ {
          # for multi php-fpm, it would be different:
          # fastcgi_pass                    unix:/var/run/php/php5-fpm.sock;   # php 5.5
          # fastcgi_pass                    unix:/var/run/php/php5.6-fpm.sock; # php 5.6
          # fastcgi_pass                    unix:/var/run/php/php7-fpm.sock;   # php 7.0
          # fastcgi_pass                    unix:/var/run/php/php7.1-fpm.sock; # php 7.1
            fastcgi_pass                    unix:/var/run/php5-fpm.sock;
            fastcgi_index                   index.php;
            fastcgi_split_path_info         ^(.+\.php)(.*)$;
            include                         /etc/nginx/fastcgi_params;
            fastcgi_param                   SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }

    # We don't need .ht files with nginx.
    location ~ /\.ht {
            deny all;
    }

    # Set header expirations on per-project basis
    location ~* \.(?:bmp|ico|css|js|jpeg|jpg|png|tiff|svg|woff)$ {
            expires 365d;

    }
}
