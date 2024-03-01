# Bespoke Automata

![image](https://github.com/C0deMunk33/bespoke_automata/assets/13264637/d0ec34ae-b52d-4da5-b56e-049d0388a7a1)

<details>

<summary>Bespoke Automata, An Introduction</summary>

## About Bespoke Automata

Create and deploy sophisticated Agent AI's to a single API with Bespoke Automata. With Bespoke Automata, you can combine large  language models running locally or remotely with instruments for database IO, dictionaries, arrays, logic, APIs and more into powerful Brains capable of pursuing goals set by their designers.

With Bespoke Automata, you can design and test brains via a Directed Graph GUI (powered by litegraph), and deploy them behind a single user friendly API, each brain a different endpoint.
</details>

#### Demo Video

[![Demo Video](https://img.youtube.com/vi/w_saaTFEuSM/0.jpg)](https://www.youtube.com/watch?v=w_saaTFEuSM)

## ⚠️ READ CAREFULLY, INSTALLATION IS NOT STREAMLINED ⚠️ ##

This is a development release and while the software is maturing, I would recommend you approach the installation process as you would any software under development. If you encounter any problems or would like to propose an improvement, please raise an issue. Join us on Discord, we would love to hear about what you're building with Bespoke Automata.

## How to install/run BA and it's stack

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

## Installation

Clone the repository and open the directory

```
git clone https://github.com/C0deMunk33/bespoke_automata
cd bespoke_automata
```

Use yarn to install and run

```
yarn install
yarn run start
```

work through installing the modules until it works

### BA API

The BA API uses [llama-cpp-python](https://github.com/abetlen/llama-cpp-python) for text inference and vision

* place text models in the folder `../models/text`
* place vision models in the folder `../models/vision`
* **NOTE THIS IS AT THE SAME LEVEL AS THIS REPO**, GGUF work best IMO, get then from Hugging Face.***NOTE:** if you are running non-cuda (Apple silicon, AMD, Intel,CPU etc) you will need to follow the instructions on <https://github.com/abetlen/llama-cpp-python> to compile for your hardware **NOTE:** llama-cpp-python binaries on Apple M* hardware have been tested to be grand.
* **Metal OSX**: `CMAKE_ARGS="-DLLAMA_METAL=on" pip install llama-cpp-python`
* **CUDA LINUX**: `CMAKE_ARGS="-DLLAMA_CUBLAS=on" pip install llama-cpp-python`
* **CUDA WINDOWS**: `$env:CMAKE_ARGS = "-DLLAMA_CUBLAS=on"` then `pip install llama-cpp-python`
* **CPU**: `pip install llama-cpp-python`
* `cd bespoke_automata/APIs/`
* `python omni_api.py`
* **work through pip installs until it works**
* the server will be `your_ip:5000`
* endpoint for text acts like GPT (and defaults to GPT, but that may be broken)

  **NOTE:** On OSX, port 5000 collides with Airplay Receiver. You can either turn it off in Settings > General > Airdrop & Handoff or switch the port in the config.

### Back end

Once completed, a brain can be deployed as API endpoints.

* save brain to `bespoke_automata/bespoke_manager/graphs`
* cd `bespoke_automata/bespoke_manager/`
* `node server.js`
* **work through any NPM install issues**
* Brains will be `your_ip:9999`
* `your_ip:9999/brains` will list brains
* `your_ip:9999/brains/[brain filename sans extension]` is brain endpoint
* `your_ip:9999/brains/[brain filename sans extension]/schema` shows IO params for that brain

### More Info

* Demo Brains: `./bespoke_manager/graphs`
* Example: <https://youtu.be/w_saaTFEuSM>
* Issues: Create an issue here or ping me at: <https://twitter.com/icodeagents>
* Contact: <https://twitter.com/icodeagents>
* Discord: [https://discord.gg/hAd6WuYf](https://discord.gg/RdK3uESV)

## THANKS AND GOOD LUCK

---

# EXPANDED FOR WINDOWS CUDA

## Bespoke Automata Installation Guide for Windows with CUDA Support

This walkthrough is designed to get you up and running with Bespoke Automata (BA) on a Windows system, focusing especially on configurations that utilize CUDA for GPU support. Below, you'll find a step-by-step guide that covers the prerequisites, installation process, and post-installation steps for utilizing BA effectively.

### Prerequisites

Before diving into the installation process, ensure that your system meets the following requirements:

* **NPM** is installed on your machine.
* **Python** is installed with the ability to install additional packages.
* **CUDA Toolkit** and **NVCC** are installed for GPU support.

## Setting Up a Virtual Environment for Bespoke Automata on Windows

Creating a virtual environment is a best practice in Python development as it allows you to manage project dependencies separately from your global Python installation. This guide will walk you through setting up a virtual environment for Bespoke Automata in a Windows environment, specifically targeting the path `L:\tDY_DEV-PG_MAIN\BeSpoke_automata\bespoke_automata`.

### Prerequisites

Before beginning, ensure you have Python installed on your system. Python's installation should include pip (Python's package installer) and venv (the standard tool for creating virtual environments).

### Step-by-Step Guide

1. **Open Command Prompt**
   * Press `Win + R`, type `cmd`, and press Enter to open the command prompt.

2. **Navigate to Your Project Directory**
   * Change your directory to where you want your Bespoke Automata project to reside using the `cd` command:

     ```bash
     C:
     cd C:\path\BeSpoke_automata\
     ```

3. **Create the Virtual Environment**
   * Run the following command to create a virtual environment named `env` (or any name you prefer) in the current directory:

     ```
     python -m venv env
     ```

   * This command creates a new directory `env` within `C:\path\BeSpoke_automata\\bespoke_automata`, containing the virtual environment.

4. **Activate the Virtual Environment**
   * To activate the virtual environment, run:

     ```
     env\Scripts\activate
     ```

   * Once activated, you will see `(env)` prefixed to your command line prompt, indicating that any Python or pip commands will now use the virtual environment's packages and settings.

5. **Install Required Packages**
   * With your virtual environment active, install the necessary packages for Bespoke Automata. Begin with upgrading pip:

     ```
     python -m pip install --upgrade pip
     ```

   * Install project-specific dependencies (e.g., Flask, Yarn, Electron-forge) as required by Bespoke Automata. Since Bespoke Automata requires Node.js packages as well, make sure Node.js and NPM are installed globally on your system.

6. **Setting Up CUDA (Optional)**
   * For GPU support, ensure CUDA Toolkit and related dependencies are installed globally on your system. Follow the specific instructions for installing `llama-cpp-python` with CUDA support, as outlined in the Bespoke Automata guide.

### Post-Installation Steps

After setting up your virtual environment and installing all dependencies, you can proceed with cloning Bespoke Automata (if not done already) and following the project's installation instructions within your virtual environment.

1. **Deactivate the Virtual Environment**
   * When you're done working in the virtual environment, you can deactivate it by running:

     ```
     deactivate
     ```

   * This command returns you to the global Python environment.

2. **Reactivating Your Virtual Environment**
   * To reactivate your virtual environment in future sessions, navigate to your project directory and run the activation command again:

     ```
     env\Scripts\activate
     ```

### Conclusion

By following these steps, you've successfully set up a virtual environment for Bespoke Automata development on Windows. This setup isolates your project's dependencies, making it easier to manage and share with others. Always activate your project's virtual environment before running or developing your project to ensure the correct dependencies are used.

### Installation Steps

1. **Clone the Repository**
   * Open your command line interface (CLI) and run the following commands:

     ```bash
     git clone https://github.com/C0deMunk33/bespoke_automata
     cd bespoke_automata
     ```

2. **Install Dependencies with Yarn**
   * Ensure Yarn is installed on your system. If not, install it via NPM:

     ```bash
     npm install --global yarn
     ```

   * Then, install the project dependencies and start the application:

     ```bash
     yarn install
     yarn run start
     ```

   * Follow the prompts to resolve any module installation issues that arise.

3. **Setup BA API with GPU Support**

#### EXPANDED

## Setting Up CUDA for Bespoke Automata on Windows

If you're aiming to leverage GPU acceleration for Bespoke Automata, specifically for functionalities like text inference and vision processing with `llama-cpp-python`, setting up CUDA on your Windows system is essential. This guide will walk you through installing the CUDA Toolkit and configuring `llama-cpp-python` with CUDA support.

### Prerequisites

* **NVIDIA GPU**: Ensure your system has an NVIDIA GPU that supports CUDA.
* **NVIDIA Drivers**: Make sure you have the latest NVIDIA drivers installed for your GPU.

### Step-by-Step Guide

1. **Install the CUDA Toolkit**
   * Go to the [CUDA Toolkit Download Page](https://developer.nvidia.com/cuda-downloads).
   * Select your operating system, architecture, version, and installer type. For Windows, you'll likely choose an exe (local) installer.
   * Download and run the installer. During installation, you can select the components to install. At a minimum, you need the CUDA Toolkit and the CUDA Samples. Install the driver if your current driver is older than the one provided.
   * Follow the installation prompts. After installation, restart your computer if required.

2. **Verify CUDA Installation**
   * Open the Command Prompt and type:

     ```bash
     nvcc --version
     ```

   * This command should return the version of the CUDA Compiler (NVCC). If it does not, ensure that CUDA's bin directory is added to your system's PATH environment variable.

3. **Install `llama-cpp-python` with CUDA Support**
   * With CUDA Toolkit installed, you're ready to install `llama-cpp-python` with CUDA support. Before proceeding, activate your Python virtual environment where Bespoke Automata is set up.
   * Set the CUDA CMake arguments as an environment variable to ensure `llama-cpp-python` utilizes CUDA during installation:

     ```bash
     $env:CMAKE_ARGS = "-DLLAMA_CUBLAS=on"
     ```

   * Then, install `llama-cpp-python` using pip:

     ```bash
     pip install llama-cpp-python
     ```

   * This installation process will compile the necessary CUDA components for `llama-cpp-python`.

4. **Testing CUDA Support**
   * To verify that `llama-cpp-python` is utilizing CUDA, you can run a simple script that initializes the library and performs a task requiring GPU acceleration. Refer to the `llama-cpp-python` documentation for example scripts.

5. **Troubleshooting**
   * If you encounter issues during the CUDA Toolkit installation, refer to the [CUDA Installation Guide](https://docs.nvidia.com/cuda/cuda-installation-guide-microsoft-windows/index.html) for detailed troubleshooting steps.
   * For problems specifically related to `llama-cpp-python`, ensure that your CUDA Toolkit version is compatible with the library's requirements and that your NVIDIA drivers are up to date.

### Post-Installation Steps-CUDA

After successfully setting up CUDA and installing `llama-cpp-python` with GPU support, you can proceed with utilizing GPU-accelerated functionalities in Bespoke Automata. Remember to place your text and vision models in the designated directories and follow the Bespoke Automata documentation for deploying brains with GPU acceleration.

### Conclusion-CUDA

Setting up CUDA for Bespoke Automata on Windows enhances your project's capabilities by enabling GPU acceleration for processing tasks. By following these steps, you've equipped your development environment with the tools needed for high-performance AI and machine learning projects. Always ensure your system meets the hardware and software requirements for CUDA to optimize your development experience with Bespoke Automata.

---

### Continued...

* Prepare your environment for CUDA support. On Windows, set the environment variable for CMake arguments before installing `llama-cpp-python`:

     ```bash
     $env:CMAKE_ARGS = "-DLLAMA_CUBLAS=on"
     pip install llama-cpp-python
     ```

* Organize your models by placing text and vision models in the appropriate directories (`../models/text` and `../models/vision` respectively), ensuring these are at the same level as the `bespoke_automata` repository.
* Navigate to the API directory and start the BA API:

     ```bash
     cd APIs/
     python omni_api.py
     ```

* Address any pip install issues that arise to ensure the API is functional.

6. **Deploying Brains as API Endpoints**
   * Save your designed brain to `bespoke_automata/bespoke_manager/graphs`.
   * Navigate to the manager directory and start the server:

     ```bash
     cd bespoke_manager/
     node server.js
     ```

   * Resolve any NPM installation issues to get the server running.

### Post Installation

After completing the installation, you can access the brains you've deployed as API endpoints:

* The list of brains will be available at `your_ip:9999/brains`.
* Access a specific brain via `your_ip:9999/brains/[brain filename sans extension]`.
* To view the IO parameters for a brain, append `/schema` to its endpoint.

### Additional Information

* **Demo Brains:** Located in `./bespoke_manager/graphs` for reference and testing.
* **Support and Issues:** For any challenges or suggestions, consider raising an issue on the GitHub page or join the community on Discord for more interactive support.
* **CUDA Support Note:** Ensure your CUDA setup aligns with the requirements for `llama-cpp-python` and that your system's hardware is compatible.

### Conclusion-CUDA-ALL

By following these steps, you should have a functional installation of Bespoke Automata with CUDA support on your Windows system. Experiment with deploying and accessing various brains to explore the full capabilities of BA. Good luck, and don't hesitate to reach out to the community for help or to share your creations!
