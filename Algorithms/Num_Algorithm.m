%% Numeric Algorithms
% The SampleArray class is seperated into two distinct parts properties and
% methods. Properties descrpibes the data structure of the class that the
% methods perform functions on. 
% 
%Description of Functions
% 
%GetDateTime is a function in which is shift the old data down the class
%and stores the newest data in the front of the vector. Data is stored over
%a period of time in order to satify algorithms.
% 
%differentialData determines if the static values are changing with a
%absolute slope greater that a set value over a set time. 
% 
% testLim function determins if the newest static point is over a threshold
% that is determined by the user. If data is over the threshold then the
% time is recorded, if the data contineoously is over the threshold for a
% specified amount of time a warning alarm is sent.
classdef Num_Algorithm   
    properties
        unique_device_identifier =  char(zeros(1,64)); %@key
        millisecondsPerSample = int32(0);
        data = zeros(1,32);
        time = zeros(1,32);
        seqPos = double(0);
    end
    
    methods
        
        function [RESP] = GetDateTime(obj,DDSInput)
            clk = clock;
            for m = 1:(length(obj.data)-1)
                obj.data(1,m) = obj.data(1,m+1);
            end
            obj.data(1,length(obj.data)) = DDSInput;
            
            for m = 1:(length(obj.time)-1)
                obj.time(1,m) = obj.time(1,m+1);
            end
            time2 = (clk(4)*3600+clk(5)*60+clk(6));
            obj.time(1,length(obj.time)) = time2;
            RESP = obj;
        end

        function limstatus = testLim(obj,limits)
            if length(obj.data) == length(obj.time)
                limstatus = 'clear';
                numzr = nnz(obj.data);
                startp = length(obj.data) + 1 - numzr;
                if startp < (length(obj.data)-2)
                    warningbit = 0;
                    warningpos = 0;
                    
                    for m = startp:length(obj.data)
                        if obj.data(1,m) > limits.upper
                            
                            if warningbit~=1
                                warningbit = 1;
                                warningpos = m;
                            else
                                if abs((obj.time(1,warningpos)-obj.time(1,m))) > 5
                                    limstatus = 'warning';
                                end
                            end
                            
                        elseif obj.data(1,m) < limits.lower
                            
                            if warningbit~=1
                                warningbit = 1;
                                warningpos = m;
                            else
                                if abs((obj.time(1,warningpos)-obj.time(1,m))) > 5
                                    limstatus = 'warning';
                                end
                            end
                            
                        else
                            warningbit = 0;
                            warningpos = 0;
                            
                        end
                    end
                    
                end
            end
        end
    end
end

