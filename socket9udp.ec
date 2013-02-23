import "ecere"
import "mainpanel"


define samplePort9 = (atoi(portssetup.editBox13.contents));

struct SamplePacket9
{
   int stringLen;
   char string[1];   
};

class MySocket9 : Socket
{
 

}

MySocket9 socket9 {};