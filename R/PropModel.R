getreachesformodel<- function(data) {
  meanreaches<-rowMeans(data[,2:ncol(data)], na.rm=TRUE)
  schedule<- data$distortion
  return(data.frame(meanreaches,schedule))
}

PropModel <- function(par, schedule) {
  locest<-c()
  #loop through the perturbations in the schedule:
  for (t in c(1:length(schedule))) {
    # first we calculate what the model does, since the model is proportional, we just multiply the one parameters by the schedule to get what the person should do
    
    locest[t] <- par * schedule[t]
  }
  
  # after we loop through all trials, we return the model output:
  return(locest)
  
}

PropModelMSE <- function(par, schedule, localizations) {
  
  locesti<- PropModel(par, schedule)
  errors <- locesti - localizations
  MSE <- mean(errors^2, na.rm=TRUE)
  
  
  
  return( MSE )
  
}



PropModelFit <- function(reachdata, locadata,  gridpoints=6, gridfits=6) {
  
  localizations<-rowMeans(locadata[,2:ncol(locadata)], na.rm=TRUE)
  meanreaches<-rowMeans(reachdata[241:288,2:ncol(reachdata)], na.rm=TRUE)
  reachdata$distortion[241:288]<- as.numeric(meanreaches)*-1
  schedule<- reachdata$distortion
  
  
  parvals <- seq(1/gridpoints/2,1-(1/gridpoints/2),1/gridpoints)
  parvals<- matrix(parvals, nrow = 2, ncol = length(parvals))
  
  #searchgrid <- expand.grid('L'=parvals, 'R'=parvals)
  
  # evaluate starting positions:
  MSE <- apply(parvals, FUN=PropModelMSE, MARGIN=c(1), schedule=schedule, localizations=localizations)
  
  optimxInstalled <- require("optimx")
  
  if (optimxInstalled) {
    
    # run optimx on the best starting positions:
    allfits <- do.call("rbind",
                       apply( parvals[order(MSE)[1:gridfits],],
                              MARGIN=c(1),
                              FUN=optimx::optimx,
                              fn=PropModelMSE,
                              method='L-BFGS-B',
                              lower=c(0),
                              upper=c(1),
                              schedule=schedule,
                              localizations=localizations ) )
    
    # pick the best fit:
    win <- allfits[order(allfits$value)[1],]
    
    # return the best parameters:
    return(unlist(win[1:2]))
    
  } else {
    
    cat('(consider installing optimx, falling back on optim now)\n')
    
    # use optim with Nelder-Mead after all:
    allfits <- do.call("rbind",
                       apply( parvals[order(MSE)[1:gridfits],],
                              MARGIN=c(1),
                              FUN=optim,
                              fn=PropModelMSE,
                              method='Nelder-Mead',
                              schedule=schedule,
                              localizations=localizations ) )
    
    # pick the best fit:
    win <- allfits[order(unlist(data.frame(allfits)[,'value']))[1],]
    
    # return the best parameters:
    return(win$par)
    
  }
  
}



gridsearch<- function(localizations, schedule, nsteps=7, topn=4) {
  
  
  cat('doing grid search...\n')
  
  steps <- nsteps #say how many points inbetween 0-1 we want
  pargrid <- seq(0.5*(1/steps),1-(0.5*(1/steps)),by=1/steps) #not sure what exactly this does
  MSE<- rep(NA, length(pargrid))
  pargrid<- cbind(pargrid, MSE)
  
  for (gridpoint in c(1:nrow(pargrid))) { #for each row 
    par<-unlist(pargrid[gridpoint,1])    #take that row and take it out of df and make it par 
    pargrid[gridpoint,2] <- PropModelMSE(par, schedule,localizations)
  }
  
  bestN <- order(pargrid[,2])[1:topn]
  
  return(pargrid[bestN,])
}



fitPropModel<- function(reachdata, locadata, color, title) {
  
  localizations<-rowMeans(locadata[,2:ncol(locadata)], na.rm=TRUE)
  meanreaches<-rowMeans(reachdata[241:288,2:ncol(reachdata)], na.rm=TRUE)
  meanreaches<- meanreaches*-1
  reachdata$distortion[241:288]<- as.numeric(meanreaches)
  schedule<- reachdata$distortion
  
  
  #this function will take the dataframe made in the last function (dogridsearch) and use the list of parameters to make a new model then compare to output and get a new mse. 
  pargrid <- gridsearch(localizations, schedule, nsteps = 7, topn = 4)
  cat('optimize best fits...\n')
  for (gridpoint in c(1:nrow(pargrid))) { #for each row 
    par<-unlist(pargrid[gridpoint,1]) 

    control <- list('maxit'=10000, 'ndeps'=1e-9 )
    fit <- optim(par=par, PropModelMSE, gr=NULL, schedule, localizations, control=control, method = "Brent", lower = 0, upper = 1)
    optpar<- fit$par

    
    # stick optpar back in pargrid
    pargrid[gridpoint,1] <- optpar
    
    pargrid[gridpoint,2]<- fit$value
    
  } 
  # get lowest MSE, and pars that go with that
  bestpar <- order(pargrid[,2])[1]
  plot(localizations, type = 'l',  ylim = c(-15,15), axes = FALSE, main = title, ylab = 'Change in Hand Localizations [°]', xlab = "Trial", col = color)
  axis(
    1,
    at = c(1, 64, 224, 240, 288),
    cex.axis = 0.75,
    las = 2
  )
  axis(2, at = c(-15, -10,-5,0, 5,10,15), cex.axis = 0.75)
  output<- PropModel(unlist(pargrid[bestpar]), schedule)
  lines(output, col = "black")
  proportion<- sprintf('RMSE = %f', unlist(pargrid[bestpar]))
  print(proportion)
  legend(5, -7, legend = c('Localization Data', 'Model Prediction'), col = c(color, "black"), lty = 1, lwd = 2, bty = 'n')
  text(144, 0, labels = proportion)
  # return(those pars)
  return(unlist(pargrid[bestpar]))

}



