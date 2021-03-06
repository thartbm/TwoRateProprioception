# Descriptive statistics about the data -----
Allmeans<- function() {
  
  ActiveReach<- means(active_reaches)
  ActiveReach$Experiment<- "ActiveR"
  ActiveProp<- means(active_localization)
  ActiveProp$Experiment<- "ActiveL"
  PassiveReach<- means(passive_reaches)
  PassiveReach$Experiment<- "PassiveR"
  PassiveProp<- means(passive_localization)
  PassiveProp$Experiment<- "PassiveL"
  PauseReach<- means(pause_reaches[33:320,])
  PauseReach$Experiment<- "PauseR"
  NocursorReach<- means(nocursor_reaches[33:320,])
  NocursorReach$Experiment<- "NocursorR"
  NocursorIReach<- means(nocursorI_reaches[33:320,])
  NocursorIReach$Experiment<- "NocursorIR"
  NocursorNCReach<- NCmeans(nocursor_nocursors)
  NocursorNCReach$Experiment<- "NocursorNC"
  NocursorNCIReach<- NCmeans(nocursorI_nocursors)
  NocursorNCIReach$Experiment<- "NocursorINC"
  Allmeans<- rbind(ActiveReach, ActiveProp, PassiveReach, PassiveProp, PauseReach, NocursorReach, NocursorNCReach, NocursorIReach, NocursorNCIReach)
  write.csv(Allmeans, 'ana/All Experiments Descriptive Stats_updated.csv', quote = FALSE, row.names = FALSE )
  
  return(Allmeans)
  
  
}

NCmeans<- function (data) {
  
  
  
  AlignedMean<- mean(unlist(data[29:32,2:ncol(data)]), na.rm= TRUE)
  AlignedMax<- max(unlist(data[29:32,2:ncol(data)]), na.rm= TRUE)
  AlignedMin<- min(unlist(data[29:32,2:ncol(data)]), na.rm= TRUE)
  InitialRotationMean<- mean(unlist(data[33:36,2:ncol(data)]), na.rm= TRUE)
  InitialRotationMax<- max(unlist(data[33:36,2:ncol(data)]), na.rm= TRUE)
  InitialRotationMin<- min(unlist(data[33:36,2:ncol(data)]), na.rm= TRUE)
  EndofIRotationMean<- mean(unlist(data[189:192,2:ncol(data)]), na.rm= TRUE)
  EndofIRotationMax<- max(unlist(data[189:192,2:ncol(data)]), na.rm= TRUE)
  EndofIRotationMin<- min(unlist(data[189:192,2:ncol(data)]), na.rm= TRUE)
  SecondRotationMean<- mean(unlist(data[205:208,2:ncol(data)]), na.rm= TRUE)
  SecondRotationMax<- max(unlist(data[205:208,2:ncol(data)]), na.rm= TRUE)
  SecondRotationMin<- min(unlist(data[205:208,2:ncol(data)]), na.rm= TRUE)
  ErrorClampMean<- mean(unlist(data[209:212,2:ncol(data)]), na.rm= TRUE)
  ErrorClampMax<- max(unlist(data[209:212,2:ncol(data)]), na.rm= TRUE)
  ErrorClampMin<- min(unlist(data[209:212,2:ncol(data)]), na.rm= TRUE)
  ErrorClampLateMean<- mean(unlist(data[253:256,2:ncol(data)]), na.rm= TRUE)
  ErrorClampLateMax<- max(unlist(data[253:256,2:ncol(data)]), na.rm= TRUE)
  ErrorClampLateMin<- min(unlist(data[253:256,2:ncol(data)]), na.rm= TRUE)

  
  return(Descriptives<- (data.frame(AlignedMean, AlignedMax, AlignedMin, InitialRotationMean, InitialRotationMax, InitialRotationMin, EndofIRotationMean, EndofIRotationMax, EndofIRotationMin, SecondRotationMean, SecondRotationMax, SecondRotationMin, ErrorClampMean, ErrorClampMax, ErrorClampMin, ErrorClampLateMean, ErrorClampLateMax, ErrorClampLateMin))*-1)
}
means<- function (data) {
  

  
  AlignedMean<- mean(unlist(data[61:64,2:ncol(data)]), na.rm= TRUE)
  AlignedMax<- max(unlist(data[61:64,2:ncol(data)]), na.rm= TRUE)
  AlignedMin<- min(unlist(data[61:64,2:ncol(data)]), na.rm= TRUE)
  InitialRotationMean<- mean(unlist(data[65:68,2:ncol(data)]), na.rm= TRUE)
  InitialRotationMax<- max(unlist(data[65:68,2:ncol(data)]), na.rm= TRUE)
  InitialRotationMin<- min(unlist(data[65:68,2:ncol(data)]), na.rm= TRUE)
  EndofIRotationMean<- mean(unlist(data[208:224,2:ncol(data)]), na.rm= TRUE)
  EndofIRotationMax<- max(unlist(data[208:224,2:ncol(data)]), na.rm= TRUE)
  EndofIRotationMin<- min(unlist(data[208:224,2:ncol(data)]), na.rm= TRUE)
  SecondRotationMean<- mean(unlist(data[237:240,2:ncol(data)]), na.rm= TRUE)
  SecondRotationMax<- max(unlist(data[237:240,2:ncol(data)]), na.rm= TRUE)
  SecondRotationMin<- min(unlist(data[237:240,2:ncol(data)]), na.rm= TRUE)
  ErrorClampMean<- mean(unlist(data[241:244,2:ncol(data)]), na.rm= TRUE)
  ErrorClampMax<- max(unlist(data[241:244,2:ncol(data)]), na.rm= TRUE)
  ErrorClampMin<- min(unlist(data[241:244,2:ncol(data)]), na.rm= TRUE)
  ErrorClampLateMean<- mean(unlist(data[256:288,2:ncol(data)]), na.rm= TRUE)
  ErrorClampLateMax<- max(unlist(data[256:288,2:ncol(data)]), na.rm= TRUE)
  ErrorClampLateMin<- min(unlist(data[256:288,2:ncol(data)]), na.rm= TRUE)

  
return(Descriptives<- (data.frame(AlignedMean, AlignedMax, AlignedMin, InitialRotationMean, InitialRotationMax, InitialRotationMin, EndofIRotationMean, EndofIRotationMax, EndofIRotationMin, SecondRotationMean, SecondRotationMax, SecondRotationMin, ErrorClampMean, ErrorClampMax, ErrorClampMin, ErrorClampLateMean, ErrorClampLateMax, ErrorClampLateMin))*-1)
  }


