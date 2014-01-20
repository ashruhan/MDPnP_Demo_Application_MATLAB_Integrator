%The following calls are to initiate classes of SampleArray Algorithms each
%call has the same data structure and algorithnms associated with them.
%Refer to SampleArray Algorith in /Algorithm/SampleArrayAlgorthm.m for
%further explaination of what each class does. 
PLETH = SampleArray_Algorithm_LargeMSPS;
ST_I = SampleArray_Algorithm_smallMSPS;
ST_II = SampleArray_Algorithm_smallMSPS;
ST_III = SampleArray_Algorithm_smallMSPS;
CAPNOGRAPH = SampleArray_Algorithm_mediumMSPS;
assignin('base','PLETH',PLETH);
assignin('base','ST_I',ST_I);
assignin('base','ST_III',ST_III);
assignin('base','CAPNOGRAPH',CAPNOGRAPH)

% HR = Num_Algorithm;
% =======
% >>>>>>> Working with Live Devices
RESP_RATE = Num_Algorithm;
CO2_EXP = Num_Algorithm;
PULSE_OXIM_PULSE_RATE = Num_Algorithm;
PULSE_OXIM_SAT_02 = Num_Algorithm;
assignin('base','RESP_RATE',RESP_RATE)
assignin('base','CO2_EXP',CO2_EXP)
assignin('base','PULSE_OXIM_PULSE_RATE',PULSE_OXIM_PULSE_RATE)
assignin('base','PULSE_OXIM_SAT_02',PULSE_OXIM_SAT_02)
% <<<<<<< HEAD
% assignin('base','HR',HR)

% =======
% >>>>>>> Working with Live Devices

% Matlab Gui building much like other software is tedious and time consuming
% the code below initiates teh Gui layout which can be refreshed in
% Algorithms using the global S handle. For futher explaination of the code
% email ashruhan@docboxinc.com 
S.fh(1) = figure('units','pixels',...
    'position',[100 40 1200 600],...
    'menubar','none',...
    'name','ML_MDPnP_demo_app',...
    'Color','black','numbertitle','off',...
    'resize','off');
S.SAT_02 = uicontrol('style','text',...
    'unit','pix',...
    'position',[850 430 240 55],...
    'ForegroundColor','green',...
    'backgroundColor','black','fontsize',40,'HorizontalAlignment','center',...
    'string','SPO2=00');
S.CO2_EXP = uicontrol('style','text',...
    'unit','pix',...
    'position',[810 230 350 55],...
    'ForegroundColor','green',...
    'backgroundColor','black','fontsize',40,'HorizontalAlignment','center',...
    'string','EXCO2=00');
S.PULSE_RATE = uicontrol('style','text',...
    'unit','pix',...
    'position',[810 530 350 55],...
    'backgroundColor','black','ForegroundColor','green',...
    'fontsize',40,'HorizontalAlignment','center',...
    'string','PULSE=00');
S.RESP = uicontrol('style','text',...
    'unit','pix',...
    'position',[810 330 350 55],...
    'backgroundColor','black','ForegroundColor','green',...
    'fontsize',40,'HorizontalAlignment','center',...
    'string','RR=00');

% <<<<<<< HEAD
% S.HR = uicontrol('style','text',...
%     'unit','pix',...
%     'position',[810 130 350 55],...
%     'backgroundColor','black','ForegroundColor','green',...
%     'fontsize',40,'HorizontalAlignment','center',...
%     'string','HR=00');

% =======
% >>>>>>> Working with Live Devices
axes('position',[.01 .780 .650 .200]);
S.PLETH = plot(PLETH.data);
axis('fill');
set(gca, 'color', 'black');
set(S.PLETH, 'color', 'green');
set(gca,'xtick',[],'ytick',[]);

axes('position',[.01 .570 .650 .200]);
S.CAPNOGRAPH = plot(CAPNOGRAPH.data);
axis('xy');
set(S.CAPNOGRAPH, 'color', 'green');
set(gca, 'color', 'black');
set(gca,'xtick',[],'ytick',[]);

axes('position',[.01 .410 .650 .150]);
S.ST_I = plot(ST_I.data);
axis('xy');
set(S.ST_I, 'color', 'green');
set(gca, 'color', 'black');
set(gca,'xtick',[],'ytick',[]);

axes('position',[.01 .250 .650 .150]);
S.ST_II = plot(ST_II.data);
axis('xy');
set(S.ST_II, 'color', 'green');
set(gca, 'color', 'black');
set(gca,'xtick',[],'ytick',[]);

temp = ST_III();
axes('position',[.01 .090 .650 .150]);
S.ST_III = plot(ST_III.data);
axis('xy');
set(S.ST_III, 'color', 'green');
set(gca, 'color', 'black');
set(gca,'xtick',[],'ytick',[]);

S.Stop = uicontrol('style','push',...
    'units','pix',...
    'position',[750, 10 180 40],...
    'HorizontalAlign','left',...
    'string','Stop and Close',...
    'fontsize',10,'fontweight','bold',...
    'callback',{@stopandclose,S});
assignin('base','S',S);
