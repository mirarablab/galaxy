# Files needed:
#   galaxy.zip: the xml files for wlogdate and our preferred galaxy tabs
#   galaxy: the nginx config file
#   galaxy.yml: the galaxy config file

pip install virtualenv
virtualenv galaxy_env
. ./galaxy_env/bin/activate
cd galaxy-dist
umask 027
sh run.sh
# Test `curl http://localhost:8080`
# Important: when you shut down, make sure all processes died

# To make visible outside:
mkdir var
sudo usermod -a -G galaxy www-data 
mv ../galaxy /etc/nginx/sites-available/galaxy
sudo ln -s /etc/nginx/sites-available/galaxy /etc/nginx/sites-enabled/
mv ../galaxy.yml config/
#update IP values in /etc/nginx/sites-available/galaxy and config/galaxy.yml


# To make start with node
#/home/galaxy/galaxy-dist/contrib/galaxy.debian-init


# To install wLogDate
# Perhaps when galaxy is down:
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
# re login
. ./galaxy_env/bin/activate
conda config --add channels conda-forge
conda config --add channels bioconda
conda install wlogdate 
cd galaxy-dist
unzip ../galaxy.zip
