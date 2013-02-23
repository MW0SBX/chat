import "ecere"
import "mainpanel"


define samplePort1 = (atoi(portssetup.editBox5.contents));

struct SamplePacket1
{
   int stringLen;
   char string[1];   
};

class MySocket1 : Socket
{

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {
      if(count >= sizeof(SamplePacket1))
      {
         SamplePacket1 * packet = (SamplePacket1 *) buffer;
         uint size = sizeof(SamplePacket1) + packet->stringLen;

         if(count >= size)
         {

            portssetup.recvString.contents = packet->string; //recvString in portssetup 
   
            return size;
         }
         
      }

      return 0;
   }

}

MySocket1 socket1 {};