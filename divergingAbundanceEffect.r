rm(list=ls())

# library("remotes")
# remotes::install_github("dkneis/molbio")

library("molbio")

nrepl <- 500        # realizations per case for statistics
droplets <- 20000   # assumed number of partitions

# total number of copies per target assumed
z <- 10^(1:9)
z <- sort(c(z, 2*z, 5*z))
z <- z[z <= droplets]     # don't go beyond the number of partitions

# construct study cases
cases <- expand.grid(A = z, B = z, AB = c(1, 10, 100, 1000))
cases <- cases[cases[,"AB"] <= apply(cases[,c("A","B")], 1, min), ]

#print(head(cases))
#print(tail(cases))
#stop()

# create realizations for all study cases and re-estimate the inputs
x <- NULL
for (icas in 1:nrow(cases)) {
  print(paste("case",icas,"of",nrow(cases),"..."))
  obs <- molbio::ddPCR_simulate_duplex(copies=unlist(cases[icas,c("A","B","AB")]),
    drops=droplets, replicates=nrepl)
  est <- ddPCR_linked_duplex(obs)
  x <- rbind(x, cbind(
    droplets=droplets,
    case=icas,
    repl=1:nrow(obs),
    act.A=cases[icas, "A"], act.B=cases[icas, "B"], act.AB=cases[icas, "AB"],
    obs.Aonly=obs[,"A"], obs.Bonly=obs[,"B"], obs.AandB=obs[,"AandB"],
    est.A=pmax(0,est[,"A"]), est.B=pmax(0,est[,"B"]), est.AB=pmax(0,est[,"ab"])
  ))
}

# for each of the study cases, we compute the 95% quantile of the
# relative error to summarize how reliable quantitaive estimates are
x <- as.data.frame(x)
x <- cbind(x, ARE=with(x, abs(est.AB - act.AB) / act.AB))
x <- aggregate(list(ARE95=x[,"ARE"]), x[,c("droplets","act.A","act.B","act.AB")], quantile, probs=0.95)