##How do the different parameters predict the experiments, or can they? -----
#polynomial logistic regression

pLogRegression <- function(data, variable = Test_Trial) {
  
  #df <- read.csv('data/Pilot/rebound.csv', stringsAsFactors = F)
  
  data$variable<- as.factor(data$variable)
  

    
    print(summary(glm(formula = variable ~ rs + ls + rf + lf, family = binomial(link = "logit"), 
                      data = data)))

  
}

tpanalyzedata<- function(AllDataRM){
  IndependentT(AllDataRM, 'Active', 'Passive', 'Localization')
  PairedT(AllDataRM, 'Active', 'Localization')
  PairedT(AllDataRM, 'Passive', 'Localization')
}


ANOVAanalysis<- function(AllDataANOVA){
  AllDataANOVA$ID<- as.factor(AllDataANOVA$ID)
  AllDataANOVA$Experiment<- as.factor(AllDataANOVA$Experiment)
  fullmodel <- ezANOVA(data=AllDataANOVA,
                       dv=Reaches,
                       wid=ID,
                       within=Time,
                       between = Experiment,
                       type=3,
                       return_aov=TRUE)
  return(fullmodel)
}


PrepdataforT<- function(adata, pasdata, paudata, ncdata, ncncdata, ncIdata, ncncIdata){
  #
  
  A_RM<-TCombine(adata)
  A_RM$Experiment <- rep('Active', nrow(A_RM))
  
  Pas_RM<-TCombine(pasdata)
  Pas_RM$Experiment <- rep('Passive', nrow(Pas_RM))
  
  Pau_RM<-TCombine(paudata)
  Pau_RM$Experiment <- rep('Pause', nrow(Pau_RM))
  
  nc_RM<-TCombine(ncdata)
  nc_RM$Experiment <- rep('No-Cursor', nrow(nc_RM))
  
  ncnc_RM<-NoCursorsTCombine(ncncdata)
  ncnc_RM$Experiment <- rep('No-Cursor_No-Cursors', nrow(ncnc_RM))
  
  ncI_RM<-TCombine(ncIdata)
  ncI_RM$Experiment <- rep('No-CursorI', nrow(ncI_RM))

  ncncI_RM<-NoCursorsTCombine(ncncIdata)
  ncncI_RM$Experiment <- rep('No-CursorI_No-Cursors', nrow(ncncI_RM))
  
  AllDataRM<- rbind(A_RM, Pas_RM, Pau_RM, nc_RM, ncnc_RM, ncI_RM, ncncI_RM)
  # 
  return(AllDataRM)
}

