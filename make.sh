#!/bin/sh
os=`uname`
dir=$(cd `dirname $0`; pwd)
PATH=$PATH:$dir'/validate/'

if [ $os == 'Linux' ]
then
	PATH=$PATH:$dir'/bin/linux/'
	pluginpath=$dir'/bin/linux/'
else
	PATH=$PATH:$dir'/bin/mac/'
	pluginpath=$dir'/bin/mac/'
fi


${pluginpath}protoc -I ./validate/ -I ./include --go_out=./ ./validate/*.proto

mv ./github.com/EngineerEthanLei/protoc-gen-validate/validate/* ./validate/

rm -rf github.com