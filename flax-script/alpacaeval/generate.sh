# export HF_HOME=/data/hf-home
# export LD_LIBRARY_PATH=~/anaconda3/envs/easydel/lib/:$LD_LIBRARY_PATH

eval(){
    model=$1
    template=$2
    python -m eval.alpacaeval_generate \
        --model $model \
        --output_path outputs/$model/alpacaeval.json \
        --chat_template $template

    python -m eval.alpacaeval_judge \
        --input_path outputs/$model/alpacaeval.json
}

eval "heegyu/TinyLlama-1.1b-max-margin@epoch-1" "zephyr"
eval "heegyu/TinyLlama-1.1b-max-margin@epoch-2" "zephyr"
eval "heegyu/TinyLlama-1.1b-max-margin@epoch-3" "zephyr"
eval "heegyu/TinyLlama-1.1b-feedback-tree-3-0422@epoch-1" "zephyr"
eval "heegyu/TinyLlama-1.1b-feedback-tree-3-0422@epoch-2" "zephyr"
eval "heegyu/TinyLlama-1.1b-feedback-tree-3-0422@epoch-3" "zephyr"

eval "heegyu/TinyLlama-1.1b-feedback-all@epoch-1" zephyr
eval "heegyu/TinyLlama-1.1b-feedback-all@epoch-2" zephyr
eval "heegyu/TinyLlama-1.1b-feedback-all@epoch-3" zephyr
