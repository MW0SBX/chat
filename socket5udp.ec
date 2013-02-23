import "ecere"
import "mainpanel"


define samplePort5 = (atoi(portssetup.editBox9.contents));

struct SamplePacket5
{
   int stringLen;
   char string[1];   
};

class MySocket5 : Socket
{


}

MySocket5 socket5 {};