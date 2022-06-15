//Connect to server
global.connected = false;
client = network_create_socket(network_socket_ws);
serverIp = "localhost";
port = 3000;

connect_timeup = 0;
connect_timeup_max = 60*6; //Attempt to connect every 6 seconds

ping_timeup = 0;
ping_timeup_max = 60*6; //Attempt to connect every 6 seconds