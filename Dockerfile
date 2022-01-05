FROM pytorch/pytorch:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
         gcc \
         g++ \
         libsm6 \
         libxext6 \
         libxrender-dev \
         nodejs \
         sox \
         libsndfile1 \
         git && \
     rm -rf /var/lib/apt/lists/*

RUN /opt/conda/bin/conda install -y nodejs opencv Cython tensorflow pandas scikit-learn matplotlib seaborn jupyter jupyterlab wget ffmpeg unidecode&& \
    /opt/conda/bin/conda clean -ya

RUN mkdir -p /home/me && chmod 1777 /home/me

ENV HOME /home/me

# jupyter notebook
EXPOSE 8888

COPY start.sh /

CMD ["/start.sh"]

