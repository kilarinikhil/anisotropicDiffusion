function outImg = anisoDiff(inImg,iter,l,k)

% define kernels to find gradients in four directions
nKer = [0 0 0 ; 0 -1 0 ; 0 1 0];
eKer = [0 0 0 ; 1 -1 0 ; 0 0 0];
wKer = [0 0 0 ; 0 -1 1 ; 0 0 0];
sKer = [0 1 0 ; 0 -1 0 ; 0 0 0];

% copy image into tmp
tmp = inImg;

for i = 1:iter
    % find gradients in four directions
    nDiff = conv2(tmp,nKer,'same');
    eDiff = conv2(tmp,eKer,'same');
    sDiff = conv2(tmp,sKer,'same');
    wDiff = conv2(tmp,wKer,'same');
    
    % find their corresponding c values
    cN = g(nDiff,k);
    cE = g(eDiff,k);
    cS = g(sDiff,k);
    cW = g(wDiff,k);
    
    % apply the anisotropic diffusion equation
    tmp = tmp + l* (cN.*nDiff + cE.*eDiff + cS.*sDiff + cW.*wDiff);
end

% output the image
outImg = tmp;
end