function outImg = g(inImg,k)
% define the g function
outImg = exp( - (inImg.*inImg) / (k^2) );
end