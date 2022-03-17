[![Travis Build Status](https://travis-ci.org/smartapps-fr/bitbucket-pipelines-debian-10.svg)](https://travis-ci.org/smartapps-fr/bitbucket-pipelines-debian-10) [![Microbadger badge](https://images.microbadger.com/badges/image/smartapps/bitbucket-pipelines-debian-10.svg)](https://microbadger.com/images/smartapps/bitbucket-pipelines-debian-10)

# bitbucket-pipelines-debian-10(-php-mysql)

[Bitbucket Pipelines](https://bitbucket.org/product/features/pipelines) [Docker](https://www.docker.com/) image based on [Debian 10.0 _Buster_](https://www.debian.org/releases/stretch/) with [PHP](http://php.net/)/[MySQL](https://www.mysql.com) (and more !)

More help in Bitbucket's [Confluence](https://confluence.atlassian.com/bitbucket/bitbucket-pipelines-beta-792496469.html)

Docker image at [smartapps/bitbucket-pipelines-debian-10](https://hub.docker.com/r/smartapps/bitbucket-pipelines-debian-10/) (no `CMD` as it is overriden by *Pipelines*)

## Packages installed

 - `php-apcu`, `php-bcmath`, `php-cli`, `php-curl`, `php-gd`, `php-geoip`, `php-gettext`, `php-imagick`, `php-intl`, `php-json`, `php-mbstring`, `php-mcrypt`, `php-memcached`, `php-mysql`, `php-sqlite3`, `php-xdebug`, `php-xml`, `php-xmlrpc`, `php-zip`, `memcached`, `imagemagick`, `openssh-client`, `curl`, `gettext`, `zip`, `git`, `subversion`
 - [Perl](https://www.perl.org/) 5.28
 - [Python](https://www.python.org/) 2.7 & 3.7
 - [MariaDB](https://mariadb.org/) 10.3 (user `root:root`)
 - [PHP](http://www.php.net/) 7.3 (default)
 - [Ruby](https://www.ruby-lang.org/) 2.5
 - [Node.js](https://nodejs.org/) 10.x LTS (you can use [`n`](https://github.com/tj/n) to interactively manage your Node.js versions)
 - Latest [Composer](https://getcomposer.org/), [Gulp](http://gulpjs.com/), [Webpack](https://webpack.github.io/), [Mocha](https://mochajs.org/), [Grunt](http://gruntjs.com/), [PHPUnit](https://phpunit.de/), [Codeception](https://codeception.com/), [Yarn](https://yarnpkg.com/), [n](https://github.com/tj/n), [Infection](https://infection.github.io/)

## Sample `bitbucket-pipelines.yml`

```YAML
image: smartapps/bitbucket-pipelines-debian-10
pipelines:
  default:
    - step:
        script:
          - service mysql start
          - mysql -h localhost --user=root --password=root -e "CREATE DATABASE test;"
          - composer config -g github-oauth.github.com XXXXXXXX
          - composer install --no-interaction --no-progress --prefer-dist
          - npm install --no-spin
          - gulp
```

building
Get-Content .\Dockerfile-php74 | docker build -t repo - 
docker push 