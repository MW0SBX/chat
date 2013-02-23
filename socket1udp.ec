import "ecere"
import "mainpanel"


define samplePort1 = (atoi(portssetup.editBox5.contents));

struct SamplePacket1
{
   int stringLen;
   char string[1];   
};

class MySocket1 : Socket
{

  
}

MySocket1 socket1 {};