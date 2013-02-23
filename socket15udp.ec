import "ecere"
import "mainpanel"


define samplePort15 = (atoi(portssetup.editBox19.contents));

struct SamplePacket15
{
   int stringLen;
   char string[1];   
};

class MySocket15 : Socket
{

<<<<<<< HEAD
 
=======
   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {

      if(count >= sizeof(SamplePacket15))
      {
         SamplePacket15 * packet = (SamplePacket15 *) buffer;
         uint size = sizeof(SamplePacket15) + packet->stringLen;

         if(count >= size)
         {

            portssetup.recvString.contents = packet->string; //recvString in portssetup 
   
            return size;
         }
         
      }

      return 0;
   }
   /*   bool ()
      {
         String string = portssetup.sentString.contents;  //sentString  in portssetup 
         int len = strlen(string);
         int size = sizeof(SamplePacket15) + len;
         SamplePacket15 * packet = (SamplePacket15 *)new byte[size];
         packet->stringLen = len;
         memcpy(packet->string, string, len+1);
         (socket15).Send(packet, size);

         delete packet;
         return true;
      }  */
>>>>>>> 749a344b817a69a214c7e9806ccc6ed60d826046
}

MySocket15 socket15 {};