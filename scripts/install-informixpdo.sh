HOSTNAME=192.168.0.1    # Where this file is located
PDO_DIRECTORY=PDO_INFORMIX-1.3.1
PDO_FILENAME=$PDO_DIRECTORY.tgz

TMPDIR=/tmp
TMPSDK=$TMPDIR/informixclient
BASEURL=$HOSTNAME:8000/informix

curl  $BASEURL/$PDO_FILENAME  -o $TMPDIR/$PDO_FILENAME
tar  -xvf $TMPDIR/$PDO_FILENAME  -C $TMPDIR/
cd  $TMPDIR/$PDO_DIRECTORY
phpize  &&  ./configure  && make  &&  make install

rm -r $TMPDIR/*
