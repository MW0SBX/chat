import "ecere"
import "mainpanel"


define samplePort4 = (atoi(portssetup.editBox8.contents));

struct SamplePacket4
{
   int stringLen;
   char string[1];   
};

class MySocket4 : Socket
{

  
}

MySocket4 socket4 {};