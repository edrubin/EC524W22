# Nonlinear predictors (trees)

Let's return to the 2016 election one more time. (It's nice to be able to compare performance across projects.)

You will again attempt to predict which party 'won' (received the most votes) for each county in the US during the presidential election of 2016.

All the data you will need are stored in [`election-2016.csv`](https://raw.githack.com/edrubin/EC524W22/master/projects/project-003/election-2016.csv).

*Sources:* As you already know, this dataset combines data from 

- [a Kaggle project for the 2016 election](https://www.kaggle.com/benhamner/2016-us-election?select=county_facts.csv)
- [MIT's election data and science lab](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/VOQCHQ).

The outcome you are predicting  is `i_republican_2016`. This variable is a simple, binary indicator for whether Republicans won the given county in 2016. 

**Important:** For true classification **methods** (e.g., logistic regression or whenever you specify `mode = 'classification'`) or **metrics** (e.g., precision), you will need an outcome variable that is `character` or `factor` (not simply a binary numerical variable). So you'll need to add another column to the dataset or transform the current column.

**Note:** As usual, you can work on this project however you like (RStudio, Kaggle, etc.). Just make sure you can submit (on Canvas) a nice document with your answers, R code, and figures. The submission can be a file (e.g., a knitted PDF) or a link (e.g., to a Kaggle notebook or hosted )

## Part 1: One tree

**01\.** Using 5-fold cross validation to tune the cost complexity of pruning (and `min_n` if you'd like), train and tune a decision tree (`decision_tree`). Use a real classification metric for tuning (not MSE). Explain which metric you chose and why. (No matter which metric you choose, make sure you also record accuracy.)

**02\.** What are the values of the hyperparameters of your best model?

**03\.** What is the accuracy of your best (chosen) tree model? How does it compare to the accuracy of your worst tree model?

## Part 2: Bag o' trees

**04\.** Now tune bagged ensembles, each with at least 50 trees (`bag_tree()` in `tidymodels`—specifically `baguette`). Cross validate using 5-fold cross validation. Record accuracy.

**05\.** Which hyperparameters did you tune and which values were chosen?

**06\.** What is the cross-validated accuracy of your best model?

**07\.** What benefit(s) does an ensemble of bagged trees provide over a single decision tree?

## Part 3: Forests

**08\.** Tune a random forest (`rand_forest()` in `tidymodels`) model—using 5-fold cross validation. Again: Include at least 50 trees and record accuracy (and any other metrics you're interested in). Tune at least `mtry` and `min_n`.

**09\.** What are the values of the hyperparameters of your best model?

**10\.** How does the accuracy of your random forest compare to the accuracy of your bagged-tree model? What does this comparison—and the tuned value of `mtry`—tell you about the importance of decorrelating your trees in this setting?

## Part 4: Boosting

**11\.** Now boost some trees (`boost_tree()` in `tidymodels`). Using 5-fold cross validation, tune (at least) the tree depth, the learning rate, and the number of trees. Record the accuracy.

**12\.** Was the optimal set of hyperparameters fairly "fast" at learning? Explain.

## Part 5: Reflection

**13\.** Compare the accuracy across the 4 sections—and across your previous attempts at predicting election outcomes. Which models did the best? Does relaxing linearity appear to help?

## Part 6: Review

**14\.** Why are boosted-tree ensembles so sensitive to the number of trees (relative to the bagged-tree ensembles and random forests)?

**15\.** How do individual decision trees guard against overfitting?

**16\.** How do ensembles trade between bias and variance?

**17\.** How do trees allow interactions?

## Variable descriptions

For more information on the county demographic variables, see [the source documentation](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/VOQCHQ).

| Variable name | Description | Type |
|:----|:----|:---:|
| `fips`                   | FIPS code (unique for a county)                             | `int` |
| `county`                 | County name                                                 | `chr` |
| `state`                  | State name                                                  | `chr` |
| `i_republican_2016`      | Repub. presidential candidate won county in 2016            | `int` |
| `n_votes_republican_2012`| Number of votes for Repub. presid. candidate in 2012        | `int` |
| `n_votes_democrat_2012`  | Number of votes for Democ. presid. candidate in 2012        | `int` |
| `n_votes_other_2012`     | Number of votes for other parties' candidates in 2012       | `int` |
| `n_votes_total_2012`     | Number of votes in presidential election in 2012            | `int` |
| `i_republican_2012`      | Repub. presidential candidate won county in 2012            | `int` |
| `pop`                    | County population                                           | `int` |
| `pop_pct_change`         | County percent population change 2010-2014                  | `num` |
| `pop_pct_below18`        | County percent population below 18 years of age             | `num` |
| `pop_pct_above65`        | County percent population above 65 years of age             | `num` |
| `pop_pct_female`         | County percent population female                            | `num` |
| `pop_pct_asian`          | County percent population Asian                             | `num` |
| `pop_pct_black`          | County percent population Black                             | `num` |
| `pop_pct_native`         | County percent population Am. Indian/Al. Native             | `num` |
| `pop_pct_pacific`        | County percent population Native Haw./Other Pac. Islander   | `num` |
| `pop_pct_white`          | County percent population White                             | `num` |
| `pop_pct_multiracial`    | County percent population multi-racial                      | `num` |
| `pop_pct_hispanic`       | County percent population Hispanic                          | `num` |
| `pop_pct_foreign`        | County percent population born outside US                   | `num` |
| `pop_pct_nonenglish`     | County percent population that speaks non-English lang.     | `num` |
| `pop_pct_bachelors`      | County percent population with Bachelors degree             | `num` |
| `pop_pct_veteran`        | County percent population who are veterans                  | `num` |
| `pop_pct_homeowner`      | County percent population homeowners                        | `num` |
| `pop_pct_poverty`        | County percent population below the poverty line            | `num` |
| `home_median_value`      | County median value of owner-occupied housing units         | `num` |
| `persons_per_hh`         | County average persons per household                        | `num` |
| `income_pc`              | County per capita income                                    | `int` |
| `income_median_hh`       | County median household income                              | `int` |
| `n_firms`                | County number of firms                                      | `int` |
| `land_area_mi2`          | County land area (square miles)                             | `num` |
