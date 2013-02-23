import "ecere"
import "mainpanel"


define samplePort10 = (atoi(portssetup.editBox14.contents));

struct SamplePacket10
{
   int stringLen;
   char string[1];   
};

class MySocket10 : Socket
{

  
}

MySocket10 socket10 {};