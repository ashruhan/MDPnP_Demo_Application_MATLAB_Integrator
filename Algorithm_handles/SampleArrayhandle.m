%% SampleArray
%Since we are callling Readers(2) and refering to Main.m we know that this
%is the Numeric topic we are listening to. Should be noted that multiple
%writers can publish to the same topic and type, so we initiate a for loop
%to sort out the different writters. To sort the topics we take a samples 
%metric ID and compare to a know metric ID that we are looking for on the
%topic. If a match is confirmed the data is stored and algorithms are
%preforemed. Refer to /Algorithms/NumericAlgorithm.m for further
%explaination of the class.

%As of now there are now algorithms being preformed on SampleArrays 

function SampleArrayhandle(~,~,dp)
% dp is the DDS domain participant
% Sample is the Raw data being sourced from DDS
[Sample, ~]=dp.Subscribers(1).Readers(1).read();
% Make sure Sample is not empty
if (~isempty(Sample))
    %S is refering to the GUI handles if usable data is found the S is
    %updated
    S = evalin('base','S');
    for m = 1:length(Sample)
        
        %MDC_PULS_OXIM_PLETH: pleth waveform
        if strcmp(Sample(1,m).metric_id,'MDC_PULS_OXIM_PLETH')
            PLETH = evalin('base','PLETH');
            PLETH = Getdatatime(PLETH,Sample(1,m));
            set(S.PLETH,'YData',PLETH.data);
            assignin('base','PLETH',PLETH);
        end
        
        %MDC_CAPNOGRAPH: Respitory Rate waveform
        if strcmp(Sample(1,m).metric_id,'MDC_CAPNOGRAPH')
            CAPNOGRAPH = evalin('base','CAPNOGRAPH');
            CAPNOGRAPH = Getdatatime(CAPNOGRAPH,Sample(1,m));
            set(S.CAPNOGRAPH,'YData',CAPNOGRAPH.data);
            assignin('base','CAPNOGRAPH',CAPNOGRAPH);
        end
        
        %MDC_ECG_AMPL_ST_I: ECG lead number one waveform
        if strcmp(Sample(1,m).metric_id,'MDC_ECG_AMPL_ST_I')
            ST_I = evalin('base','ST_I');
            ST_I = Getdatatime(ST_I,Sample(1,m));
            set(S.ST_I,'YData',ST_I.data);
            assignin('base','ST_I',ST_I);
        end
        
        %MDC_ECG_AMPL_ST_II: ECG lead number two waveform
        if strcmp(Sample(1,m).metric_id,'MDC_ECG_AMPL_ST_II')
            ST_II = evalin('base','ST_II');
            ST_II = Getdatatime(ST_II,Sample(1,m));
            set(S.ST_II,'YData',ST_II.data);
            assignin('base','ST_II',ST_II);
        end
        %MDC_ECG_AMPL_ST_III: ECG lead number three waveform
        if strcmp(Sample(1,m).metric_id,'MDC_ECG_AMPL_ST_III')
            ST_III = evalin('base','ST_III');
            ST_III = Getdatatime(ST_III,Sample(1,m));
            set(S.ST_III,'YData',ST_III.data);
            assignin('base','ST_III',ST_III);
        end
    end 
end

