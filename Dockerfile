FROM rocm/pytorch:latest


WORKDIR /opt/app
ADD stable-diffusion-webui /opt/app/

RUN apt update
RUN python -m venv venv
RUN . venv/bin/activate
RUN python -m pip install --upgrade pip wheel

RUN python -c 'import launch; launch.prepare_environment()' --skip-torch-cuda-test
RUN pip install --force-reinstall httpcore==0.15

RUN python -c 'import webui; webui.initialize()'

EXPOSE 7860
CMD ["python", "launch.py", "--listen", "--no-half" ]