PrepdataforANOVA <- function(adata, pasdata, paudata, ncdata, ncncdata, ncIdata, ncncIdata) {
  
  # 
  
  A_RM<-ANOVAcombine(adata)
  A_RM$ID <- sprintf('ActLoc.%s',A_RM$ID)
  A_RM$Experiment <- rep('Active', nrow(A_RM))
  
  Pas_RM<-ANOVAcombine(pasdata)
  Pas_RM$ID <- sprintf('PasLoc.%s',Pas_RM$ID)
  Pas_RM$Experiment <- rep('Passive', nrow(Pas_RM))
  
  Pau_RM<-ANOVAcombine(paudata)
  Pau_RM$ID <- sprintf('Pause.%s',Pau_RM$ID)
  Pau_RM$Experiment <- rep('Pause', nrow(Pau_RM))
  
  nc_RM<-ANOVAcombine(ncdata)
  nc_RM$ID <- sprintf('NoCursor.%s',nc_RM$ID)
  nc_RM$Experiment <- rep('No-Cursor', nrow(nc_RM))
  
  ncnc_RM<-NoCursorACombine(ncncdata)
  ncnc_RM$ID <- sprintf('NoCursor_No-Cursors.%s',ncnc_RM$ID)
  ncnc_RM$Experiment <- rep('No-Cursor_No-Cursors', nrow(ncnc_RM))
  
  ncI_RM<-ANOVAcombine(ncIdata)
  ncI_RM$ID <- sprintf('NoCursor.%s',ncI_RM$ID)
  ncI_RM$Experiment <- rep('No-CursorI', nrow(ncI_RM))

  ncncI_RM<-NoCursorACombine(ncncIdata)
  ncncI_RM$ID <- sprintf('NoCursorI_No-Cursors.%s',ncncI_RM$ID)
  ncncI_RM$Experiment <- rep('No-CursorI_No-Cursors', nrow(ncncI_RM))
  
  AllDataRM<- rbind(A_RM, Pas_RM, Pau_RM, nc_RM, ncnc_RM, ncI_RM, ncncI_RM)
  #
  return(AllDataRM)
  
}

PrepdataforPropT<- function(adata, pasdata, paudata, ncdata, ncncdata){
  A_RM<-TCombine(adata)
  A_RM$Experiment <- rep('Active', nrow(A_RM))
  Pas_RM<-TCombine(pasdata)
  Pas_RM$Experiment <- rep('Passive', nrow(Pas_RM))
  AllDataRM<- rbind(A_RM, Pas_RM)
  return(AllDataRM)
}

