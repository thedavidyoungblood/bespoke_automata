# Bespoke Automata

![image](https://github.com/C0deMunk33/bespoke_automata/assets/13264637/d0ec34ae-b52d-4da5-b56e-049d0388a7a1)



## ⚠️ READ CAREFULLY, INSTALLATION IS NOT STREAMLINED ⚠️ ##
Up until this point, this has been in internal tool to allow me to build super complex agents. The code is not clean, nor optomized, and there's a lot of scripts and whatnot to call to get the stack running. I am working to address all of these, please submit issues you find.

## how to install/run BA and it's stack:

### Requirements
* NPM
  * Electron-forge
  * Yarn
* Python
  * flask
  * sentence_transformers

#### Optional GPU support
* Cuda/Blas/etc setup
* Cuda Toolkit
* NVCC
* For metal support in MAC OSX, llama-cpp-python should work out of the box

### GUI
The bespoke automata GUI is a node graph UI using a modified litegraph, so it should be familiar to ComfyUI users

* clone repo https://github.com/C0deMunk33/bespoke_automata
* npm run start
* work through installing the modules until it works

### Llama:
The LLM API uses llama-cpp-python https://github.com/abetlen/llama-cpp-python

* place models in the folder `../models/text`
* **NOTE THIS IS AT THE SAME LEVEL AS THIS REPO**, GGUF work best IMO, get then from Hugging Face.* **NOTE:** if you are running non-cuda (Apple silicon, AMD, Intel,CPU etc) you will need to follow the instructions on https://github.com/abetlen/llama-cpp-python to compile for your hardware **NOTE:** llama-cpp-python binaries on Apple M* hardware has been tested to be grand.
* **METAL OSX**: `CMAKE_ARGS="-DLLAMA_CUBLAS=on" pip install llama-cpp-python`
* **CUDA LINUX**: `CMAKE_ARGS="-DLLAMA_CUBLAS=on" pip install llama-cpp-python`
* **CUDA WINDOWS**: `$env:CMAKE_ARGS = "-DLLAMA_CUBLAS=on"` then `pip install llama-cpp-python`
* `cd bespoke_automata/APIs/`
* `python llama_api.py`
* **work through pip installs until it works**
* the server will be `your_ip:5000`
* endpoint acts like GPT (and defaults to GPT, but that may be broken)

  **NOTE:** On OSX, port 5000 collides with Airplay Receiver. You can either turn it off in Settings > General > Airdrop & Handoff or switch the port in the config.

### Simple Vector DB:
For simple vector DB nodes, you will need to have this running

* `cd bespoke_automata/APIs/`
* `python simple_vector_db_api.py`
* **work through any pip installs**
* endpoint will be `your_ip:4999`

### Back end:
Once completed, a brain can be deployed as API endpoints.

* save brain to `bespoke_automata/bespoke_manager/graphs`
* cd `bespoke_automata/bespoke_manager/`
* `node server.js`
* **work through any NPM install issues**
* Brains will be `your_ip:9999`
* `your_ip:9999/brains` will list brains
* `your_ip:9999/brains/[brain filename sans extension]` is brain endpoint
* `your_ip:9999/brains/[brain filename sans extension]/schema` shows IO params for that brain

### More Info:
* Demo Brains: `./bespoke_manager/graphs`
* Example: https://youtu.be/w_saaTFEuSM
* Issues: Create an issue here or ping me at: https://twitter.com/icodeagents
* Contact: https://twitter.com/icodeagents
* Discord: https://discord.gg/hAd6WuYf

## THANKS AND GOOD LUCK!! ##
