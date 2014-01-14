classdef Numeric
    properties
        unique_device_identifier =  char(zeros(1,64));
        metric_id = char(zeros(1,64));
        instance_id = int32(0);
        value = single(0);
    end
    methods (Static = true)
        function keyFields = getKeyFields()
            keyFields = [true, true, true, false];
        end
        function module = getIDLModule()
            module = '<module id="ice"/>';
        end
    end
end
