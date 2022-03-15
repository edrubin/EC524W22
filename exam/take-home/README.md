# 524/424 Final Exam: Take-Home Portion

## Instructions

**What to submit:** Answer each of the questions in a notebook and then submit the notebook (PDF or HTML) on Canvas. We want to see your code (with comments). 

This process should match what you've already done for your project and other assignments.

**When to submit:** Submit your notebook before 5:00 PM Pacific on Friday, 18 March 2022.

**Allowable materials:** You can use online resources (e.g., [Google](https://www.google.com)!!), [class resources](https://github.com/edrubin/EC524W22) (e.g., lecture notes, lab notes, or previous assignments), and textbooks.

**Work alone:** You cannot discuss any part of this exam with anyone except Andrew or Ed. You can only ask Andrew or Ed clarifying questions. We will not debug your code; do not ask us to.

## Data

We're going back to where it all started (for our class): [Kaggle's house-price data](https://www.kaggle.com/c/house-prices-advanced-regression-techniques/) (remember [project "000"](https://github.com/edrubin/EC524W22/tree/master/projects/project-000)?). 

However, there's a twist: I already trained a **linear** model (using lasso) and then generated predictions from that lasso model. Using the real house prices and my lasso-based predictions, I then created a new binary variable called `undervalued`. This `undervalued` variable is defined as whether my prediction *undervalued* the house (meaning it predicted a price that was lower than the actual price). 

The dataset contains this new `undervalued` variable and all of the original .

## Your goal 

Your goal for this exam is for you to predict this new `undervalued` variable using what you've learned in this class. The specifics are below, but you should imagine that you know whether a competing real estate firm tended to undervalue properties. You now want to figure out which properties you can "steal" from your competitor due to their poor predictions.

## Important data notes

- The variable `undervalued` is currently `logical` (`TRUE` or `FALSE`), but you may need to transform it to a factor (or to numeric) depending on which methods you use for classification.

- Remember that the dataset has some missing values and that you'll need to do something with them.

- *Related:* For some variables, a value of `NA` should not be imputed. For example, pool quality is `NA` for houses without pools. You might want to just replace those `NA`s with `'No pool'` rather than imputing.

- Variable descriptions are available in `data-description.txt`.

## Questions

**01** (5 points) Briefly explain why would being able to predict whether my model underpredicted a house's price mean that your model "beats" my model?

**02** (30 points) Use two different models to predict `undervalued`. 

- One of the models should be an ensemble of trees.

- The other model should be a non-tree method (and cannot be OLS regression or linear-regression elasticnet). 

Use cross validation to tune each of the models' hyperparameters—with `accuracy` as the metric.

You should write recipes that clean and prep your data for each model too.

**03** (5 points) How did you do? Compare your models' levels of accuracy to the null classier.

**04** (5 points) Are all errors equal in this setting? Briefly explain your answer.

**05** (5 points) Why would it be a bad idea to use a linear model here (for example plain OLS or lasso)?

*Hint:* Think about how `undervalued` was created.