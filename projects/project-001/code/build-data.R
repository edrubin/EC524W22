

# Notes ----------------------------------------------------------------------------------
#  Goal: Clean and prep data for predicting 2016 presidential election


# Setup ----------------------------------------------------------------------------------
  # Load packages
  library(pacman)
  p_load(fastverse, magrittr, here)
  fastverse_extend(topics = c('ST', 'DT'))
  # Fix funny collapse issue
  F = FALSE


# Load and clean data: Election results --------------------------------------------------
  # Load the results
  results_dt = here('data-raw', 'results-pres-2000-2020.csv') %>% fread()
  # Pad fips
  results_dt[, `:=`(
    county_fips = str_pad(county_fips, 5, 'left', 0)
  )]
  # Subset to 2012 and 2016 data
  results_dt %<>% .[year %in% c(2012, 2016)]
  # Grab and summarized desired variables
  results2012 = results_dt[year == 2012, .(
    n_votes_republican_2012 = fsum((party == 'REPUBLICAN') * candidatevotes), 
    n_votes_democrat_2012 = fsum((party == 'DEMOCRAT') * candidatevotes),
    n_votes_other_2012 = fsum((party == 'OTHER') * candidatevotes),
    n_votes_total_2012 = ffirst(totalvotes)
  ), by = .(
    state = str_to_lower(state),
    county = str_to_lower(county_name),
    fips = county_fips
  )] %>% na.omit()
  results2016 = results_dt[year == 2016, .(
    n_votes_republican_2016 = fsum((party == 'REPUBLICAN') * candidatevotes), 
    n_votes_democrat_2016 = fsum((party == 'DEMOCRAT') * candidatevotes)
  ), by = .(
    state = str_to_lower(state),
    county = str_to_lower(county_name),
    fips = county_fips
  )] %>% na.omit()
  # Find the winners
  results2012[, i_republican_2012 := 1 * (n_votes_republican_2012 > n_votes_democrat_2012)]
  results2016[, i_republican_2016 := 1 * (n_votes_republican_2016 > n_votes_democrat_2016)]
  # Join datasets
  full_dt = merge(
    x = results2016[, .(fips, county, state, i_republican_2016)],
    y = results2012,
    by = c('fips', 'county', 'state'),
    all = FALSE
  )


# Load and clean data: Demographics ------------------------------------------------------
  # Load the county data
  co_dt = here('data-raw', 'county-facts.csv') %>% fread()
  # Load the data dictionary
  co_desc = here('data-raw', 'county-facts-readme.csv') %>% fread()
  # Pad fips
  co_dt[, fips := str_pad(fips, 5, 'left', 0)]
  # Grab and rename variables
  co_dt %<>% .[, .(
    fips,
    pop = PST045214,
    pop_pct_change = PST120214,
    pop_pct_below18 = AGE295214,
    pop_pct_above65 = AGE775214,
    pop_pct_female = SEX255214,
    pop_pct_asian = RHI425214,
    pop_pct_black = RHI225214,
    pop_pct_native = RHI325214,
    pop_pct_pacific = RHI525214,
    pop_pct_white = RHI125214,
    pop_pct_multiracial = RHI625214,
    pop_pct_hispanic = RHI725214,
    pop_pct_foreign = POP645213,
    pop_pct_nonenglish = POP815213,
    pop_pct_bachelors = EDU685213,
    pop_pct_veteran = VET605213,
    pop_pct_homeowner = HSG445213,
    pop_pct_poverty = PVY020213,
    home_median_value = HSG495213,
    persons_per_hh = HSD310213,
    income_pc = INC910213,
    income_median_hh = INC110213,
    n_firms = SBO001207,
    land_area_mi2 = LND110210
  )]


# Merge datasets -------------------------------------------------------------------------
  # Merge results and county description datasets
  full_dt %<>% merge(
    y = co_dt,
    by = 'fips',
    all = FALSE
  )


# Save data ------------------------------------------------------------------------------
  # Save the data
  fwrite(
    x = full_dt,
    file = here('election-2016.csv')
  )