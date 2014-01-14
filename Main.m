%% DDS Objects
% Creating the DDS Subscribers and Readers that will be used to Subscribe
% to the MDPnP_demo_apps application. Timer is used to call functions
% polling the readers and listening for data. 

%Refer to the GuiOutline funtion in /G_User_Interface/GuiOutline.m for
%Explaination 

initialize;
%dp_profile represents the Library and profile that is used within the
%USER_QOS_PROFILES.xml It should be noted that multiple profiles can be
%used for different readers and writters within the same subscribers and
%publishers
dp_profile = 'UDPv4TransportLibrary::DefaultProfile';
%dp is the domain particicant with profile dp_profile on domain zero
dp = DDS.DomainParticipant(dp_profile, 0);
%dp.addReader creates a reader with a topic and type with the profile
%dp_profile\ dp.Subscribers(1).Readers(.....) the order in wich you create
%the reader is the number associted with the reader ....Example is
%associated with dp.Subscribers(1).Readers(1) and Numeric would be
%dp.Subscribers(1).Readers(2)
dp.addReader('SampleArray','ice::SampleArray',dp_profile);%1
dp.addReader('Numeric','ice::Numeric',dp_profile);        %2

Num_Readers = 2;
for i = 1:Num_Readers
dp.Subscribers(1).Readers(i).ReadTake = ReadMethodType.TAKE;
end
%% Create and start timers
%Timers are created to poll the different topics untill data is queued in
%the buffer. Refer to the functions Numerichandle, SampleArrayhandle for 
%further explaination of the listening processs. Both timers are executed
%with a fixed spacing period, refer to
%http://www.mathworks.com/help/matlab/ref/timerclass.html for further
%explanation
Read=timer('Period',.01, 'ExecutionMode', 'fixedSpacing','BusyMode','drop');
Read.TimerFcn = {@SampleArrayhandle, dp}; start(Read)

Read2=timer('Period',.1, 'ExecutionMode','fixedSpacing','BusyMode','drop');
Read2.TimerFcn = {@Numerichandle,dp}; start(Read2)
