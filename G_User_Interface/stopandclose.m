%% stop and close
% All the below functions are intended to stop matlab processes that were
% initiated in the Main.m This is done so that multiple executions of
% Main.m can be done without a Segmentation fault
function stopandclose(varargin)  
close('ML_MDPnP_demo_app')%close the MainDisp Gui
evalin('base','stop(Read)');
evalin('base','delete(Read)');
evalin('base','clear Read');

evalin('base','stop(Read2)');
evalin('base','delete(Read2)');
evalin('base','clear Read2');
evalin('base','clear dp');
clear S
end