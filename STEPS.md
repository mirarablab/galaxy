# Requirements

* Files needed:
  *   galaxy.zip: the xml files for wlogdate and our preferred galaxy tabs
  *   galaxy: the nginx config file
  *   galaxy.yml: the galaxy config file
* Make sure pip and env are available: [py-install.sh](py-install.sh)

# Initial Setup
~~~bash
pip install virtualenv
virtualenv galaxy_env
. ./galaxy_env/bin/activate
cd galaxy-dist
umask 027
sh run.sh
~~~

* Test: `curl http://localhost:8080`

* **Important:** when you shut down, make sure all processes died

* Stop for now (`Ctrl+C`)

# To make visible outside:

1. Install nginx. See [nginx-install.sh](nginx-install.sh).

2. Make galaxy connected to nginx. 
~~~bash
mkdir var
sudo usermod -a -G galaxy www-data 
mv ../galaxy /etc/nginx/sites-available/galaxy
sudo ln -s /etc/nginx/sites-available/galaxy /etc/nginx/sites-enabled/
mv ../galaxy.yml config/
~~~

3. Update IP values in `/etc/nginx/sites-available/galaxy` and `config/galaxy.yml`

4. Start it as a service:
~~~bash
sh run.sh --daemon
~~~

# To make the service auto-start

TO BE DONE. We need to /home/galaxy/galaxy-dist/contrib/galaxy.debian-init


# To install wLogDate

- Perhaps when galaxy is down, make sure conda is available
~~~bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
~~~ 
You man need to exit and re login here.
- Then, 
~~~bash
. ./galaxy_env/bin/activate
conda config --add channels conda-forge
conda config --add channels bioconda
conda install wlogdate 
cd galaxy-dist
unzip ../galaxy.zip
~~~

Test to see if it works. 
