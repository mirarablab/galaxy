sudo apt install nginx
sudo apt install nginx-extras
sudo apt install python-certbot-nginx
# Create and upate /etc/nginx/sites-available/galaxy 
sudo ln -s /etc/nginx/sites-available/galaxy /etc/nginx/sites-enabled/
sudo systemctl restart nginx
journalctl -xe
systemctl status nginx.service


# Certboot
sudo snap install core; sudo snap refresh core
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
sudo certbot --nginx
