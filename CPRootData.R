##DataImport

##PandRootDat##
#Pdatasets_MaryamF
PFracts <- read.csv("Maryam-P-data.csv")
PFractsHW <- PFracts[PFracts$Land_Use == "Hardwood",]
PFractsPine <- PFracts[PFracts$Land_Use == "Pine",]

#RootDatasets_Billings
Roots <- read.csv("Roots.csv")
RootsHW <- Roots[Roots$landuse == "hardwood",]
RootsPine <- Roots[Roots$landuse == "pine",]

#CDatasets_Billings
CFracts <-read.csv("CData.csv")
CFractsHW <- CFracts[CFracts$Landuse == "Hardwood",]
CFractsPine <- CFracts[CFracts$Landuse == "Pine",]

#Mineralogy_PaulS
SoilMin <- read.csv("CaMgKP.csv")
SoilMinHW <- SoilMin[SoilMin$Landuse == "Hardwood",]
SoilMinPine <- SoilMin[SoilMin$Landuse == "Pine",]


#Produce Hardwood Complete Dataset

PInterHW <- interpolate(PFractsHW, 18, 1:193)
CInterHW <- interpolate(CFractsHW, 3, 1:193)
RootsAvgHW <- interpolate(RootsHW,4, 1:193)
MinInterHW <- interpolate(SoilMinHW, 3, 1:193)


PInterHW$Roots <- RootsAvgHW$fractroots
PInterHW$EOC <- CInterHW$EOC.g_gSoil.
PInterHW$SOC <- CInterHW$SOC.g_gSoil.
PInterHW$Ca <- MinInterHW$Ca
PInterHW$Mg <- MinInterHW$Mg
PInterHW$K <- MinInterHW$K
PInterHW$Ptot <- MinInterHW$P
HWSoilDat <- na.omit(PInterHW)


# Produce Pine Complete Dataset

PInterPine <- interpolate(PFractsPine, 18, 1:193)
CInterPine <- interpolate(CFractsPine, 3, 1:193)
RootsAvgPine <- interpolate(RootsPine,4, 1:193)
MinInterPine <- interpolate(SoilMinPine, 3, 1:193)

PInterPine$Roots <- RootsAvgPine$fractroots
PInterPine$EOC <- CInterPine$EOC.g_gSoil.
PInterPine$SOC <- CInterPine$SOC.g_gSoil.
PInterPine$Ca <- MinInterPine$Ca
PInterPine$Mg <- MinInterPine$Mg
PInterPine$K <- MinInterPine$K
PInterPine$Ptot <- MinInterPine$P
PineSoilDat <- na.omit(PInterPine)
