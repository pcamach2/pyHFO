FROM python:3.9

RUN cd /opt && git clone https://github.com/roychowdhuryresearch/pyHFO.git && git checkout pyBrain && cd pyHFO
RUN conda create -n pyhfo python=3.9
RUN conda activate pyhfo
RUN pip install -r /opt/pyHFO/requirements.txt

ENTRYPOINT ["python", "your_script.py"]