PrepdataforPropANOVA <- function(adata, pasdata, paudata, ncdata, ncncdata) {
  
  A_RM<-ANOVAcombine(adata)
  A_RM$ID <- sprintf('ActLoc.%s',A_RM$ID)
  A_RM$Experiment <- rep('Active', nrow(A_RM))
  
  Pas_RM<-ANOVAcombine(pasdata)
  Pas_RM$ID <- sprintf('PasLoc.%s',Pas_RM$ID)
  Pas_RM$Experiment <- rep('Passive', nrow(Pas_RM))
  AllDataRM<- rbind(A_RM, Pas_RM)
  
  return(AllDataRM)
  
}
IndependentT<- function(data, exp1, exp2, task) {
  print(sprintf('this is the between subjects comparison of %s to %s %s Data', exp1, exp2, task))
  print('Aligned')
  print(t.test(data$Aligned[data$Experiment == exp1],data$Aligned[data$Experiment == exp2])) #not sig A vs. NC
  print(cohen.d(data$Aligned[data$Experiment == exp1],data$Aligned[data$Experiment == exp2], na.rm = TRUE))
  print(etaSquaredTtest(data$Aligned[data$Experiment == exp1],data$Aligned[data$Experiment == exp2], na.rm = TRUE))
  print('Beginning of 1st rotation')
  print(t.test(data$R1_Early[data$Experiment == exp1],data$R1_Early[data$Experiment == exp2])) # p-value = 0.04535 A vs. NC
  print(cohen.d(data$R1_Early[data$Experiment == exp1],data$R1_Early[data$Experiment == exp2], na.rm = TRUE))
  print(etaSquaredTtest(data$R1_Early[data$Experiment == exp1],data$R1_Early[data$Experiment == exp2], na.rm = TRUE))
  print('End of 1st rotation')
  print(t.test(data$R1_Late[data$Experiment == exp1],data$R1_Late[data$Experiment == exp2])) # not sig A vs. NC
  print(cohen.d(data$R1_Late[data$Experiment == exp1],data$R1_Late[data$Experiment == exp2], na.rm = TRUE))
  print(etaSquaredTtest(data$R1_Late[data$Experiment == exp1],data$R1_Late[data$Experiment == exp2], na.rm = TRUE))
  print('Beginning of 2nd rotation')
  print(t.test(data$R2[data$Experiment == exp1],data$R2[data$Experiment == exp2])) # not sig  A vs. NC
  print(cohen.d(data$R2[data$Experiment == exp1],data$R2[data$Experiment == exp2], na.rm = TRUE))
  print(etaSquaredTtest(data$R2[data$Experiment == exp1],data$R2[data$Experiment == exp2], na.rm = TRUE))
  print('Beginning of Error Clamp')
  print(t.test(data$EC[data$Experiment == exp1],data$EC[data$Experiment == exp2])) # p-value = 0.005945  A vs. NC
  print(cohen.d(data$EC[data$Experiment == exp1],data$EC[data$Experiment == exp2], na.rm = TRUE))
  print(etaSquaredTtest(data$EC[data$Experiment == exp1],data$EC[data$Experiment == exp2], na.rm = TRUE))
  print('End of Error Clamp (32 trials)')
  print(t.test(data$EC_Late[data$Experiment == exp1],data$EC_Late[data$Experiment == exp2]))  #p-value = 1.36e-07  A vs. NC
  print(cohen.d(data$EC_Late[data$Experiment == exp1],data$EC_Late[data$Experiment == exp2], na.rm = TRUE))
  print(etaSquaredTtest(data$EC_Late[data$Experiment == exp1],data$EC_Late[data$Experiment == exp2], na.rm = TRUE))
  
  
}
PairedT<- function(data, exp1, task) {
  print(sprintf('this is the within subjects analysis of %s %s Data', exp1, task))
  print('Is there early learning?')
  print(t.test(data$Aligned[data$Experiment == exp1],data$R1_Early[data$Experiment == exp1], paired = TRUE)) #not sig A vs. NC
  print(cohen.d(data$Aligned[data$Experiment == exp1],data$R1_Early[data$Experiment == exp1], paired = TRUE, na.rm = TRUE))
  print(etaSquaredTtest(data$Aligned[data$Experiment == exp1],data$R1_Early[data$Experiment == exp1], na.rm = TRUE))
  print('Did they return to baseline? (Should not)')
  print(t.test(data$Aligned[data$Experiment == exp1],data$R1_Late[data$Experiment == exp1], paired = TRUE))
  print(cohen.d(data$Aligned[data$Experiment == exp1],data$R1_Late[data$Experiment == exp1], paired = TRUE, na.rm = TRUE))
  print(etaSquaredTtest(data$Aligned[data$Experiment == exp1],data$R1_Late[data$Experiment == exp1], na.rm = TRUE))
  print('Was there learning from beginning to end of 1st rotation?')
  print(t.test(data$R1_Early[data$Experiment == exp1],data$R1_Late[data$Experiment == exp1], paired = TRUE)) # p-value = 0.04535 A vs. NC
  print(cohen.d(data$R1_Early[data$Experiment == exp1],data$R1_Late[data$Experiment == exp1], paired = TRUE, na.rm = TRUE))
  print(etaSquaredTtest(data$R1_Early[data$Experiment == exp1],data$R1_Late[data$Experiment == exp1], na.rm = TRUE))
  print('Was there learning from 1st to 2nd block of 1st rotation?')
  print(t.test(data$R1_Early[data$Experiment == exp1],data$R1_second[data$Experiment == exp1], paired = TRUE)) # p-value = 0.04535 A vs. NC
  print(cohen.d(data$R1_Early[data$Experiment == exp1],data$R1_second[data$Experiment == exp1], paired = TRUE, na.rm = TRUE))
  print(etaSquaredTtest(data$R1_Early[data$Experiment == exp1],data$R1_second[data$Experiment == exp1], na.rm = TRUE))
  print('How much could they learn of the 60 degree change?')
  print(t.test(data$R1_Late[data$Experiment == exp1],data$R2[data$Experiment == exp1], paired = TRUE)) # not sig A vs. NC
  print(cohen.d(data$R1_Late[data$Experiment == exp1],data$R2[data$Experiment == exp1], paired = TRUE, na.rm = TRUE)) # not sig A vs. NC
  print(etaSquaredTtest(data$R1_Late[data$Experiment == exp1],data$R2[data$Experiment == exp1], na.rm = TRUE)) # not sig A vs. NC
  print('Do their error clamp trials reflect the trajectories in 2nd rotation?')
  print(t.test(data$R2[data$Experiment == exp1],data$EC[data$Experiment == exp1], paired = TRUE)) # not sig  A vs. NC
  print(cohen.d(data$R2[data$Experiment == exp1],data$EC[data$Experiment == exp1], paired = TRUE, na.rm = TRUE)) # not sig  A vs. NC
  print(etaSquaredTtest(data$R2[data$Experiment == exp1],data$EC[data$Experiment == exp1], na.rm = TRUE)) # not sig  A vs. NC
  print('Is there a change in error clamps across time? (Decay)')
  print(t.test(data$EC[data$Experiment == exp1],data$EC_Late[data$Experiment == exp1], paired = TRUE)) # p-value = 0.005945  A vs. NC
  print(cohen.d(data$EC[data$Experiment == exp1],data$EC_Late[data$Experiment == exp1], paired = TRUE, na.rm = TRUE)) # p-value = 0.005945  A vs. NC
  print(etaSquaredTtest(data$EC[data$Experiment == exp1],data$EC_Late[data$Experiment == exp1], na.rm = TRUE)) # p-value = 0.005945  A vs. NC
  print('Did they just revert back to aligned behaviour when dealing with 2nd rotation?')
  print(t.test(data$Aligned[data$Experiment == exp1],data$R2[data$Experiment == exp1], paired = TRUE)) 
  print(cohen.d(data$Aligned[data$Experiment == exp1],data$R2[data$Experiment == exp1], paired = TRUE, na.rm = TRUE)) 
  print(etaSquaredTtest(data$Aligned[data$Experiment == exp1],data$R2[data$Experiment == exp1], na.rm = TRUE)) 
  print('Are the 1st few error clamp trials the same as their aligned behaviour?')
  print(t.test(data$Aligned[data$Experiment == exp1],data$EC[data$Experiment == exp1], paired = TRUE))  #p-value = 1.36e-07  A vs. NC
  print(cohen.d(data$Aligned[data$Experiment == exp1],data$EC[data$Experiment == exp1], paired = TRUE, na.rm = TRUE))  #p-value = 1.36e-07  A vs. NC
  print(etaSquaredTtest(data$Aligned[data$Experiment == exp1],data$EC[data$Experiment == exp1], na.rm = TRUE))  #p-value = 1.36e-07  A vs. NC
  print('Did they eventually decay back to baseline?')
  print(t.test(data$Aligned[data$Experiment == exp1],data$EC_Late[data$Experiment == exp1], paired = TRUE)) 
  print(cohen.d(data$Aligned[data$Experiment == exp1],data$EC_Late[data$Experiment == exp1], paired = TRUE, na.rm = TRUE)) 
  print(etaSquaredTtest(data$Aligned[data$Experiment == exp1],data$EC_Late[data$Experiment == exp1], na.rm = TRUE))
  print('Were the error clamp trials similar to the 1st rotation?')
  print(t.test(data$R1_Late[data$Experiment == exp1],data$EC_Late[data$Experiment == exp1], paired = TRUE)) 
  print(cohen.d(data$R1_Late[data$Experiment == exp1],data$EC_Late[data$Experiment == exp1], paired = TRUE, na.rm = TRUE)) 
  print(etaSquaredTtest(data$R1_Late[data$Experiment == exp1],data$EC_Late[data$Experiment == exp1], na.rm = TRUE))
  
}


