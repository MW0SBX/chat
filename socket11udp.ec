import "ecere"
import "mainpanel"


define samplePort11 = (atoi(portssetup.editBox15.contents));

struct SamplePacket11
{
   int stringLen;
   char string[1];   
};

class MySocket11 : Socket
{


}

MySocket11 socket11 {};