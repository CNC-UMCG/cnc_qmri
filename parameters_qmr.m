PATH = getenv('PATH');

setenv('PATH', [PATH ':/usr/share/ants/bin']);

inputData_spgr.rawDir = '/data/';
%
% A list of NIfTI names. (A unique string from the names is enough)
inputData_spgr.name =  ...%{'0009' '0010' '0011' '0012'};
{ ...
'05_t1_fl3d_sag_p2_iso_FA4_08_37_48/T1_FL3D_SAG_P2_ISO_FA4_0009_t1_fl3d_sag_p2_iso_FA4_20180405080742_9.nii', ...
'04_t1_fl3d_sag_p2_iso_FA10_08_33_1/T1_FL3D_SAG_P2_ISO_FA10_0008_t1_fl3d_sag_p2_iso_FA10_20180405080742_8.nii', ...
'03_t1_fl3d_sag_p2_iso_FA20_08_28_13/T1_FL3D_SAG_P2_ISO_FA20_0007_t1_fl3d_sag_p2_iso_FA20_20180405080742_7.nii', ...
'02_t1_fl3d_sag_p2_iso_FA30_08_22_43/T1_FL3D_SAG_P2_ISO_FA30_0006_t1_fl3d_sag_p2_iso_FA30_20180405080742_6.nii'};
%
% The TR of each NIfTI in the list (in msec)
inputData_spgr.TR = [19 19 19 19];
%
% The TE of each NIfTI in the list (in msec)
inputData_spgr.TE = [3.34 3.34 3.34 3.34];
%
% The flip angle of each NIfTI in the list (in degrees)
inputData_spgr.flipAngle = [4 10 20 30];
%
% The field strength of each NIfTI in the list (in Teslas)
inputData_spgr.fieldStrength = [3 3 3 3];


%inputData.spgr.freq_dim
%inputData.spgr.phase_dim

%% SEIR DATA %%%

%inputData_seir.rawDir = '/Users/marsman/Documents/NIC/mrQ/data/P0434/nifti';
inputData_seir.rawDir = '/data/nifti'

%
% A list of NIfTI names.  (A unique string from the names is enough)
inputData_seir.name = { ...
'09_t1_ep2d_tra_p3_IR200_08_49_35/T1_EP2D_TRA_P3_IR200_0013_t1_ep2d_tra_p3_IR200_20180405080742_13.nii',...
'08_t1_ep2d_tra_p3_IR400_08_47_59/T1_EP2D_TRA_P3_IR400_0012_t1_ep2d_tra_p3_IR400_20180405080742_12.nii',...
'07_t1_ep2d_tra_p3_IR1200_08_46_23/T1_EP2D_TRA_P3_IR1200_0011_t1_ep2d_tra_p3_IR1200_20180405080742_11.nii',...
'06_t1_ep2d_tra_p3_IR2400_08_44_48/T1_EP2D_TRA_P3_IR2400_0010_t1_ep2d_tra_p3_IR2400_20180405080742_10.nii'};
%
% The TR of each NIfTI in the list (in msec)
inputData_seir.TR = [2920 2920 2920 2920];
%
% The TE of each NIfTI in the list (in msec)
inputData_seir.TE = [49 49 49 49];
%
% The inversion time of each NIfTI in the list (in msec)
inputData_seir.IT = [200 400 1200 2400];


% RUN

%mrQ_run('/Users/marsman/Documents/NIC/mrQ/data/P0434/nifti', '/Users/marsman/Documents/NIC/mrQ/data/P0434/output', inputData_spgr, inputData_seir,[]);
%mrQ_run('/data/nifti', '/data/output', inputData_spgr, inputData_seir,[]);

% RUN AFTER ERROR
mrQ_run('/Users/marsman/Documents/NIC/mrQ/data/P0434/nifti', ...
        '/Users/marsman/Documents/NIC/mrQ/data/P0434/output', ...
        inputData_spgr, ...
        inputData_seir,...
        [],...
        {'seir_done',1});
    
