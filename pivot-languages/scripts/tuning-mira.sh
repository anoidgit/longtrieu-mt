#!/bin/sh

MOSES_DIR=/work/$USER/moses/mosesdecoder


tuning_mira(){
	src_lang=$1
	trg_lang=$2
	tune_src=$3
	tune_trg=$4
	tm_dir=$5
	
	$MOSES_DIR/scripts/training/mert-moses.pl $tune_src $tune_trg \
	$MOSES_DIR/bin/moses $tm_dir/moses.ini \
	--mertdir $MOSES_DIR/bin \
	--rootdir $MOSES_DIR/scripts --batch-mira --return-best-dev \
	--batch-mira-args '-J 60' --decoder-flags '-threads 20 -v 0' \
	>& tuning-mira.$src_lang-$trg_lang.log &
}

src_lang=$1
trg_lang=$2
tm_dir=$3
tune_dir=$4
tune_src=$PWD/data/tune.$src_lang
tune_trg=$PWD/data/tune.$trg_lang
home=$PWD

mkdir -p $tune_dir
cd $tune_dir

tuning_mira $src_lang $trg_lang $tune_src $tune_trg $tm_dir

cd $home