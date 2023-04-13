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

   <code>👉 If you already have a checkpoint file for stable diffusion or one of its derivatives, you may skip this step.</code>

3. Download the yaml configuration file for your checkpoint.

   This step is only necessary if you're using the Stable Diffusion 2 checkpoint file linked above.
   Select and download the correct file from [stable-diffusion-webui's dependency guide](https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Dependencies#yaml-files-for-sd-2x-models).

   Place this file alongside your ckpt file in <code><kbd>Project root</kbd>/stable-diffusion-webui/models/Stable-diffusion</code>. It should have the same name as the checkpoint, so if you're using the checkpoint `768-v-ema.ckpt` that means the config file should be called `768-v-ema.yaml` – you get the idea.

4. Install dependencies and build the image

   Once the model files are in place, you should be able to build the docker image by running
   <pre>$ docker build . -t <kbd>Choose a name</kbd></pre>

   All relevant dependencies should be installed during the build process, and you will not have to install anything more once it is done.

   <code>⚠️ This step will take several minutes and requires 40-50 gigabytes of storage.</code>

   <code>👉 Images aren't automatically deleted if the build process fails, so remember to delete your old images if you need to cancel the build process, or if it errors.</code>

5. Start the Stable Diffusion image

   Now that you have build the image, you can start it by running
   <pre>$ ./start.sh <kbd>The name you chose</kbd></pre>

6. Open the GUI in your browser

   Go to http://localhost:7860 and start generating!

   For tips on how to generate good images, read through the [Tips & Tricks](./TIPS.md) guide.

   <code>⚠️ Stable diffusion sometimes doesn't give you any indication of exactly when the web server is started. Reload the page until it's all up and running, shouldn't take more than a minute or two.</code>

   <code>⚠️ The first generation will often take a while, subsequent generations will be considerably quicker.</code>
