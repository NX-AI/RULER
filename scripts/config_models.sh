# Copyright (c) 2024, NVIDIA CORPORATION.  All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

TEMPERATURE="0.0" # greedy
TOP_P="1.0"
TOP_K="32"
SEQ_LENGTHS=(
    131072
    65536
    32768
    16384
    8192
    4096
)

MODEL_SELECT() {
    MODEL_NAME=$1
    MODEL_DIR=$2
    ENGINE_DIR=$3
    
    case $MODEL_NAME in
        llama2-7b-chat)
            MODEL_PATH="${MODEL_DIR}/Llama-2-7b-chat-hf"
            MODEL_TEMPLATE_TYPE="meta-chat"
            MODEL_FRAMEWORK="vllm"
            ;;
        llama3.1-8b-chat)
            MODEL_PATH="${MODEL_DIR}/llama3.1-8b-Instruct"
            MODEL_TEMPLATE_TYPE="meta-llama3"
            MODEL_FRAMEWORK="vllm"
            ;;
        jamba1.5-mini)
            MODEL_PATH="${MODEL_DIR}/Jamba-1.5-Mini"
            MODEL_TEMPLATE_TYPE="jamba"
            MODEL_FRAMEWORK="vllm"
            ;;
        xLSTM-7b)
            MODEL_PATH="${MODEL_DIR}/xLSTM-7b"
            MODEL_TEMPLATE_TYPE="xlstm"
            MODEL_FRAMEWORK="hf"
            TOKENIZER_PATH="EleutherAI/gpt-neox-20b"
            TOKENIZER_TYPE="hf"
            ;;
        xLSTM-7b-longctx)
            MODEL_PATH="/nfs-gpu/xlstm/converted_model_checkpoints/xLSTM7B_longctx"
            MODEL_TEMPLATE_TYPE="xlstm"
            MODEL_FRAMEWORK="hf"
            TOKENIZER_PATH="EleutherAI/gpt-neox-20b"
            TOKENIZER_TYPE="hf"
            ;;
        xLSTM-7b-short-nh4)
            MODEL_PATH="/nfs-gpu/xlstm/converted_model_checkpoints/xLSTM7B_short_nh4"
            MODEL_TEMPLATE_TYPE="xlstm"
            MODEL_FRAMEWORK="hf"
            TOKENIZER_PATH="EleutherAI/gpt-neox-20b"
            TOKENIZER_TYPE="hf"
            ;;
        xLSTM-7b-short-nh8)
            MODEL_PATH="/nfs-gpu/xlstm/converted_model_checkpoints/xLSTM7B_short_nh8"
            MODEL_TEMPLATE_TYPE="xlstm"
            MODEL_FRAMEWORK="hf"
            TOKENIZER_PATH="EleutherAI/gpt-neox-20b"
            TOKENIZER_TYPE="hf"
            ;;
        xLSTM-7b-short-nh16)
            MODEL_PATH="/nfs-gpu/xlstm/converted_model_checkpoints/xLSTM7B_short_nh16"
            MODEL_TEMPLATE_TYPE="xlstm"
            MODEL_FRAMEWORK="hf"
            TOKENIZER_PATH="EleutherAI/gpt-neox-20b"
            TOKENIZER_TYPE="hf"
            ;;
        xLSTM-7b-short-nh32)
            MODEL_PATH="/nfs-gpu/xlstm/converted_model_checkpoints/xLSTM7B_short_nh32"
            MODEL_TEMPLATE_TYPE="xlstm"
            MODEL_FRAMEWORK="hf"
            TOKENIZER_PATH="EleutherAI/gpt-neox-20b"
            TOKENIZER_TYPE="hf"
            ;;
        xLSTM-7b-short-nh8-noig)
            MODEL_PATH="/nfs-gpu/xlstm/converted_model_checkpoints/xLSTM7B_short_nh8_noig"
            MODEL_TEMPLATE_TYPE="xlstm"
            MODEL_FRAMEWORK="hf"
            TOKENIZER_PATH="EleutherAI/gpt-neox-20b"
            TOKENIZER_TYPE="hf"
            ;;
        xLSTM-7b-short-nh8-noig0)
            MODEL_PATH="/nfs-gpu/xlstm/converted_model_checkpoints/xLSTM7B_short_nh8_noig0"
            MODEL_TEMPLATE_TYPE="xlstm"
            MODEL_FRAMEWORK="hf"
            TOKENIZER_PATH="EleutherAI/gpt-neox-20b"
            TOKENIZER_TYPE="hf"
            ;;
        falcon-mamba-7b)
            MODEL_PATH="tiiuae/falcon-mamba-7b"
            MODEL_TEMPLATE_TYPE="falcon-mamba"
            MODEL_FRAMEWORK="hf"
            TOKENIZER_PATH="tiiuae/falcon-mamba-7b"
            TOKENIZER_TYPE="hf"
            ;;
        codestral-mamba-7b)
            MODEL_PATH="mistralai/Mamba-Codestral-7B-v0.1"
            MODEL_TEMPLATE_TYPE="codestral-mamba"
            MODEL_FRAMEWORK="hf"
            TOKENIZER_PATH="mistralai/Mamba-Codestral-7B-v0.1"
            TOKENIZER_TYPE="hf"
            ;;
        rwkv5-7b)
            MODEL_PATH="RWKV/v5-Eagle-7B-HF"
            MODEL_TEMPLATE_TYPE="rwkv-hf"
            MODEL_FRAMEWORK="hf"
            TOKENIZER_PATH="RWKV/v5-Eagle-7B-HF"
            TOKENIZER_TYPE="hf"
            ;;
        rwkv6-7b)
            MODEL_PATH="RWKV/v6-Finch-7B-HF"
            MODEL_TEMPLATE_TYPE="rwkv-hf"
            MODEL_FRAMEWORK="hf"
            TOKENIZER_PATH="RWKV/v6-Finch-7B-HF"
            TOKENIZER_TYPE="hf"
            ;;
        llama-2-7b)
            MODEL_PATH="meta-llama/Llama-2-7b-hf"
            MODEL_TEMPLATE_TYPE="meta-llama-noinstruct"
            MODEL_FRAMEWORK="hf"
            TOKENIZER_PATH="meta-llama/Llama-2-7b-hf"
            TOKENIZER_TYPE="hf"
            ;;
        llama3.1-8b)
            MODEL_PATH="meta-llama/Llama-3.1-8B"
            MODEL_TEMPLATE_TYPE="meta-llama-noinstruct"
            MODEL_FRAMEWORK="hf"
            TOKENIZER_PATH="meta-llama/Llama-3.1-8B"
            TOKENIZER_TYPE="hf"
            ;;
        gpt-3.5-turbo)
            MODEL_PATH="gpt-3.5-turbo-0125"
            MODEL_TEMPLATE_TYPE="base"
            MODEL_FRAMEWORK="openai"
            TOKENIZER_PATH="cl100k_base"
            TOKENIZER_TYPE="openai"
            OPENAI_API_KEY=""
            AZURE_ID=""
            AZURE_SECRET=""
            AZURE_ENDPOINT=""
            ;;
        gpt-4-turbo)
            MODEL_PATH="gpt-4"
            MODEL_TEMPLATE_TYPE="base"
            MODEL_FRAMEWORK="openai"
            TOKENIZER_PATH="cl100k_base"
            TOKENIZER_TYPE="openai"
            OPENAI_API_KEY=""
            AZURE_ID=""
            AZURE_SECRET=""
            AZURE_ENDPOINT=""
            ;;
        gemini_1.0_pro)
            MODEL_PATH="gemini-1.0-pro-latest"
            MODEL_TEMPLATE_TYPE="base"
            MODEL_FRAMEWORK="gemini"
            TOKENIZER_PATH=$MODEL_PATH
            TOKENIZER_TYPE="gemini"
            GEMINI_API_KEY=""
            ;;
        gemini_1.5_pro)
            MODEL_PATH="gemini-1.5-pro-latest"
            MODEL_TEMPLATE_TYPE="base"
            MODEL_FRAMEWORK="gemini"
            TOKENIZER_PATH=$MODEL_PATH
            TOKENIZER_TYPE="gemini"
            GEMINI_API_KEY=""
            ;;
    esac


    if [ -z "${TOKENIZER_PATH}" ]; then
        if [ -f ${MODEL_PATH}/tokenizer.model ]; then
            TOKENIZER_PATH=${MODEL_PATH}/tokenizer.model
            TOKENIZER_TYPE="nemo"
        else
            TOKENIZER_PATH=${MODEL_PATH}
            TOKENIZER_TYPE="hf"
        fi
    fi


    echo "$MODEL_PATH:$MODEL_TEMPLATE_TYPE:$MODEL_FRAMEWORK:$TOKENIZER_PATH:$TOKENIZER_TYPE:$OPENAI_API_KEY:$GEMINI_API_KEY:$AZURE_ID:$AZURE_SECRET:$AZURE_ENDPOINT"
}