##Models

ParticipantReachmodels2<- function(adata, pasdata, paudata, ncdata, ncidata) {
  a_par<- getParticipantFits2(adata)
  a_par$Experiment<-'Active'
  a_par$Test_Trial<-'Active'
  Pas_par<- getParticipantFits2(pasdata)
  Pas_par$Experiment<-'Passive'
  Pas_par$Test_Trial<-'Passive'
  Pau_par<- getParticipantFits2(paudata)
  Pau_par$Experiment<-'Pause'
  Pau_par$Test_Trial<-'Passive'
  nc_par<- getParticipantFits2(ncdata)
  nc_par$Experiment<-'No-Cursor'
  nc_par$Test_Trial<-'Active'
  nci_par<- getParticipantFits2(ncidata)
  nci_par$Experiment<-'No-Cursor_I'
  nci_par$Test_Trial<-'Active'
  allpars<- rbind(a_par, Pas_par, Pau_par, nc_par, nci_par)
  return(allpars)
}
ParticipantBothReachmodels<- function(adata, pasdata, paudata, ncdata, ncidata) {
  a_par<- getParticipantFits2(adata)
  a_par1<- getParticipantFits1(adata)
  a_par$Experiment<-'Active'
  a_par$Test_Trial<-'Active'
  a_par1$Experiment<-'Active'
  a_par1$Test_Trial<-'Active'
  Pas_par<- getParticipantFits2(pasdata)
  Pas_par1<- getParticipantFits1(pasdata)
  Pas_par$Experiment<-'Passive'
  Pas_par$Test_Trial<-'Passive'
  Pas_par1$Experiment<-'Passive'
  Pas_par1$Test_Trial<-'Passive'
  Pau_par<- getParticipantFits2(paudata)
  Pau_par1<- getParticipantFits1(paudata)
  Pau_par$Experiment<-'Pause'
  Pau_par$Test_Trial<-'Passive'
  Pau_par1$Experiment<-'Pause'
  Pau_par1$Test_Trial<-'Passive'
  nc_par<- getParticipantFits2(ncdata)
  nc_par1<- getParticipantFits1(ncdata)
  nc_par$Experiment<-'No-Cursor'
  nc_par$Test_Trial<-'Active'
  nc_par1$Experiment<-'No-Cursor'
  nc_par1$Test_Trial<-'Active'
  nci_par<- getParticipantFits2(ncidata)
  nci_par1<- getParticipantFits1(ncidata)
  nci_par$Experiment<-'No-Cursor_I'
  nci_par$Test_Trial<-'Active'
  nci_par1$Experiment<-'No-Cursor_I'
  nci_par1$Test_Trial<-'Active'
  allpars<- rbind(a_par, Pas_par, Pau_par, nc_par, nci_par,a_par1, Pas_par1, Pau_par1, nc_par1, nci_par1)
  return(allpars)
}
ParticipantReachmodels1<- function(adata, pasdata, paudata, ncdata, ncidata) {
  a_par<- getParticipantFits1(adata)
  a_par$Experiment<-'Active'
  a_par$Test_Trial<-'Active'
  Pas_par<- getParticipantFits1(pasdata)
  Pas_par$Experiment<-'Passive'
  Pas_par$Test_Trial<-'Passive'
  Pau_par<- getParticipantFits1(paudata)
  Pau_par$Experiment<-'Pause'
  Pau_par$Test_Trial<-'Passive'
  nc_par<- getParticipantFits1(ncdata)
  nc_par$Experiment<-'No-Cursor'
  nc_par$Test_Trial<-'Active'
  nci_par<- getParticipantFits1(ncidata)
  nci_par$Experiment<-'No-Cursor_I'
  nci_par$Test_Trial<-'Active'
  allpars<- rbind(a_par, Pas_par, Pau_par, nc_par, nci_par)
  return(allpars)
}

