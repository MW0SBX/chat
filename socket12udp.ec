import "ecere"
import "mainpanel"


define samplePort12 = (atoi(portssetup.editBox16.contents));

struct SamplePacket12
{
   int stringLen;
   char string[1];   
};

class MySocket12 : Socket
{


}

MySocket12 socket12 {};