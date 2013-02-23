import "ecere"
import "mainpanel"


define samplePort13 = (atoi(portssetup.editBox17.contents));

struct SamplePacket13
{
   int stringLen;
   char string[1];   
};

class MySocket13 : Socket
{

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {
      if(count >= sizeof(SamplePacket13))
      {
         SamplePacket13 * packet = (SamplePacket13 *) buffer;
         uint size = sizeof(SamplePacket13) + packet->stringLen;

         if(count >= size)
         {

            portssetup.recvString.contents = packet->string; //recvString in portssetup 
   
            return size;
         }
         
      }

      return 0;
   }

}

MySocket13 socket13 {};