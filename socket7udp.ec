import "ecere"
import "mainpanel"


define samplePort7 = (atoi(portssetup.editBox11.contents));

struct SamplePacket7
{
   int stringLen;
   char string[1];   
};

class MySocket7 : Socket
{

 
}

MySocket7 socket7 {};