GroupModelAICs <- function(data, group, grid = 'restricted') {
  
  df<- getreachesformodel(data)
  #group='active'# add this to the function call when i use the commented line below
  #df <- read.csv(sprintf('data/%s_reaches.csv', group), stringsAsFactors = FALSE)
  
  schedule <- df$distortion
  
  #Reaches <- as.matrix(df[,2:dim(df)[2]])
  Reaches<- df$meanreaches
  
  twoRateFit <- fitTwoRateReachModel(reaches=Reaches, schedule=schedule, oneTwoRates=2, grid=grid, checkStability=TRUE)
  oneRateFit <- fitTwoRateReachModel(reaches=Reaches, schedule=schedule, oneTwoRates=1, grid=grid, checkStability=TRUE)
  #twoRateFit<- fittworatemodel(Reaches, schedule)
  #oneRateFit<- fitoneratemodel(Reaches, schedule)
  
  
  print(oneRateFit)
  print(twoRateFit)
  
  twoRateMSE <- twoRateReachModelErrors(par=twoRateFit, reaches=Reaches, schedule=schedule)
  oneRateMSE <- twoRateReachModelErrors(par=oneRateFit, reaches=Reaches, schedule=schedule)
  #twoRateMSE <- twoRateReachModelError(par=twoRateFit, reaches=Reaches, distortions =schedule)
  #oneRateMSE <- oneRateReachModelError(par=oneRateFit, reaches=Reaches, distortions =  schedule)
  
  #preparing the AIC stuff
  N <- dim(df)[2] - 1
  # the median length of a phase is 40 trials,
  # and there are 7.2 of those in 288 trials
  InOb <- 6
  # this is then used for C:
  C <- InOb*(log(2*pi)+1)
  twoRateAIC <- (2*4) + InOb*log(twoRateMSE) + C
  oneRateAIC <- (2*2) + InOb*log(oneRateMSE) + C
  
  cat(sprintf('1-rate AIC: %0.2f  %s  2-rate AIC: %0.2f\n',oneRateAIC,c('>=', ' <')[as.numeric(oneRateAIC<twoRateAIC)+1],twoRateAIC))
  
  #pars<- data.frame(twoRateFit)
  AICs<- data.frame(twoRateAIC, oneRateAIC)
  #write.csv(AICs, sprintf("ana/AICs/Group AICs for %s Reaches.csv", group), row.names = TRUE, quote = FALSE)
  
  return(AICs)
}

