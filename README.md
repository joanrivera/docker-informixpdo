# Docker - InformixPDO

Base configuration files to generate a Docker container image that add InformixPDO support to a Basic PHP image.

You can use this to save time when you need a PHP+InformixPDO image.


To generate the image is necessary to complete these steps:

1. Download the CSDK and the PDO souce code. Put both into the `informix` directory:
    * The Informix Client SDK, from IBM:
      [Informix CSDK](https://www-01.ibm.com/marketing/iwm/tnd/preconfig.jsp?id=2011-04-06+21%3A07%3A00.665660R&S_TACT=&S_CMP=)
    * The PDO sources from `pecl.php.net`:
      [PDO_INFORMIX](http://pecl.php.net/get/PDO_INFORMIX-1.3.1.tgz)

2. In the `informix/slqhosts` file change the string `demo_server` to match the Informix server name.

3. Review the files in the `scripts` directory and edit properly, focusing in the first lines.

4. Execute `python -m SimpleHTTPServer` in the same directory where this file is located.

5. Build the image: `docker build -t ifxpdo .`

6. When containers are to be created, note that you must set the Infomix server IP: `docker run -d -p 80:80 -v /var/www/html:/var/www/html --add-host ifxserver:192.168.0.2  ifxpdo`.
