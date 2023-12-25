

HF_ENDPOINT=https://hf-mirror.com CUDA_VISIBLE_DEVICES=0 python src/train_bash.py --stage sft     --do_train     --model_name_or_path /data/chatglm3-6b-base  --dataset self_cognition  --template chatglm3     --finetuning_type lora     --lora_target query_key_value   --output_dir sft_checkpoint --overwrite_cache --per_device_train_batch_size 4  --gradient_a
ccumulation_steps 4     --lr_scheduler_type cosine     --logging_steps 10     --save_steps 1000     --learning_rate 5e-5     --num_train_epochs 10.0     --plot_loss     --fp16


python src/cli_demo.py     --model_name_or_path /data/chatglm3-6b-base   --checkpoint_dir sft_checkpoint     --template chatglm3     --finetuning_type lora


HF_ENDPOINT=https://hf-mirror.com CUDA_VISIBLE_DEVICES=0,1 accelerate launch src/train_bash.py --stage sft --do_train --model_name_or_path /data/chatglm3-6b-base --dataset self_cognition --template chatglm3 --finetuning_type lora --lora_target query_key_value --output_dir sft_checkpoint --overwrite_cache --per_device_train_batch_size 4 --gradient_a ccumulation_steps 4 --lr_scheduler_type cosine --logging_steps 10 --save_steps 1000 --learning_rate 5e-5 --num_train_epochs 10.0 --plot_loss --fp16
