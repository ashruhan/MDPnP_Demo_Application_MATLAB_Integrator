classdef SampleArray
    properties
        unique_device_identifier =  char(zeros(1,64)); %@key
        metric_id =  char(zeros(1,64)); %@key
        instance_id = int32(0); %@key
        values = single(zeros(1,400));
        millisecondsPerSample = int32(0);
        
    end
    methods (Static = true)
        function keyFields = getKeyFields()
            keyFields = [true, true, true, false, false];
        end
        
        function sequenceFields = getSequenceFields()
            sequenceFields = [false, false, false, true, false];
        end
        function module = getIDLModule()
            module = '<module id="ice"/>';
        end
    end
end
