# Stable Diffusion image for AMD Radeon GPUs (rx6000 & rx7000)

This repository contains instructions for building a docker image capable of running Stable Diffusion
on machines equipped with an AMD Radeon RX6000 or RX7000 graphics card. It has been tested on a RX6800
but should work on most cards in either family.

## Installation

To install Stable Diffusion you will need :whale: Docker installed. You may also need a HuggingFace account depending
on where you're sourcing your ckpt and yaml files.

1. Initialize the stable-diffusion-webui submodule inside this repository.

   ```sh
   $ git submodule update --init
   ```

2. Download the Stable Diffusion 2 checkpoint file. 

   The Stable Diffusion 2 checkpoint file can be found in
   [StabilityAI's repository on 🤗 Hugging Face](https://huggingface.co/stabilityai/stable-diffusion-2).
   Download the ckpt file from the <kbd>:page_facing_up: Files and versions</kbd> tab. Place the file in <code><kbd>Project root</kbd>/stable-diffusion-webui/models/Stable-diffusion</code>

   <code>:point_right: If you already have a checkpoint file for stable diffusion or one of its derivatives, you may skip this step.</code>

3. Download the yaml configuration file for your checkpoint.

   This step is a bit trickier if you're not using the latest Stable Diffusion 2 checkpoint file, but if you
   downloaded the checkpoint from Hugging Face in the previous step, it should be as easy as selecting the correct file from [stable-diffusion-webui's dependency guide](https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Dependencies#yaml-files-for-sd-2x-models). If you are using your own checkpoint, or one that isn't available in the dependency guide, you should be able to find a matching yaml file elsewhere.

   Place this file alongside your ckpt file in <code><kbd>Project root</kbd>/stable-diffusion-webui/models/Stable-diffusion</code>. It should have the same name as the checkpoint, so if you're using the checkpoint `768-v-ema.ckpt` that means the config file should be called `768-v-ema.yaml` – you get the idea.

4. Install dependencies and build the image  

    Once the model files are in place, you should be able to build the docker image by running
    ```sh
    $ docker build . -t stable-diffusion
    ```
    All relevant dependencies should be installed during the build process, and you will not have to install anything more once it is done.

    <code>:warning: This step will take several minutes and requires 40-50 gigabytes of storage.</code>

    <code>:point_right: Images aren't automatically deleted if the build process fails, so remember to delete your old images if you need to cancel the build process, or if it errors.</code>
