Application is intended to provide a basic platform in how algorithms are supported using the MDPnP_demo_app as a data source.

Data is sorted by domain, topic and types, data structure, and key.
Readers are initialized to read form a topic and type using a specified 
data structure. If data is found on that topic and type the data is then sorted 
using the correspinging metric ID and is then available for research development. 

To Execute Application:
First, HIghlight any folders in the front directory right click, add to path, select folders and subfolders.
In this case Algorithms, DDS_input, Functions, G_User_Interface
Second, drag Main.m from curent folder window into the Command Window and the Program should execute.

Common start up errors:
Make sure the DDS blockset is installed and added to the path. 
To install DDS_Blockset follow ftp://ftp.mathworks.com/pub/customer_pickup/DDSBlocksetPSP
link and install according to your appropriate platform. If the Blockset is not 
automatically added to you path go to your MATLAB install directory and followth the following path 
MATLAB\R2013b\toolbox\psp\tools\DDSBlockset\add_psp_path.m
Execute the add_psp_path.m program to set the path. 