# Classification, regression, resampling, and validation

In this project, we will to try to predict which party 'won' (received the most votes) for each county in the US during the presidential election of 2016.

All the data you will need are stored in [`election-2016.csv`](https://raw.githack.com/edrubin/EC524W22/master/projects/project-001/election-2016.csv).

*Sources:* This dataset combines data from 

- [a Kaggle project for the 2016 election](https://www.kaggle.com/benhamner/2016-us-election?select=county_facts.csv)
- [MIT's election data and science lab](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/VOQCHQ).

The outcome you are predicting  is `i_republican_2016`. This variable is a simple, binary indicator for whether Republicans won the given county in 2016. 

In addition to the state name (`state`), the county name (`county`), and the county FIPS code (`fips`), you have 29 inputs (predictor variables) to use in your prediction model (plus any transformation of these variables). You should have 3,116 counties.

I've tried to name the variables with fairly intuitive names, e.g.,

- `n_votes_republican_2012` contains the number of votes that theRepublican presidential candidate received in the general election of 2012
- `pop` is the county's population (estimated for 2014)
- `pop_pct_black` is the percent of the county's population that is Black
- `persons_per_hh` is the number of persons per household in the county

The [table](https://github.com/edrubin/EC524W22/tree/master/projects/project-001#variable-descriptions) at the bottom of this file briefly describes each variable in the dataset. 

**Note:** You can work on this project however you like (RStudio, Kaggle, etc.). Just make sure you can submit (on Canvas) a nice document with your answers, R code, and figures. The submission can be a file (e.g., a knitted PDF) or a link (e.g., to a Kaggle notebook or hosted )

## Part 0: Setting up

**00\.** Load the dataset.

**01\.** Get to know your data. (For example, try out `skim()` from `skimr`.) Does anything pop out to you?

**02\.** Create a few aesthetically pleasing and informative figures (labeled, titled, etc.). Any new insights?

## Part 1: Validation set

**03\.** Randomly split off 20% of your dataset (i.e., randomly hold out 20% of the counties). This 20% of the data will be your validation set (where we try to estimate your model's out-of-sample performance). You will use the other 80% for training. (This is just a code step—nothing else for you to report.)

*Hint:* [`sample_frac()` and `sample_n()`](https://dplyr.tidyverse.org/reference/sample_n.html) in the `tidyverse` will sample a fraction or number of observations from a dataset. You may want to set the seed (for example, `set.seed(1)`) so that your results don't change every time you re-run your script.

**04\.** Create at least three (linear regression) models that cover a range of flexibility/complexity. Fit each of your models to on the training data. What is the **training accuracy** for each of these models?

*Hint:* For accuracy, you will need to translate numbers into 0 or 1. For now, you can just translate anything below 0.5 to 0 and anything above 0.5 to 1.

**05\.** Now use these trained models to predict the election outcomes in the validation set. What is the **validation-set** accuracy for each of your models?

**06\.** Which model would you choose as your preferred prediction model? Why?

## Part 2: Validation set, redone

**07\.–10\.** Repeat **Part 1** (questions **03\.** through **06\.**), but now randomly split off **10 whole states** for your validation set (rather than just 20% of the counties).

## Part 3: k-fold CV

**11\.–14\.** Repeat **Part 1** (questions **03\.** through **06\.**) again, but now use **5-fold cross validation**. (We're back to randomly sampling **counties**—ignoring states.)

*Hint:* One way to randomly assign `100` observations to one of five groups would be to add a variable whose values are `sample.int(5, size = 100, replace = TRUE)`. This sampling doesn't guarantee equally sized groups, but it's close enough for now (plus, 3,116 isn't divisible by five). You could then use `filter()` to grab (or exclude) a group based upon this number.

## Part 4: Reflection

**15\.** How does your estimate of test accuracy (out-of-sample accuracy) compare across the three attempts (validation set, validation set with states, and 5-fold cross validation)? Why do you think they differ?

**16\.** Do you think that your estimated test accuracy will apply to the 2020 or 2024 presidential elections? Why or why not?

**17\.** Suppose your boss forces you to use the validation-set approach (no k-fold cross validation!). What are the advantages/disadvantages to have a larger percentage of the training data in the validation set (rather than the training set)?

**18\.** Why might someone want a validation set even when they also are going to do k-fold cross validation?

**19\.** Is accuracy the 'right' metric to use for model performance in this setting? Explain.

**20\.** What is the most interesting concept you've learned in this class? Why do you find it interesting/important?

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