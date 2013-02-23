import "ecere"
import "mainpanel"


define samplePort13 = (atoi(portssetup.editBox17.contents));

struct SamplePacket13
{
   int stringLen;
   char string[1];   
};

class MySocket13 : Socket
{

 
}

MySocket13 socket13 {};