# Tips and tricks
So you want to generate a good-looking image, huh? Here are a few tips and tricks.

## Image resolution should match the checkpoint
Make sure your width and height is roughly equal the checkpoint you're using. If you're using `768-v-ema.ckpt`, set them to 768px. You get the idea. If you want an image that isn't exactly square, it's usually safer to go up than down (1024x768, etc).

## Picking a sampler
Picking the correct sampler for the job is vital for producing the images you want. Each sampler works a little differently and has its own strengths and weaknesses.

| Sampler | Description |
| --- | --- |
| Euler (and derivatives) | The default sampler. The fastest sampler in the bunch, but also one of the least accurate. |
| Heun | An improved Euler sampler. About half as fast as Euler, but produces better images. |
| LMS and PLMS | Cousins of Euler, using a slightly different sampling method. PLMS is generally more suited for the weirdness that comes with machine learning. |
| DDIM | A neural network-based sampler. Produces very good results but takes a lot of steps. Make sure to crank up the sampling steps when using this method. |
| DPM2 | A fork of DDIM designed specifically for diffusion models like Stable Diffusion, powerful but very slow. Just like DDIM, make sure to crank up the sampling steps. |

See the handy table below for a quick overview of the samplers.
![Stable diffusion images](https://external-preview.redd.it/6TcOaPWKlFiV9riDD4sak6UfI_E_tFBKyn65GodoC5A.jpg?auto=webp&v=enabled&s=a8fcde5a093b17467f125b23d5c0a113b4b1a15f)

## Sampling steps
Depending on your sampler, the number of steps required to generate good output varies a lot. PLMS, DDIM and DPM2 all require high step counts to produce good results, while Euler and Heun can get away with much lower step counts. The default step count is 20, which is quite low, you should consider increasing this to between 40 and 150 depending on your sampler.

You can test out a prompt by running it at a very low step size initially, then copying the seed and running it at a higher step size. This will give you a decent idea of how many steps you need to generate good output.