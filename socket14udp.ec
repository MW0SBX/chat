import "ecere"
import "mainpanel"


define samplePort14 = (atoi(portssetup.editBox18.contents));

struct SamplePacket14
{
   int stringLen;
   char string[1];   
};

class MySocket14 : Socket
{


}

MySocket14 socket14 {};