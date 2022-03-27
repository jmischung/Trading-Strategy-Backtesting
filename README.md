# Trading Strategy Backtesting

This project's aim is to determine the optimal ML model(s) for a given strategy. The model(s) chosen at the end of the notebook can be set as a constant, along with the strategy, allowing for further exploration of feature engineering and hyperparameter tuning.


## Technologies

The project utilizes python 3.9 along with the following packages:

- [pandas](https://pandas.pydata.org/) - Python software library for data manipulation.
- [Pandas Data Reader](https://pandas-datareader.readthedocs.io/en/latest/) - Remote data access for pandas
- [YFinance](https://pypi.org/project/yfinance/) - Open source tool for Yahoo's publicly available API, for education and research purposes
- [Sklearn](https://scikit-learn.org/stable/index.html) - Machine learning tools for predictive data analysis

Other technologies that were utilized within this project are listed here:

- [DigitalOcean](https://www.digitalocean.com/) - Cloud hosting service that offers simple, lightweight VPS options.
- [Docker](https://docs.docker.com/) - Platform that offers virtual software packages within unique containers. 




## Installation Guide

Clone the repository to your desired location, and confirm that python 3.9 or greater and the packages listed in the Technologies section are installed.

```python
pip install pandas
pip install pandas-datareader
pip install -U scikit-learn
pip install yfinance
pip install matplotlib
```

## Getting Started

```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

import pandas_datareader.data as pdr
import yfinance as yf

from sklearn.preprocessing import RobustScaler
from sklearn.pipeline import Pipeline

from sklearn.ensemble import RandomForestClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.discriminant_analysis import (
    LinearDiscriminantAnalysis as LDA,
    QuadraticDiscriminantAnalysis as QDA
)
from sklearn.svm import LinearSVC, SVC

from sklearn.metrics import classification_report
```



## Contributors

- Josh Mischung: josh@knoasis.io // [LinkedIn](https://www.linkedin.com/in/joshmischung/)
- Max Acheson: maxacheson@gmail.com // [LinkedIn](https://www.linkedin.com/in/max-acheson-75093a19a/)
- Emily Bertani: emily.bertani.md@gmail.com // [LinkedIn](https://www.linkedin.com/in/emily-bertani-1ab184222/)

## License

MIT License

Copyright (c) [2022] [Joshua Mischung, Max Acheson, Emily Bertani]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
