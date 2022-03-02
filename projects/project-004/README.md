# In-class project 000

Today you get to teach a machine how to read (numbers).

Specifically, you will try to teach a machine-learning algorithm to classify hand-written integers (`0` through `9`). Each hand-written number has been scanned into a 28-pixel by 28-pixel image. Each of these pixels has been added as a feature (explanatory variable) that takes on a value between 0 (white) and 255 (black). Thus each observation has 1 label (the outcome, an integer between `0` and `9`) and 28 times 28 = 784 features.

In other words: each hand-written number has been translated into a matrix with 28 rows and 28 columns—and the elements of the matrix tell you "white", "grey", or "black". These elements of become the features (predictors) of our dataset, and the actual number that was written is our label (outcome).

I think this is a pretty cool opportunity for a number of reasons:

- The dataset itself is pretty famous: "MNIST" ("Modified National Institute of Standards and Technology"). 
- After today, you'll have taken your first step into the amazing world of "machine vision."
- You get to try working with a multi-class outcome!
- The features here are not very human interpretable. You're going to really need to lean on the machines to learn here.
- The dimension of the predictor space is probably larger than what you're accustomed to. Dimensionality reductions could be useful—but how (see previous point)?
- We could pretty easily imagine using (and will soon apply) an unsupervised algorithm in this context.

You can learn more about the dataset on the [Kaggle competition page](https://www.kaggle.com/c/digit-recognizer/overview) or [this awesome blog post](https://colah.github.io/posts/2014-10-Visualizing-MNIST/).

I wrote [some code that puts together a pretty basic random forest](https://rpubs.com/edrubin/predicting-digits) and achieves an accuracy of 96.425% on Kaggle's out-of-sample test dataset. 

**Your job:** Beat me. (It's okay if you can't, but I really want to you try. Others have.)

You can use any method that you would like—boosted trees, SVMs, logistic regression, KNN. If you need inspiration, check [out all of the notebooks on Kaggle](https://www.kaggle.com/c/digit-recognizer/code) or [just Google](https://www.google.com).

You *can* use all of the features (I did), but many people have found success with [dimensionality-reduction techniques](https://juliasilge.com/blog/cocktail-recipes-umap/). *Warning:* Some of these dimensionality-reduction approaches might take a little while to run.