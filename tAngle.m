function tA = tAngle(tImage)
n = 4; m = 2;           % Define the order and the repetition of the moment
[ZZ, AOH, PhiOH] = Zernikmoment(tImage,n,m);      % Call Zernikemoment fuction
tA=PhiOH;
end

