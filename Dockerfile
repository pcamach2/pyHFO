FROM python:3.9

RUN apt-get update && apt-get -y upgrade \
  && apt-get install -y --no-install-recommends \
    git \
    wget \
    g++ \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*
ENV PATH="/opt/miniconda3/bin:${PATH}"
ARG PATH="/opt/miniconda3/bin:${PATH}"
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b -u -p /opt/miniconda3 \
    && rm -f Miniconda3-latest-Linux-x86_64.sh \
    && echo "Running $(conda --version)" && \
    conda init bash && \
    . /root/.bashrc && \
    cd /opt && git clone https://github.com/roychowdhuryresearch/pyHFO.git && git checkout pyBrain && cd /opt/pyHFO && \
    conda update conda && \
    conda create -n pyhfo && \
    conda activate pyhfo && \
    conda install python=3.9 pip && \
    pip install -r /opt/pyHFO/requirements.txt 
    
ENTRYPOINT ["python", "main.py"]
