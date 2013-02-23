import "ecere"
import "mainpanel"


define samplePort2 = (atoi(portssetup.editBox6.contents));

struct SamplePacket2
{
   int stringLen;
   char string[1];   
};

class MySocket2 : Socket
{

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {
      if(count >= sizeof(SamplePacket2))
      {
         SamplePacket2 * packet = (SamplePacket2 *) buffer;
         uint size = sizeof(SamplePacket2) + packet->stringLen;

         if(count >= size)
         {

            portssetup.recvString.contents = packet->string; //recvString in portssetup 
   
            return size;
         }
         
      }

      return 0;
   }

}

MySocket2 socket2 {};