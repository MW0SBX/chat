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

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {
      if(count >= sizeof(SamplePacket9))
      {
         SamplePacket9 * packet = (SamplePacket9 *) buffer;
         uint size = sizeof(SamplePacket9) + packet->stringLen;

         if(count >= size)
         {

            portssetup.recvString.contents = packet->string; //recvString in portssetup 
   
            return size;
         }
         
      }

      return 0;
   }

}

MySocket9 socket9 {};