import "ecere"
import "mainpanel"


define samplePort14 = (atoi(portssetup.editBox18.contents));

struct SamplePacket14
{
   int stringLen;
   char string[1];   
};

class MySocket14 : Socket
{

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {
      if(count >= sizeof(SamplePacket14))
      {
         SamplePacket14 * packet = (SamplePacket14 *) buffer;
         uint size = sizeof(SamplePacket14) + packet->stringLen;

         if(count >= size)
         {

            portssetup.recvString.contents = packet->string; //recvString in portssetup 
   
            return size;
         }
         
      }

      return 0;
   }

}

MySocket14 socket14 {};