#!/bin/bash

export PYTORCH_CUDA_ALLOC_CONF=max_split_size_mb:32
export CUDA_VISIBLE_DEVICES=$1
export STEP=$2
export SET=$3
# multilingual

for LORALANG in all
do
  for TESTLANG in en
  do
    TESTFILE=../multilingual-alpaca/commonsense_qa_repeat_answer.json

   for BASE in llama-7b
   do
        python generate.py \
          --lora_weights "" \
          --base_model mistralai/Mixtral-8x7B-v0.1 \
          --length 400 \
          --test_file ${TESTFILE} \
          --save_file ../multilingual-alpaca/commonsense_qa-repeat_mistral7x7b.jsonl
    done
  done
done

