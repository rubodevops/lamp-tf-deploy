#! /bin/bash
        sudo apt-get update
		sudo apt-get install -y apache2
		sudo systemctl start apache2
		sudo systemctl enable apache2
		echo "<h1>Deployed via Terraform by Ruben Khachatryan</h1>" | sudo tee /var/www/html/index.html
		sudo apt install -y php7.4 php7.4-mysql php-common php7.4-cli php7.4-json php7.4-common php7.4-opcache libapache2-mod-php7.4
        sudo systemctl restart apache2
        echo '<?php phpinfo(); ?>' | sudo tee -a /var/www/html/phpinfo.php > /dev/null
		sudo apt install -y mariadb-server mariadb-client