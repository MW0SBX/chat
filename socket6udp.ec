import "ecere"
import "mainpanel"


define samplePort6 = (atoi(portssetup.editBox10.contents));

struct SamplePacket6
{
   int stringLen;
   char string[1];   
};

class MySocket6 : Socket
{


}

MySocket6 socket6 {};