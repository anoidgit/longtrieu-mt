#!/bin/sh

MOSES_DIR=/work/$USER/moses/mosesdecoder

src_lang=$1
trg_lang=$2
pvt1_lang=$3
pvt2_lang=$4


test=data/test.$src_lang
ref=data/test.$trg_lang
config_dir=tuning/rectangulation/$src_lang-$trg_lang/$pvt1_lang-$pvt2_lang/mert-work
decode_dir=decode/rectangulation/$src_lang-$trg_lang/$pvt1_lang-$pvt2_lang
mkdir -p $decode_dir
hyp=$decode_dir/$src_lang-$trg_lang.hyp
bleu=$decode_dir/$src_lang-$trg_lang.bleu

./scripts/decode.sh $test $hyp $config_dir $ref $bleu