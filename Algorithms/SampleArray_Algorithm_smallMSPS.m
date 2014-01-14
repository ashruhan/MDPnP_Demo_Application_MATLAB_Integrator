%% Small milli Seconds Per Sample
% The SampleArray class is seperated into two distinct parts properties and
% methods. Properties descrpibes the data structure of the class that the
% methods perform functions on.
%
%Description of Functions
%
%GetDateTime is a function in which is shift the old data down the class
%and stores the newest data in the front of the vector. Data is stored over
%a period of time in order to satify algorithms.
classdef SampleArray_Algorithm_smallMSPS
    properties
        
        unique_device_identifier =  char(zeros(1,64)); %@key
        millisecondsPerSample = int32(0);
        data = ones(1,2050);
        time = zeros(1,2050);
        seqPos = double(1);
        endPos = double(205);
    end
    methods
        function Retobj = Getdatatime(obj,Refobj)
            c = nnz(Refobj.values);
            if ~isequal(obj.seqPos,obj.endPos)&&(c>=1)
                obj.data(c*obj.seqPos-(c-1):c*obj.seqPos) = Refobj.values(1:c);
                obj.seqPos = obj.seqPos+1;
            else
                obj.data(c*obj.seqPos-(c-1):c*obj.seqPos) = Refobj.values(1:c);
                obj.seqPos = 1;
            end
            Retobj = obj;
        end 
    end
end

