# -*- coding: utf-8 -*-
"""
Created on Tue Mar  5 22:49:33 2019

@author: Dell
"""

# NLP

# Importing the Libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd


# Importing the dataset

dataset = pd.read_csv('Restaurant_Reviews.tsv', delimiter = '\t', quoting = 3)

# Cleaning the texts
import re
import nltk
nltk.download('stopwords')
from nltk.corpus import stopwords
from nltk.stem.porter import PorterStemmer
ps = PorterStemmer()
review = re.sub('[^a-zA-Z]', ' ', dataset['Review'][0])
review = review.lower()
review = review.split()
review = [ps.stem(word) for word in review if not word in set(stopwords.words('english'))]