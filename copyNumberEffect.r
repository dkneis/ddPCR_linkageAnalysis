rm(list=ls())

# library("remotes")
# remotes::install_github("dkneis/molbio")

library("molbio")

# assumed numbers of copies per reaction
copies <- c(5,10,20,50,100,200,500,1000,2000,3000,4000, 10000, 20000,
  50000, 70000, 100000, 110000, 120000, 130000, 150000, 155000, 158000)
# assumed number of partitions
drops <- 20000
# number of replicate simulations for statistics
# NOTE: reasonable numbers are > 1000, but simulations may take
#       a considerable amount of time then
repl <- 1000

# replicate simulations for each scenario
out <- NULL
for (cp in copies) {
  f <- function(ignore, copies, droplets) {
    # 1. subsampling effect
    copies <- rpois(n=1, lambda=copies)
    # 2. partitioning effect
    positive <- length(unique(sample.int(n=droplets, size=copies, replace=T)))
    ddPCR_uniplex(n_positive=positive, n_droplets=droplets)
  }
  x <- sapply(1:repl, f, copies=cp, droplets=drops)
  are95 <- quantile(abs(x - cp) / cp * 100, probs=0.95)
  out <- rbind(out, data.frame(copies=cp, are95=are95))
}

#print(head(out))
out <- out[is.finite(out[,"are95"]),]

plot(are95 ~ copies, data=out, bty="n", type="b", pch=20, xaxt="n",
  log="xy", xlab="Average number of copies per reaction",
  ylab="95% quantile of abs. relative error (%)"
)
xt <- 0:6
axis(1, at=10^xt, labels=as.expression(sapply(xt,
  function(u) {substitute(10^e, list(e=u))})))
legend("topright", bty="n",
  legend=c(paste0("Number of partitions: ",drops),
  paste0("Replicate simulations: ",repl)))
