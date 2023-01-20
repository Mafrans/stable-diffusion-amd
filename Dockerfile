FROM rocm/pytorch:latest


WORKDIR /opt/app
ADD stable-diffusion-webui /opt/app/

RUN apt update
RUN python -m venv venv
RUN . venv/bin/activate
RUN python -m pip install --upgrade pip wheel

ENV TORCH_COMMAND='pip install torch torchvision --extra-index-url https://download.pytorch.org/whl/rocm5.2'
ENV REQS_FILE='requirements.txt'

RUN python -c 'from launch import *; prepare_enviroment()' --skip-torch-cuda-test
RUN pip install --force-reinstall httpcore==0.15

RUN python -c 'from webui import *; initialize()'

EXPOSE 7860
CMD ["python", "launch.py", "--listen", "--no-half" ]