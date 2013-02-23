import "ecere"
import "mainpanel"


define samplePort2 = (atoi(portssetup.editBox6.contents));

struct SamplePacket2
{
   int stringLen;
   char string[1];   
};

class MySocket2 : Socket
{

 
}

MySocket2 socket2 {};