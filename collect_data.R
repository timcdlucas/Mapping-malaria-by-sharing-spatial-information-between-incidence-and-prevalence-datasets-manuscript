#################################
# Data Preperation functions    #
# For point vs polygon vs joint #
# Tim Lucas                     #
# 2018-05-30                    #
#################################


#' Function to collect together all data needed for the analysis. Split by country comes later.
#'
#' The paths required are:
#'   PR_path
#'   API_path
#'   pop_path
#'
#'
#'@param paths named character vector of data paths
#'@param cov_raster_paths A charac vector of paths to covariate tifs.
#'@return An object of class 'ppj' with some elements including separate training and testing data. 

load_data <- function(PR_path, API_path, pop_path, cov_raster_paths){

  check_inputs_load_data(PR_path, API_path, pop_path, cov_raster_paths)

  
  
  pr <- read_csv(paths$PR_path)

  
  



}




# Factor out all args checks
check_inputs_load_data <- function(PR_path, API_path, pop_path, cov_raster_paths){

  stopifnot(inherits(PR_path, 'character'))
  stopifnot(inherits(API_path, 'character'))
  stopifnot(inherits(pop_path, 'character'))

  stopifnot(all(file.exists(PR_path, API_path, pop_path)))

  stopifnot(grepl('.tif$', pop_path))

  stopifnot(inherits(cov_raster_paths, 'character'))
  stopifnot(all(grepl('.tif$', cov_raster_paths)))
  stopifnot(all(do.call(file.exists, as.list(cov_raster_paths))))

  return(NULL)

}
