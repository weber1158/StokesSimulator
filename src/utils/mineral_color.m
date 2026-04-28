function C = mineral_color(mineralogy)
%Color code for mineral
%Returns normalized RGB triplet for a chosen mineralogy
  batlowK = [0.0167    0.0208    0.0409
             0.9923    0.7523    0.8374
             0.4702    0.4869    0.2563
             0.2239    0.3352    0.3734
             0.8975    0.6332    0.3784
             0.1071    0.1849    0.2691
             0.6871    0.5749    0.2256
             0.3288    0.4105    0.3315
             0.9813    0.6825    0.6055
             0.0685    0.1008    0.1526
             0.5696    0.5319    0.2255
             0.8048    0.6086    0.2796
             0.2745    0.3761    0.3610
             0.9922    0.7147    0.7194];
  switch mineralogy
    case 'Average Crustal'
      C = batlowK(1,:);
    case 'Calcite'
      C = batlowK(2,:);
    case 'Chlorite'
      C = batlowK(3,:);
    case 'Feldspar'
      C = batlowK(4,:);
    case 'Fe-oxides'
      C = batlowK(5,:);
    case 'Goethite'
      C = batlowK(6,:);
    case 'Gypsum'
      C = batlowK(7,:);
    case 'Hematite'
      C = batlowK(8,:);
    case 'Illite'
      C = batlowK(9,:);
    case 'Kaolinite'
      C = batlowK(10,:);
    case 'Mica'
      C = batlowK(11,:);
    case 'Smectite'
      C = batlowK(12,:);
    case 'Quartz'
      C = batlowK(13,:);
    case 'Vermiculite'
      C = batlowK(14,:);
  end
end