# ISLP

Book club for Introduction to Statistical Learning with applications in Python

- View at https://hastie.su.domains/ISLP/ISLP_website.pdf.view-in-google.html
- Download at https://hastie.su.domains/ISLP/ISLP_website.pdf.download.html

## Clone
- `https`:
  ```shell
  git clone --recurse-submodules https://github.com/bomtall/islp.git
  ```
  
- `ssh`:
  ```shell
  git clone --recurse-submodules git@github.com:bomtall/islp.git
  ```

## Installation
- `conda` - if you already have `conda` installed (otherwise visit [this page](https://docs.conda.io/projects/miniconda/en/latest/miniconda-install.html))

  1. Create a `conda` environment
  ```
  conda create -n islp python=3.11
  ```
  2. Activate the environment
  ```
  conda activate islp
  ```
  3. Pip install the requirements
  ```
  pip install -r requirements.txt
  ```
  