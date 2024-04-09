#!/bin/bash

# Support for CETUC dataset.

datadir="./alcaim"

spk_select_train_dir="./data/spk"
spk_select_test_dir="./data/spk_test" 

if [ ! -d ${spk_select_train_dir} ]; then
	mkdir ${spk_select_train_dir}
fi

if [ ! -d ${spk_select_test_dir} ]; then
	mkdir ${spk_select_test_dir}
fi

# link data
for f in ${datadir}/AdrianaMalta_F049/F049-0*.wav; do
	b=$(basename $f)
	n=$(echo $b | sed 's/F049-//')
	ln -s $f ${spk_select_train_dir}/SF1/${n}
done

for f in ${datadir}/AnaVarela_F042/F042-0*.wav; do
	b=$(basename $f)
	n=$(echo $b | sed 's/F042-//')
	ln -s $f ${spk_select_train_dir}/SF2/${n}
done

for f in ${datadir}/DanielRibeiro_M002/M002-0*.wav; do
	b=$(basename $f)
	n=$(echo $b | sed 's/M002-//')
	ln -s $f ${spk_select_train_dir}/TM1/${n}
done

for f in ${datadir}/JoseIldo_M024/M024-0*.wav; do
	b=$(basename $f)
	n=$(echo $b | sed 's/M024-//')
	ln -s $f ${spk_select_train_dir}/TM2/${n}
done

# move test data
for t in 'SF1' 'SF2' 'TM1' 'TM2'; do
	mv ${spk_select_train_dir}/${t}/09??.wav ${spk_select_test_dir}/${t}/
done