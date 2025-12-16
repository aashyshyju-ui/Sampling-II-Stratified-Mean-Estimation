# --------------------------------------------
# SAMPLE SIZE UNDER STRATIFIED SAMPLING
# Proportional, Neyman and Optimised Allocation
# --------------------------------------------

# 1. INPUT DATA (change values if needed)

# Number of strata
L <- 3

# Population sizes in each stratum
N_h <- c(200, 300, 500)

# Total population size
N <- sum(N_h)

# Stratum weights
W_h <- N_h / N

# Population standard deviation in each stratum
S_h <- c(10, 15, 20)

# Cost per unit in each stratum
c_h <- c(5, 8, 12)

# Time per unit in each stratum
t_h <- c(2, 3, 4)

# Allowable error (sampling bias)
B <- 2


# --------------------------------------------
# 2. PROPORTIONAL ALLOCATION
# --------------------------------------------

# Required sample size
n_prop <- sum(W_h * S_h^2) / (B^2)

# Stratum-wise sample sizes
n_h_prop <- n_prop * W_h


# --------------------------------------------
# 3. NEYMAN ALLOCATION
# --------------------------------------------

# Required sample size
n_neyman <- (sum(W_h * S_h))^2 / (B^2)

# Stratum-wise sample sizes
n_h_neyman <- n_neyman * (W_h * S_h) / sum(W_h * S_h)


# --------------------------------------------
# 4. OPTIMISED ALLOCATION (Cost + Time)
# --------------------------------------------

# Required sample size
n_opt <- (sum(W_h * S_h * sqrt(c_h * t_h)))^2 / (B^2)

# Stratum-wise sample sizes
n_h_opt <- n_opt * (W_h * S_h / sqrt(c_h * t_h)) /
  sum(W_h * S_h / sqrt(c_h * t_h))


# --------------------------------------------
# 5. RESULTS
# --------------------------------------------

results <- data.frame(
  Stratum = paste("Stratum", 1:L),
  N_h = N_h,
  W_h = round(W_h, 3),
  S_h = S_h,
  Cost = c_h,
  Time = t_h,
  n_prop = round(n_h_prop),
  n_neyman = round(n_h_neyman),
  n_optimised = round(n_h_opt)
)

cat("\nTOTAL SAMPLE SIZES:\n")
cat("Proportional Allocation n =", round(n_prop), "\n")
cat("Neyman Allocation n =", round(n_neyman), "\n")
cat("Optimised Allocation n =", round(n_opt), "\n\n")

print(results)

