%% Numeric
%Since we are callling Readers(1) and refering to Main.m we know that this
%is the SampleArray topic we are listening to. Should be noted that multiple
%writers can publish to the same topic and type, so we initiate a for loop
%to sort out the different writters. To sort the topics we take a samples
%metric ID and compare to a know metric ID that we are looking for on the
%topic. If a match is confirmed the data is stored and algorithms are
%preforemed. Refer to /Algorithms/SampleArrayAlgorithm.m for further
function Numerichandle(~,~,dp)
% dp is the DDS domain participant
% NumSampl is the Raw data being sourced from DDS
[NumSampl, ~]=dp.Subscribers(1).Readers(2).read();
% Make sure NumSampl is not  empty
if (~isempty(NumSampl))
    %S is refering to the GUI handles if usable data is found the S is
    %updated
    S = evalin('base','S');
    for m = 1:length(NumSampl)
        
        %MDC_RESP_RATE: Respitory Rate numeric data
        if strcmp(NumSampl(1,m).metric_id,'MDC_RESP_RATE')&&strcmp(NumSampl(1,m).unique_device_identifier,'sjgTVdaNtNtKXGp3Zoy1leVqhr9bAythBB7e')
            RESP_RATE = evalin('base','RESP_RATE');
            limits.upper = 100;limits.lower = 20;
            [RESP_RATE] = GetDateTime(RESP_RATE,NumSampl(1,m).value);
            [Lstatus] = testLim(RESP_RATE,limits); %#ok<*NASGU>
            aXString = strcat('RR=',num2str(RESP_RATE.data(1,length(RESP_RATE.data))));
            set(S.RESP,'str',{aXString},'ForegroundColor','green');
            assignin('base','RESP_RATE',RESP_RATE)
        end
        
        %MDC_AWAY_CO2_EXP: etCo2 numeric data
        if strcmp(NumSampl(1,m).metric_id,'MDC_AWAY_CO2_EXP')&&strcmp(NumSampl(1,m).unique_device_identifier,'sjgTVdaNtNtKXGp3Zoy1leVqhr9bAythBB7e')
            CO2_EXP = evalin('base','CO2_EXP');
            limits.upper = 100;limits.lower = 20;
            [CO2_EXP] = GetDateTime(CO2_EXP,NumSampl(1,m).value);
            [Lstatus] = testLim(CO2_EXP,limits);
            aXString = strcat('etCO2=',num2str(CO2_EXP.data(1,length(CO2_EXP.data))));
            set(S.CO2_EXP,'str',{aXString},'ForegroundColor','green');
            assignin('base','CO2_EXP',CO2_EXP)
        end
        
        %MDC_PULS_OXIM_PULS_RATE: pulse rate numeric data
        if strcmp(NumSampl(1,m).metric_id,'MDC_PULS_OXIM_PULS_RATE')&&strcmp(NumSampl(1,m).unique_device_identifier,'JgREBYpT9q1SMvdV9nvt8rJU6n4FhERrJINV')
            PULSE_OXIM_PULSE_RATE = evalin('base','PULSE_OXIM_PULSE_RATE');
            limits.upper = 70;limits.lower = 20;
            [PULSE_OXIM_PULSE_RATE] = GetDateTime(PULSE_OXIM_PULSE_RATE,NumSampl(1,m).value);
            [Lstatus] = testLim(PULSE_OXIM_PULSE_RATE,limits);
            aXString = strcat('PULSE=',num2str(PULSE_OXIM_PULSE_RATE.data(1,length(PULSE_OXIM_PULSE_RATE.data))));
            set(S.PULSE_RATE,'str',{aXString},'ForegroundColor','green');
            assignin('base','PULSE_OXIM_PULSE_RATE',PULSE_OXIM_PULSE_RATE)
        end
        
        %MDC_PULS_OXIM_SAT_O2: spo2 numeric data
        if strcmp(NumSampl(1,m).metric_id,'MDC_PULS_OXIM_SAT_O2')&&strcmp(NumSampl(1,m).unique_device_identifier,'JgREBYpT9q1SMvdV9nvt8rJU6n4FhERrJINV')
            PULSE_OXIM_SAT_02 = evalin('base','PULSE_OXIM_SAT_02');
            limits.upper = 100; limits.lower = 20;
            [PULSE_OXIM_SAT_02] = GetDateTime(PULSE_OXIM_SAT_02,NumSampl(1,m).value);
            [Lstatus] = testLim(PULSE_OXIM_SAT_02,limits);
            aXString = strcat('SPO2=',num2str(PULSE_OXIM_SAT_02.data(1,length(PULSE_OXIM_SAT_02.data))));
            set(S.SAT_02,'str',{aXString},'ForegroundColor','green');
            assignin('base','PULSE_OXIM_SAT_02',PULSE_OXIM_SAT_02)
            % <<r<<<<< HEAD
        end
        
        %         %MDC_PULS_RATE: Heart Rate numeric data
        %         if strcmp(NumSampl(1,m).metric_id,'MDC_PULS_RATE')
        %             HR = evalin('base','HR');
        %             limits.upper = 100;limits.lower = 20;
        %             [HR] = GetDateTime(HR,NumSampl(1,m).value);
        %             [Dstatus] = differentialData(HR);
        %             [Lstatus] = testLim(HR,limits);
        %             aXString = strcat('HR=',num2str(HR.data(1,length(HR.data))));
        %             set(S.HR,'str',{aXString},'ForegroundColor','green');
        %             assignin('base','HR',HR)
        %         end
        % =======
    end
    % >>>>>>> Working with Live Devices
end
end