getParticipantFits2 <- function(data, grid='restricted') {
  
  participants <- colnames(data)[2:dim(data)[2]]
  distortions <- data$distortion
  
  participantfits <- data.frame(matrix(NA, ncol=6, nrow=length(participants)))
  colnames(participantfits) <- c('participant', 'rs', 'ls', 'rf', 'lf', 'MSE')
  
  for (ppno in c(1:length(participants))) {
    
    participant <- participants[ppno]
    print(participant)
    reaches <- data[,participant]
    
    #pars<- fitTwoRateReachModel(reaches = reaches, schedule = distortions)
    pars<- fitTwoRateReachModel(reaches=reaches, schedule=distortions, oneTwoRates=2, grid=grid, checkStability=TRUE)
    #pars <- fittworatemodel(reaches, distortions)
    
    participantfits$participant[ppno] <- participant
    participantfits$rs[ppno] <- pars['Rs']
    participantfits$ls[ppno] <- pars['Ls']
    participantfits$rf[ppno] <- pars['Rf']
    participantfits$lf[ppno] <- pars['Lf']
    participantfits$MSE[ppno] <- twoRateReachModelErrors(pars, reaches, distortions)
    
  }
  
  return(participantfits)
}

getParticipantFits1 <- function(data, grid='restricted') {
  
  participants <- colnames(data)[2:dim(data)[2]]
  distortions <- data$distortion
  
  participantfits <- data.frame(matrix(NA, ncol=4, nrow=length(participants)))
  colnames(participantfits) <- c('participant', 'rs', 'ls', 'MSE')
  
  for (ppno in c(1:length(participants))) {
    
    participant <- participants[ppno]
    print(participant)
    reaches <- data[,participant]
    
    #pars <- fitOneRateReachModel(reaches, distortions)
    pars <- fitTwoRateReachModel(reaches=reaches, schedule=distortions, oneTwoRates=1, grid=grid, checkStability=TRUE)
    
    participantfits$participant[ppno] <- participant
    participantfits$rs[ppno] <- pars['rs']
    participantfits$ls[ppno] <- pars['ls']
    participantfits$MSE[ppno] <- twoRateReachModelErrors(pars, reaches, distortions)
    
  }
  
  return(participantfits)
}

getgroupfits2<- function(data, grid = grid) {
  reaches<-rowMeans(data[,2:ncol(data)], na.rm=TRUE)
  distortion<- data$distortion
  pars <- fitTwoRateReachModel(reaches=reaches, schedule=distortions, oneTwoRates=2, grid=grid, checkStability=TRUE)
  pars$MSE <- twoRateReachModelErrors(pars, reaches, distortions)
  return(pars)
}
getgroupfits1<- function(data, grid = grid) {
  reaches<-rowMeans(data[,2:ncol(data)], na.rm=TRUE)
  distortion<- data$distortion
  pars <- fitTwoRateReachModel(reaches=reaches, schedule=distortions, oneTwoRates=1, grid=grid, checkStability=TRUE)
  pars$MSE <- twoRateReachModelErrors(pars, reaches, distortions)
  return(pars)
}


