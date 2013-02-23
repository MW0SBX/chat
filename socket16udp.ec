import "ecere"
import "mainpanel"


define samplePort16 = (atoi(portssetup.editBox20.contents));

struct SamplePacket16
{
   int stringLen;
   char string[1];   
};

class MySocket16 : Socket
{

 
}

MySocket16 socket16 {};