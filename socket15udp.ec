import "ecere"
import "mainpanel"


define samplePort15 = (atoi(portssetup.editBox19.contents));

struct SamplePacket15
{
   int stringLen;
   char string[1];   
};

class MySocket15 : Socket
{

 
}

MySocket15 socket15 {};