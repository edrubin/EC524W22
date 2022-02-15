

# Setup ----------------------------------------------------------------------------------
# Load packages
library(pacman)
p_load(tidyverse, fastverse, tidymodels, here, magrittr)
# Load data
vote_df = here('election-2016.csv') %>% fread()
# Change outcome
vote_df[, winner_2016 := ifelse(i_republican_2016 == 1, 'R', 'D')] 


# Lasso ----------------------------------------------------------------------------------
# Set model
lasso_model = linear_reg(
	model = 'regression',
	penalty = tune(),
	mixture = 1
) %>% set_engine('glmnet')
# Set up recipe
lasso_rec = recipe(i_republican_2016 ~ ., data = vote_df) %>%
	# step_rm(i_republican_2016) %>% 
	step_rm(winner_2016) %>% 
	update_role(fips, new_role = 'id variable') %>% 
	update_role(county, new_role = 'id variable') %>% 
	update_role(state, new_role = 'id variable') %>% 
	step_normalize(all_numeric_predictors()) %>% 
	step_interact(~ all_predictors() : all_predictors()) %>% 
	step_lincomb(all_predictors())
# Set up CV
set.seed(12345)
folds = vfold_cv(vote_df, v = 5)
# Workflow
lasso_wf = workflow() %>% 
	add_recipe(lasso_rec) %>% 
	add_model(lasso_model)
# CV
lasso_cv = lasso_wf %>% 
	tune_grid(
		resamples = folds,
		grid = tibble(penalty = c(0, 10^seq(-3, 2, length = 20)) %>% rev())
	)
# Find best models
lasso_cv %>% collect_metrics(.metric = 'rmse') %>% arrange(mean)


# Logistic regression --------------------------------------------------------------------
# Set model
logistic_model = logistic_reg(
	mode = 'classification'
) %>% set_engine('glm')
# Set up recipe
logistic_rec = recipe(winner_2016 ~ ., data = vote_df) %>%
	step_rm(i_republican_2016) %>% 
	update_role(fips, new_role = 'id variable') %>% 
	update_role(county, new_role = 'id variable') %>% 
	update_role(state, new_role = 'id variable') %>% 
	step_normalize(all_numeric_predictors()) %>% 
	step_interact(~ all_predictors() : all_predictors()) %>% 
	step_lincomb(all_predictors())
# Set up CV
set.seed(12345)
folds = vfold_cv(vote_df, v = 5)
# Workflow
logistic_wf = workflow() %>% 
	add_recipe(logistic_rec) %>% 
	add_model(logistic_model)
# CV
logistic_cv = logistic_wf %>%
	fit_resamples(
		resamples = folds,
		metrics = metric_set(accuracy, roc_auc, sens, spec, precision)
	)
# Find estimated model performance
logistic_cv %>% collect_metrics()


# Logistic lasso -------------------------------------------------------------------------
# Set model
ll_model = logistic_reg(
	mode = 'classification',
	# mixture = tune(),
	penalty = tune()
) %>% set_engine('glmnet')
# Set up recipe
ll_rec = recipe(winner_2016 ~ ., data = vote_df) %>%
	step_rm(i_republican_2016) %>% 
	update_role(fips, new_role = 'id variable') %>% 
	update_role(county, new_role = 'id variable') %>% 
	update_role(state, new_role = 'id variable') %>% 
	step_normalize(all_numeric_predictors()) %>% 
	step_interact(~ all_predictors() : all_predictors()) %>% 
	step_lincomb(all_predictors())
# Set up CV
set.seed(12345)
folds = vfold_cv(vote_df, v = 5)
# Workflow
ll_wf = workflow() %>% 
	add_recipe(ll_rec) %>% 
	add_model(ll_model)
# CV
ll_cv = ll_wf %>% tune_grid(
	resamples = folds,
	metrics = metric_set(accuracy, roc_auc, sens, spec, precision),
	grid = grid_latin_hypercube(penalty(), size = 5),
	# grid = grid_latin_hypercube(penalty() , mixture(), size = 20),
	control = control_grid(parallel_over = 'resamples')
)
# Find best models
ll_cv %>% collect_metrics() %>% arrange(mean)