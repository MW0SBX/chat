import "ecere"
import "mainpanel"


define samplePort8 = (atoi(portssetup.editBox12.contents));

struct SamplePacket8
{
   int stringLen;
   char string[1];   
};

class MySocket8 : Socket
{

 
}

MySocket8 socket8 {};