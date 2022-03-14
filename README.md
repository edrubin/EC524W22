
# EC 524, Winter 2022

Welcome to Economics 524 (424): Prediction and machine-learning in econometrics, taught by [Ed Rubin](https://edrub.in) and [Andrew Dickinson](https://economics.uoregon.edu/profile/adickin3/).

## Schedule

**Lecture** Monday and Wednesday, 10:00a–11:20a (Pacific), [220 Chapman](https://map.uoregon.edu/cd63d45ec)

**Lab** Friday, 12:00p–12:50p (Pacific), [220 Chapman](https://map.uoregon.edu/cd63d45ec)

**Office hours**

- **Ed Rubin** Tuesdays, 3:30p–5:00p, [Zoom](https://uoregon.zoom.us/j/99805127132?pwd=NzROS2hCY0ljSGc4SXFOY3RvYm1SUT09)
- **Andrew Dickinson** Thursdays, 2:00p-3:00p, [Zoom](https://uoregon.zoom.us/j/6669213025)


## Syllabus

[**Syllabus**](https://raw.githack.com/edrubin/EC524W22/master/syllabus/syllabus.pdf)

## Books

### Required books

- [Introduction to Statistical Learning](https://www-bcf.usc.edu/~gareth/ISL/)
- [The Hundred-Page Machine Learning Book](http://themlbook.com/)
- [Data Visualization](https://socviz.co/)

### Suggested books

- [R for Data Science](https://r4ds.had.co.nz/)
- [Introduction to Data Science](https://www.springer.com/us/book/9783319500164) (not available without purchase)
- [The Elements of Statistical Learning](http://web.stanford.edu/~hastie/ElemStatLearn/)
- [Data Science for Public Policy](https://link.springer.com/book/10.1007/978-3-030-71352-2) (not available without purchase)

## Lecture notes

[**000 - Overview (Why predict?)**](https://raw.githack.com/edrubin/EC524W22/master/lecture/000/000-slides.html)

1. Why do we have a class on prediction?
2. How is prediction (and how are its tools) different from causal inference?
3. Motivating examples

**Formats** [.html](https://raw.githack.com/edrubin/EC524W22/master/lecture/000/000-slides.html) | [.pdf](https://github.com/edrubin/EC524W22/blob/master/lecture/000/000-slides.pdf) | [.Rmd](https://github.com/edrubin/EC524W22/blob/master/lecture/000/000-slides.Rmd)

**Readings** Introduction in *ISL*

[**001 - Statistical learning foundations**](https://raw.githack.com/edrubin/EC524W22/master/lecture/001/001-slides.html)

1. Why do we have a class on prediction?
2. How is prediction (and how are its tools) different from causal inference?
3. Motivating examples

**Formats** [.html](https://raw.githack.com/edrubin/EC524W22/master/lecture/001/001-slides.html) | [.pdf](https://github.com/edrubin/EC524W22/blob/master/lecture/001/001-slides.pdf) | [.Rmd](https://github.com/edrubin/EC524W22/blob/master/lecture/001/001-slides.Rmd)

**Readings**

- [Prediction Policy Problems](https://www.aeaweb.org/articles?id=10.1257/aer.p20151023) by Kleinberg *et al.* (2015)
- *ISL* Ch1
- *ISL* Start Ch2

**Supplements** [Unsupervised character recognization](https://colah.github.io/posts/2014-10-Visualizing-MNIST/)

[**002 - Model accuracy**](https://raw.githack.com/edrubin/EC524W22/master/lecture/002/002-slides.html)

1. Model accuracy
1. Loss for regression and classification
1. The variance-bias tradeoff
1. The Bayes classifier
1. KNN

**Formats** [.html](https://raw.githack.com/edrubin/EC524W22/master/lecture/002/002-slides.html) | [.pdf](https://github.com/edrubin/EC524W22/blob/master/lecture/002/002-slides.pdf) | [.Rmd](https://github.com/edrubin/EC524W22/blob/master/lecture/002/002-slides.Rmd)

**Readings** 

- *ISL* Ch2–Ch3
- *Optional:* *100ML* Preface and Ch1–Ch4

[**003 - Resampling methods**](https://raw.githack.com/edrubin/EC524W22/master/lecture/003/003-slides.html)

1. Review
1. The validation-set approach
1. Leave-out-out cross validation
1. k-fold cross validation
1. The bootstrap

**Formats** [.html](https://raw.githack.com/edrubin/EC524W22/master/lecture/003/003-slides.html) | [.pdf](https://github.com/edrubin/EC524W22/blob/master/lecture/003/003-slides.pdf) | [.Rmd](https://github.com/edrubin/EC524W22/blob/master/lecture/003/003-slides.Rmd)

**Readings**

- *ISL* Ch5
- *Optional:* *100ML* Ch5

[**004 - Linear regression strikes back**](https://raw.githack.com/edrubin/EC524W22/master/lecture/004/004-slides.html)

1. Returning to linear regression
1. Model performance and overfit
1. Model selection—best subset and stepwise
1. Selection criteria

**Formats** [.html](https://raw.githack.com/edrubin/EC524W22/master/lecture/004/004-slides.html) | [.pdf](https://github.com/edrubin/EC524W22/blob/master/lecture/004/004-slides.pdf) | [.Rmd](https://github.com/edrubin/EC524W22/blob/master/lecture/004/004-slides.Rmd)

**Readings**

- *ISL* Ch3
- *ISL* Ch6.1

**In between: `tidymodels`-ing**

- [An introduction to preprocessing with `tidymodels`](https://www.kaggle.com/edwardarubin/intro-tidymodels-preprocessing). (Kaggle notebook)
- [An introduction to modeling with `tidymodels`](https://www.kaggle.com/edwardarubin/intro-tidymodels-modeling). (Kaggle notebook)
- [An introduction to resampling, model tuning, and workflows with `tidymodels`](https://www.kaggle.com/edwardarubin/intro-tidymodels-resampling) (Kaggle notebook)
- [Introduction to `tidymodels`: Follow up for Kaggle](https://www.kaggle.com/edwardarubin/intro-tidymodels-split-kaggle)

[**005 - Shrinkage methods**](https://raw.githack.com/edrubin/EC524W22/master/lecture/005/005-slides.html)

(AKA: Penalized or regularized regression)

1. Ridge regression
1. Lasso
1. Elasticnet

**Formats** [.html](https://raw.githack.com/edrubin/EC524W22/master/lecture/005/005-slides.html) | [.pdf](https://github.com/edrubin/EC524W22/blob/master/lecture/005/005-slides.pdf) | [.Rmd](https://github.com/edrubin/EC524W22/blob/master/lecture/005/005-slides.Rmd)

**Readings**

- *ISL* Ch4
- *ISL* Ch6

[**006 - Classification intro**](https://raw.githack.com/edrubin/EC524W22/master/lecture/006/006-slides.html)

1. Introduction to classification
1. Why not regression?
1. But also: Logistic regression
1. Assessment: Confusion matrix, assessment criteria, ROC, and AUC

**Formats** [.html](https://raw.githack.com/edrubin/EC524W22/master/lecture/006/006-slides.html) | [.pdf](https://github.com/edrubin/EC524W22/blob/master/lecture/006/006-slides.pdf) | [.Rmd](https://github.com/edrubin/EC524W22/blob/master/lecture/006/006-slides.Rmd)

**Readings**

- *ISL* Ch4

[**007 - Decision trees**](https://raw.githack.com/edrubin/EC524W22/master/lecture/007/007-slides.html)

1. Introduction to trees
1. Regression trees
1. Classification trees—including the Gini index, entropy, and error rate

**Formats** [.html](https://raw.githack.com/edrubin/EC524W22/master/lecture/007/007-slides.html) | [.pdf](https://github.com/edrubin/EC524W22/blob/master/lecture/007/007-slides.pdf) | [.Rmd](https://github.com/edrubin/EC524W22/blob/master/lecture/007/007-slides.Rmd)

**Readings**

- *ISL* Ch8.1–Ch8.2

[**008 - Ensemble methods**](https://raw.githack.com/edrubin/EC524W22/master/lecture/008/008-slides.html)

1. Introduction
1. Bagging
1. Random forests
1. Boosting

**Formats** [.html](https://raw.githack.com/edrubin/EC524W22/master/lecture/008/008-slides.html) | [.pdf](https://github.com/edrubin/EC524W22/blob/master/lecture/008/008-slides.pdf) | [.Rmd](https://github.com/edrubin/EC524W22/blob/master/lecture/008/008-slides.Rmd)

**Readings**

- *ISL* Ch8.2

[**009 - Support vector machines**](https://raw.githack.com/edrubin/EC524W22/master/lecture/009/009-slides.html)

1. Hyperplanes and classification
2. The maximal margin hyperplane/classifier
3. The support vector classifier
4. Support vector machines

**Formats** [.html](https://raw.githack.com/edrubin/EC524W22/master/lecture/009/009-slides.html) | [.pdf](https://github.com/edrubin/EC524W21/blob/master/lecture/009/009-slides.pdf) | [.Rmd](https://github.com/edrubin/EC524W22/blob/master/lecture/009/009-slides.Rmd)

**Readings**

- *ISL* Ch9

[**010 - Dimensionality reduction and unsupervised learning**](https://raw.githack.com/edrubin/EC524W22/master/lecture/010/010-notebook.html)

0. MNIST dataset (machines with vision)
1. *K*-means clustering
2. Principal component analysis (PCA)
3. UMAP

**Formats** [.html](https://raw.githack.com/edrubin/EC524W22/master/lecture/010/010-notebook.html) | [.pdf](https://github.com/edrubin/EC524W22/blob/master/lecture/010/010-notebook.pdf) | [.Rmd](https://github.com/edrubin/EC524W22/blob/master/lecture/010/010-notebook.Rmd)

## Projects

Planned projects

**000** [Predicting sales price in housing data (Kaggle)](https://github.com/edrubin/EC524W22/tree/master/projects/project-000)

**Help:** 

- [A simple example/walkthrough](https://www.kaggle.com/edwardarubin/project-000-example)
- [Kaggle notebooks](https://rpubs.com/Clennon/KagNotes) (from Connor Lennon)

**001** [Validation and out-of-sample performance](https://github.com/edrubin/EC524W22/tree/master/projects/project-001)

**002** [Penalized regression, logistic regression, and classification](https://github.com/edrubin/EC524W22/tree/master/projects/project-002)

**003** [Nonlinear predictors](https://github.com/edrubin/EC524W22/tree/master/projects/project-003)

**004** [Image/multi-class classification (MNIST)](https://github.com/edrubin/EC524W22/tree/master/projects/project-004)

## Class project

[Outline of the project](https://github.com/edrubin/EC524W22/tree/master/projects/class-project)

**Topic and group due by February 16th**.

**Final project submission due by midnight on March 9th.**

## Lab notes

Approximate/planned topics...

[**000 - Workflow and cleaning**](https://raw.githack.com/edrubin/EC524W22/master/lab/000-cleaning/000-slides.html)

1. General "best practices" for coding
2. Working with RStudio
3. The pipe (`%>%`)
4. Cleaning and Kaggle follow up

**Formats** [.html](https://raw.githack.com/edrubin/EC524W22/master/lab/000-cleaning/000-slides.html) | [.pdf](https://raw.githack.com/edrubin/EC524W22/master/lab/000-cleaning/000-slides.pdf) | [.Rmd](https://raw.githack.com/edrubin/EC524W22/master/lab/000-cleaning/000-slides.Rmd)

[**001 - Workflow and cleaning**](https://raw.githack.com/edrubin/EC524W22/master/lab/001-cleaning/001-markdown.html) (continued)

1. Finish previous lab on `dplyr`
2. Working with projects
3. Using `dpylr` and `ggplot2` to make insightful visuals
4. How to fix a coding error

Housing data [download](https://github.com/edrubin/EC524W22/raw/master/lab/001-cleaning/data/house-prices-advanced-regression-techniques.zip)

**Formats** [.html](https://raw.githack.com/edrubin/EC524W22/master/lab/001-cleaning/001-markdown.html) | [.Rmd](https://raw.githack.com/edrubin/EC524W22/master/lab/001-cleaning/001-markdown.Rmd)

[**002 - Validation**](https://raw.githack.com/edrubin/EC524W22/master/lab/002-validation/R/002-validation.html)

1. Creating a training and validation data set from your observations dataframe in R
2. Writing a function to iterate over multiple models to test and compare MSEs

**Formats** [.html](https://raw.githack.com/edrubin/EC524W22/master/lab/002-validation/R/002-validation.html) | [.Rmd](https://raw.githack.com/edrubin/EC524W22/master/lab/002-validation/R/002-validation.Rmd)

[**003 - Practice using `tidymodels`**](https://www.kaggle.com/edwardarubin/intro-tidymodels-preprocessing)

1. Cleaning data quickly and efficiently with `tidymodels`

**Formats** [.html](https://www.kaggle.com/edwardarubin/intro-tidymodels-preprocessing)

[**004 - Practice using `tidymodels`**](https://www.kaggle.com/edwardarubin/intro-tidymodels-preprocessing) (continued)

1. [An introduction to preprocessing with `tidymodels`](https://www.kaggle.com/edwardarubin/intro-tidymodels-preprocessing) (refresher from last week) 
2. [An introduction to modeling with `tidymodels`](https://www.kaggle.com/edwardarubin/intro-tidymodels-modeling)
3. [An introduction to resampling, model tuning, and workflows with `tidymodels`](https://www.kaggle.com/edwardarubin/intro-tidymodels-resampling) (will finish up next week)

**005 - Summarizing `tidymodels`**

1. Summarizing `tidymodels`
2. [Combining pre-split data together and then defining a custom split](https://www.kaggle.com/edwardarubin/intro-tidymodels-split-kaggle)


[**006 - Penalized regression in `tidymodels` + functions + loops**](https://raw.githack.com/edrubin/EC524W22/master/lab/006-function_loops/006_functions_loops.html)

1. Running a Ridge, Lasso or Elasticnet logistic regression in `tidymodels`.
2. [A short lesson in writing functions and loops in R)](https://raw.githack.com/edrubin/EC524W22/master/lab/006-function_loops/006_functions_loops.html)

[**007 - Finalizing a workflow in `tidymodels`: Example using a random forest**](https://raw.githack.com/edrubin/EC524W22/master/lab/007-finalize/finalize_wf.html)

1. [Finalizing a workflow in `tidymodels`: Example using a random forest](https://raw.githack.com/edrubin/EC524W22/master/lab/007-finalize/finalize_wf.html)
2. [A short lesson in writing functions and loops in R (continued)](https://raw.githack.com/edrubin/EC524W22/master/lab/006-function_loops/006_functions_loops.html)


## Additional resources

### R

- [RStudio's recommendations for learning R](https://education.rstudio.com/learn/), plus cheatsheets, books, and tutorials
- [YaRrr! The Pirate’s Guide to R](https://bookdown.org/ndphillips/YaRrr/) (free online)
- [UO library resources/workshops](http://uoregon.libcal.com/calendar/dataservices/?cid=11979&t=g&d=0000-00-00&cal=11979,11173)
- [Eugene R Users](https://www.meetup.com/meetup-group-cwPiAlnB/)

### Data Science

- [Python Data Science Handbook](https://jakevdp.github.io/PythonDataScienceHandbook/) by Jake VanderPlas
- [Elements of AI](https://course.elementsofai.com/)
- [Caltech professor Yaser Abu-Mostafa: Lectures about machine learning on YouTube](https://www.youtube.com/user/caltech/search?query=Yaser+Abu-Mostafa)
- From Google:
  - [Machine-learning crash course](https://developers.google.com/machine-learning/crash-course/ml-intro)
  - [Google Cloud training for data and machine learning](https://cloud.google.com/training/data-ml)
  - [General Google education platform](https://ai.google/education/)

### Spatial data

- [Geocomputation with R](https://geocompr.robinlovelace.net) (free online)
- [Spatial Data Science](https://keen-swartz-3146c4.netlify.com) (free online)
- [Applied Spatial Data Analysis with R](https://asdar-book.org)
