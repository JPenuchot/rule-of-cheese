# ==============================================================================
# Set these ROC_CTBENCH_GIT_TAG and ROC_CTBENCH_GIT_REPOSITORY

if(NOT ROC_CTBENCH_GIT_TAG)
  set(ROC_CTBENCH_GIT_TAG fix_matching)
endif(NOT ROC_CTBENCH_GIT_TAG)

if(NOT ROC_CTBENCH_GIT_REPOSITORY)
  set(ROC_CTBENCH_GIT_REPOSITORY https://github.com/JPenuchot/ctbench.git)
endif(NOT ROC_CTBENCH_GIT_REPOSITORY)

# ==============================================================================
# Fetching ctbench

include(FetchContent)
FetchContent_Declare(
  ctbench
  GIT_REPOSITORY ${ROC_CTBENCH_GIT_REPOSITORY}
  GIT_TAG        ${ROC_CTBENCH_GIT_TAG})
FetchContent_MakeAvailable(ctbench)
