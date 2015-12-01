HOSTNAME=192.168.0.1    # Where this file is located
CSDK_FILENAME=clientsdk.4.10.FC5DE.LINUX.tar

TMPDIR=/tmp
TMPSDK=$TMPDIR/informixclient
BASEURL=$HOSTNAME:8000/informix

mkdir $TMPSDK

curl  $BASEURL/$CSDK_FILENAME  -o $TMPDIR/$CSDK_FILENAME
curl  $BASEURL/csdk.properties  -o $TMPDIR/csdk.properties

tar -xvf $TMPDIR/$CSDK_FILENAME  -C $TMPSDK

#Informix SDK's unattended installation
$TMPSDK/installclientsdk -i silent -f $TMPDIR/csdk.properties

#Cleaning up
rm -r $TMPDIR/*