Poneratevstworate<- function (data, group = 'Passive',  grid = 'restricted') {
  ##Getting AICS for one-rate model vs. two-rate model
  #need to run one rate model

  par1<- getParticipantFits1(data, grid = grid)
  
  #write.csv(par1, sprintf("ana/AICs/One Rate Parameters for %s Reaches.csv", group), row.names = TRUE, quote = FALSE)
  #need to run two rate model
  
  
  par2<- getParticipantFits2(data, grid = grid)
  #write.csv(par2, sprintf("ana/AICs/Two Rate Parameters for %s Reaches.csv", group), row.names = TRUE, quote = FALSE)

  Data1MSE<- par1$MSE
  print(par1$MSE)
  Data2MSE<- par2$MSE
  print(par2$MSE)
  N<- 6
  P1 <- 2
  P2 <- 4
  C <- N*(log(2*pi)+1)
  Data1AIC <- 2*P1 + N*log(Data1MSE) + C
  Data2AIC <- 2*P2 + N*log(Data2MSE) + C
  count<-sum(Data1AIC<Data2AIC)
  print(sprintf('the number of participants with a higher AIC for two rates are %d',count))
  #AICs<- c('One Rate Model'=Data1AIC,'Two Rate Model'=Data2AIC)
  AICs<- cbind(Data1AIC, Data2AIC)
  #write.csv(AICs, sprintf("ana/AICs/AICs for one and two rate %s reach data.csv", group), row.names = TRUE, quote = FALSE)
  #relativeLikelihoods <- exp((min(AICs) - AICs)/2)
  
}


GetRMSEs<- function (){
  
  groups<- list('Pause', 'Active', 'Passive', 'NoC', 'NoCI','Average', 'Test Average')
  RMSEs<-c(PausePars[6],ActivePars[6],PassivePars[6],NoCPars[6],NoCIPars[6])
  RMSEs<- c(RMSEs, mean(RMSEs), mean(RMSEs[2:5]))
  names(RMSEs)<- groups
  
  
  
  
  
}


randomcodes<- function () {
  mmed <- function(x,n=5){runmed(x,n)}  #run this function to do the median smoothing
  Active_p<- mmed(ActiveP$meanreaches)
  Passive_p<- mmed(PassiveP$meanreaches)
  Diff<-ActiveP$meanreaches - PassiveP$meanreaches
  Diff<- Active_p - Passive_p
  PSC<- data.frame(Diff, dist)
  PSC$dist<- PSC$dist*-1
  Average<- mean(PSC$Diff[182:224], na.rm = TRUE)
  Scale<- Average/30
  AllReaches<- data.frame(cbind(PassiveR$meanreaches, PauseR$meanreaches[33:320],ActiveR$meanreaches ))
  AllReachesMean<- rowMeans(allreaches, na.rm = TRUE)
  Reaches<- data.frame(AllReachesMean, dist*-1)
  Reaches_par<- fittworatemodel(Reaches$AllReachesMean, Reaches$dist)
  Reach_model<-tworatemodel(par=Reaches_par, distortions = dist)
  Reach_model$output<-Reach_model$output*Scale
  Reach_model$slow<-Reach_model$slow*Scale
  Diff<- Diff*-1
  Diff <- filtfilt(butter(1, W=0.5, type='low'), Diff)
  layout(matrix(c(1,1,1,1,2,3,4,5), nrow=2, byrow=TRUE), heights=c(3,1))
  plot(Diff*-1,main = "Predicted Sensory Consequences",ylim = c(-10, 10), lwd = 2.5, axes= F,col=rgb(0.44,0.51,0.57), xlab = "Trial", ylab = "Difference in Hand Direction [?]", type = "l")
  axis(1, at=c(1,64,224,240,288), cex.axis=0.75)
  axis(2, at=c(-6,-3,0,3,6), cex.axis=0.75)
  lines(Reach_model$output, col = c(rgb(.5,0.,.5)))
  lines(Reach_model$slow, col = rgb(0.,.5,1.))
  legend(-3,-2,legend=c('Difference','Reach Model - Output', "Reach Model - Slow"),col=c(rgb(0.44,0.51,0.57),rgb(.5,0.,.5), rgb(0.,.5,1.)),lty=c(1,1),lwd=c(2,2),bty='n')
  OutputMSE<- mean((Diff - Reach_model$output)^2)
  SlowMSE<- mean((Diff - Reach_model$slow)^2)
  N<- 22.15
  P <- 4
  C <- N*(log(2*pi)+1)
  OutputAIC <- 2*P + N*log(OutputMSE) + C
  SlowAIC <- 2*P + N*log(SlowMSE) + C
  AICs<- c('slow'=SlowAIC, 'Output'=OutputAIC)
  relativeLikelihoods <- exp((min(AICs) - AICs)/2)
  relativeLikelihoods
  
  
}
