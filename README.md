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

## Useful Links
- Video Playlists:  [Lectures and labs by the authors](https://www.youtube.com/watch?v=LvySJGj-88U&list=PLoROMvodv4rPP6braWoRt5UCXYZ71GZIQ) | [Just the labs](https://www.youtube.com/playlist?list=PLoROMvodv4rNHU1-iPeDRH-J0cL-CrIda)
- ISLP [EdX Course](https://www.edx.org/learn/data-analysis-statistics/stanford-university-statistical-learning-with-python): [includes](https://www.youtube.com/playlist?list=PLB-uqcaWc_25dsl5aH36bA_pP_71FXqyj) interviews with Friedman, Pérez, Efron, Hinton, Cox, Benjamini (requires free enroll)
- ISLP website, <https://statlearning.com>
  - [Errata](https://www.statlearning.com/errata-python-edition) (NB Labs are updated separately from errata list)
  - [Resources](https://www.statlearning.com/resources-python) (links to slides, data sets as csv, [Lab Notebooks](https://github.com/intro-stat-learning/ISLP_labs/tree/stable))
  - [ISLP python package documentation](https://intro-stat-learning.github.io/ISLP/)
- 3rd party solutions to ISLR 1st Ed in Python: [one](https://github.com/botlnec/islp), [two](http://blog.princehonest.com/stat-learning/)
- Elements of Statistical Learning (ESL) [Website](https://tibshirani.su.domains/ElemStatLearn.1stEd/)
  - 3rd party solutions to ESL: [one](https://yuhangzhou88.github.io/ESL_Solution/), [two](https://waxworksmath.com/Authors/G_M/Hastie/WriteUp/Weatherwax_Epstein_Hastie_Solution_Manual.pdf), [three(partial)](https://github.com/alanjeffares/elements-of-statistical-learning), [four(partial)](https://getd.libs.uga.edu/pdfs/ma_james_c_201412_ms.pdf)
