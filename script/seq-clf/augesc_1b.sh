wandb online
model="TinyLlama/TinyLlama-1.1B-intermediate-step-1431k-3T"
# model="google-bert/bert-base-uncased"
# dataset="dair-ai/emotion"
dataset="augesc:context"


python -m tuna.launcher.train \
    --mesh fsdp \
    --do_train --do_eval \
    --padding max_length \
    --padding_side left \
    --truncation \
    --truncation_side left \
    --insert_eos_token \
    --num_labels 8 \
    --task sequence-classification \
    --model_arch sequence-classification \
    --project "esconv" \
    --run_name "TinyLlama-augesc-context" \
    --dataset="$dataset" \
    --max_length=512 \
    --model_name_or_path $model \
    --total_epochs 3 \
    --learning_rate 5e-5 \
    --train_total_batch_size 32 \
    --train_batch_size_per_device 1 \
    --eval_batch_size_per_device 1 \
    --save_strategy epoch \
    --push_to_hub \
    --output_dir ""