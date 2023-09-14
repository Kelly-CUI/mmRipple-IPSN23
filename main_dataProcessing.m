clc;
close all;

% processing mmWave radar
% Kaiyan 
% 2022-10-17

% bin data path
binDataPath = '.\Data\';  
binDataDir = dir([binDataPath,'*.bin']);
fileCount = length(binDataDir);

%bin to matData
for fileId = 1 : 1 :fileCount

    fileName = binDataDir(fileId).name
    disp(['----------',num2str(fileId),'------------']);
    sourceDataFile = [binDataPath, fileName]

    binPath = binDataPath(1:end-1);
    readerRawData('.\setting\16single.setup.json',fileName,binPath); 

end


matDataPath = [binDataPath,'matData\'];
matDataDir = dir([matDataPath,'*.mat']);
fileCount = length(matDataDir);



% target vibration frequecy

sigFre = [100,300];

% target location
trueLoc = 1;


for fileId = 1: 1 : fileCount

    fileName = matDataDir(fileId).name;
    disp(['----------',num2str(fileId),'------------']);
    matDataFile = [matDataPath, fileName];

    % target path
    saveTargetPath=[matDataPath,'Proced\'];
    mkdir(saveTargetPath);
    saveData = [saveTargetPath, fileName(1:end-4)];
    
    % initialization
    radarCube = [];

    % load mat Data
    load(matDataFile);


    if (isempty(radarCube))
      fprintf("ERROR -- on radarCube"); 
      break;
    end   

    rangeFFT_x = radarCube.rfParams.rangeFFT_x;


    [radarCube] = getTargetSignal(radarCube);

    % find target bin
    diff_distance = abs(rangeFFT_x-trueLoc);
    [~,idx] = min(diff_distance);
    
    % target signal
    signal = radarCube.targetSignal(:,:,idx);
    angle = 0;


    % vibration signal
    vibSig = getVibSig(signal,angle,sigFre);


    end



