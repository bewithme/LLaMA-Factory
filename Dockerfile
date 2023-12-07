FROM registry.cn-hangzhou.aliyuncs.com/bewithmeallmylife/11.4.0-cudnn8-runtime-ubuntu18.04-conda-python3.8-qt5:1.0.0

USER root
ENV PATH /root/anaconda3/bin:$PATH
RUN  conda create -n llama_factory python=3.10 -y
SHELL ["conda", "run", "-n", "llama_factory", "/bin/bash", "-c"]
ENV LANGUAGE zh_CN:zh

RUN pip install torch==2.0.1  -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
RUN pip install transformers==4.31.0  -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
RUN pip install datasets>=2.14.0  -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
RUN pip install accelerate>=0.21.0  -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
RUN pip install peft>=0.6.0  -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
RUN pip install trl>=0.7.4  -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
RUN pip install gradio==3.38.0   -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
RUN pip install scipy  -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
RUN pip install sentencepiece  -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
RUN pip install protobuf  -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
RUN pip install tiktoken  -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
RUN pip install jieba  -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
RUN pip install rouge-chinese  -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
RUN pip install nltk  -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
RUN pip install uvicorn  -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
RUN pip install pydantic  -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
RUN pip install fastapi  -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
RUN pip install sse-starlette  -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
RUN pip install matplotlib  -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
RUN pip install transformers_stream_generator einops  -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
WORKDIR /app/LLaMA-Factory


ADD assets assets
ADD data data
ADD evaluation evaluation
ADD src src
ADD tests tests

#HF_ENDPOINT=https://hf-mirror.com  python src/train_web.py

#sudo docker build -t='registry.cn-hangzhou.aliyuncs.com/bewithmeallmylife/llama-factory-app-cuda-11.4.0:1.0.0' .


#sudo docker run --net=host  --gpus '"device=0,1"' --privileged -v /home/xuwenfeng/app-sourcecode/LLM/LLaMA-Factory:/app/LLaMA-Factory -v /home/xuwenfeng/app-sourcecode/LLM/cache:/root/.cache -it -d registry.cn-hangzhou.aliyuncs.2                     / 不过他骗人，kefo0-/kv， ，从喜上眉梢我把情人2 3vocom/bewithmeallmylife/llama-factory-app-cuda-11.4.0:1.0.0