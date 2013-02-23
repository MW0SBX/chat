import "ecere"
import "mainpanel"


define samplePort11 = (atoi(portssetup.editBox15.contents));

struct SamplePacket11
{
   int stringLen;
   char string[1];   
};

class MySocket11 : Socket
{

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {  
      if(count >= sizeof(SamplePacket11))
      {
         SamplePacket11 * packet = (SamplePacket11 *) buffer;
         uint size = sizeof(SamplePacket11) + packet->stringLen;

         if(count >= size)
         {

            portssetup.recvString.contents = packet->string; //recvString in portssetup 
   
            return size;
         }
         
      }

      return 0;
   }

}

MySocket11 socket11 {};