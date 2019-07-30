FROM pytorch/pytorch:0.4.1-cuda9-cudnn7-devel
RUN apt-get update && apt-get install -y git htop less graphviz && apt-get clean
RUN conda install -y numpy
RUN pip install --upgrade pip && pip install Cython && \
    pip install --upgrade torch==1.0.0 && pip install jupyterlab matplotlib scikit-image nltk\
    torchfile pandas easydict pyyaml pytest dill torchvision==0.2.1 dominate scipy==1.2.0 visdom
RUN cd /opt && git clone https://github.com/mseitzer/pytorch-fid.git &&\
 git clone https://github.com/sbarratt/inception-score-pytorch.git

ENV PYTHONPATH /opt/project
WORKDIR /workspace
