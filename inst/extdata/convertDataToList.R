convertDataToList <- function(x, data.type=c("proportions","counts"), transform=NULL,
                              scale.fac=NULL)
  # Author Belinda Phipson
  # Data 06/06/2022
  # Convert to list object that propeller expects in propeller.ttest and propeller.anova
{
  type <- match.arg(data.type,c("proportions","counts"))
  x <- as.matrix(x)
  # scale.fac is total num cells parameter N for each sample
  if(is.null(scale.fac)) scale.fac <- 5000
  scale.fac <- edgeR::expandAsMatrix(scale.fac,dim=dim(x), byrow=TRUE)

  if(type=="proportions"){
    if(transform=="asin"){
      message("Performing arcsin square root transformation of proportions")
      prop.trans <- t(asin(sqrt(x)))
    }
    else if(transform=="logit"){
      message("Performing logit transformation of proportions")
      tab <- t(x*scale.fac)
      props <- tab/rowSums(tab)
      props.pseudo <- (tab+0.5)/rowSums(tab+0.5)
      prop.trans <- log(props.pseudo/(1-props.pseudo))
    }
    list(Counts=x*scale.fac, TransformedProps=t(prop.trans), Proportions=x)
  }

  else if(type=="counts"){
    tab <- t(x)
    props <- tab/rowSums(tab)
    if(transform=="asin"){
      message("Performing arcsin square root transformation of proportions")
      prop.trans <- asin(sqrt(props))
    }
    else if(transform=="logit"){
      message("Performing logit transformation of proportions")
      props.pseudo <- (tab+0.5)/rowSums(tab+0.5)
      prop.trans <- log(props.pseudo/(1-props.pseudo))
    }
    list(Counts=t(tab), TransformedProps=t(prop.trans), Proportions=t(props))
  }

  else message("invalid data type")


}
