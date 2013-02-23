import "ecere"
import "mainpanel"


define samplePort3 = (atoi(portssetup.editBox7.contents));

struct SamplePacket3
{
   int stringLen;
   char string[1];   
};

class MySocket3 : Socket
{

 
}

MySocket3 socket3 {};