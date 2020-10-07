%------------ FreeSurfer -----------------------------%
fshome = getenv('FREESURFER_HOME');
fsmatlab = sprintf('%s/matlab',fshome);
if (exist(fsmatlab) == 7)
    addpath(genpath(fsmatlab));
end
clear fshome fsmatlab;
%-----------------------------------------------------%

%------------ FreeSurfer FAST ------------------------%
fsfasthome = getenv('FSFAST_HOME');
fsfasttoolbox = sprintf('%s/toolbox',fsfasthome);
if (exist(fsfasttoolbox) == 7)
    path(path,fsfasttoolbox);
end
clear fsfasthome fsfasttoolbox;
%-----------------------------------------------------%

setenv('PATH', [getenv('PATH') ':/usr/local/bin']);
addpath(genpath('/Users/nilsharmening/Projects/fieldtrip'));
addpath(genpath('/Users/nilsharmening/Projects/Headmodeltoolbox'));
addpath(genpath('/Users/nilsharmening/Projects/bbci_public/')) 
run '/Users/nilsharmening/Projects/bbci_public/startup_bbci_toolbox.m'
mnt = mnt_setElectrodePositions(elec_aligned.label)
