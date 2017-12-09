function lior_mat_to_spatialbox_mat(matfile)
% Lior created a new type of mat files using his GUI of MatPIV
% we need to convert it to our MAT file type of spatialbox
% to create time analysis, etc. 
% It saves a single MAT file that Spatialbox asks to load twice
% once for X,Y and another time for U,V (probably something to be done in
% the spatialbox)

data = load(matfile);

% data.cell{1}
% 
% ans = 
% 
%       x: [16x26 double]
%       y: [16x26 double]
%       u: [16x26 double]
%       v: [16x26 double]
%     snr: [17x27 double]
%     pkh: [17x27 double]

x = data.cell{1}.x;
y = data.cell{1}.y; %#ok<NASGU>

[u,v] = deal(zeros(size(x,1),size(x,2),length(data.cell)));


for i = 1:length(data.cell)
    u(:,:,i) = data.cell{i}.u;
    v(:,:,i) = data.cell{i}.v;
end

save([matfile(1:end-4),'_spatialbox.mat'],'x','y','u','v');