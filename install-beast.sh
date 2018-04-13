#!/bin/bash

wget https://github.com/beast-dev/beast-mcmc/releases/download/v1.8.4/BEASTv1.8.4.tgz
tar -xzpvf BEASTv1.8.4.tgz

mv BEASTv1.8.4/bin/* /usr/local/bin
mv BEASTv1.8.4/lib/* /usr/local/lib

echo "LD_LIBRARY_PATH=/usr/lib:/usr/local/lib:/lib" >> /etc/profile

LD_LIBRARY_PATH=/usr/lib:/usr/local/lib:/lib

beast -beagle_info
