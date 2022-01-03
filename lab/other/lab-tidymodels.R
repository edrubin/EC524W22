# Load packages
library(pacman)
p_load(
  tidyverse, modeldata, skimr, janitor,
  kknn, tidymodels, recipes, parsnip, 
  magrittr
)
# Load dataset
data(credit_data)
credit_df = credit_data
# Glimpse
credit_df %>% glimpse()
# 'Fix' names
credit_df %<>% clean_names()
# 'Skim' dataset
credit_df %>% skim()

# Create a dummy variable for 'good' credit status
credit_df %<>% mutate(status_good = 1 * (status == "good"))
# Drop the old status variable
credit_df %<>% select(-status)
# Skim result
credit_df %>% skim()

# But there's a better way... `tidymodels` and `recipes` and `parsnip`

# Step 1: Write your recipe (you can think of it as your formula from `lm`)
# It's easy to include **all** of the variables with `.`
recipe_all = recipe(status_good ~ ., credit_df)
# Check out the output
recipe_all
# Now that R "knows" the difference between our output and inputs—the roles—let's clean.
# NOTE: You can define an "ID" role: recipe(...) %>% update_role(ex_id, new_role = "ID)
# We have some flexibility...
recipe_all %>% step_meanimpute(all_predictors(), -all_nominal()) %>% prep() %>% juice()
recipe_all %>% step_meanimpute(all_numeric()) %>% prep() %>% juice()
# We can apply all of our processing/engineering steps at once!
credit_clean = recipe_all %>%
  step_knnimpute(all_numeric(), neighbors = 5) %>%
  step_modeimpute(all_nominal()) %>%
  step_dummy(home) %>%
  step_interact(~income:starts_with("home")) %>%
  prep() %>% juice()
# There are many options for feature engineering (imputation, transformation, etc.) and selection
# Examples: 
# - step_date
# - step_holiday
# - step_log  
# - step_rm
# - step_zv

# Up next: `parsnip`
# Parts of the model: 
# (1) The type of model (e.g., linear regression or kNN).
# (2) The 'engine' for fitting the model (think function or package).
# (3) The 'model' (e.g., classification vs. regression)—not always relevant.
# (4) The 'fit' statement (formula).
# Linear regression
model_reg = linear_reg() %>% 
  set_engine("lm") %>% 
  fit(status_good ~ ., data = credit_clean) 
model_reg %>% tidy()
model_reg %>% pluck("fit") %>% summary()
# WHY??? 
# Because you have a unified framework for modeling now!
# https://parsnip.tidymodels.org/reference/nearest_neighbor.html
model_knn = nearest_neighbor(neighbors = 5) %>% 
  set_engine("kknn") %>% 
  set_mode("regression") %>%
  fit(status_good ~ ., data = credit_clean)
model_knn
model_knn %>% pluck("fit") %>% summary()

# How did we do?
# Add fitted models' predictions to our dataset
# Question: What's wrong here?
# Answer: IN SAMPLE!
credit_clean %<>% mutate(
  est_reg = model_reg %>% predict(new_data = credit_clean),
  est_knn = model_knn %>% predict(new_data = credit_clean)
)
# Question: What's wrong here, part 2? 
# Answer: Binary outcome
# Let's force predictions to 0/1
credit_clean %<>% mutate(
  pred_reg = 1 * (est_reg > 0.5),
  pred_knn = 1 * (est_knn > 0.5)
)
# Prediction accuracy
credit_clean %>% summarize(
  mean(pred_reg == status_good),
  mean(pred_knn == status_good)
)
credit_clean %>% select(pred_reg, status_good) %>% table()
credit_clean %>% select(pred_knn, status_good) %>% table()

# Finally, you can bring it all together with a 'workflow'
# Define your model
the_reg_model = linear_reg() %>% set_engine("lm")
# Define your recipe
the_recipe = recipe(status_good ~ ., data = credit_df) %>% 
  step_knnimpute(all_numeric(), neighbors = 5) %>%
  step_modeimpute(all_nominal()) %>%
  step_dummy(home) %>%
  step_interact(~income:starts_with("home"))
# Put it all together!
workflow() %>%
  add_model(the_reg_model) %>%
  add_recipe(the_recipe) %>% 
  fit(data = credit_df) %>% 
  tidy()
# Again, we haven't done anything to guard against overfitting (test sample/CV).
# That's next.
