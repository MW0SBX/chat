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

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   { 
      if(count >= sizeof(SamplePacket5))
      {
         SamplePacket5 * packet = (SamplePacket5 *) buffer;
         uint size = sizeof(SamplePacket5) + packet->stringLen;

         if(count >= size)
         {

            portssetup.recvString.contents = packet->string; //recvString in portssetup 
   
            return size;
         }
         
      }

      return 0;
   }

}

MySocket5 socket5 {};