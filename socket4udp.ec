import "ecere"
import "mainpanel"


define samplePort4 = (atoi(portssetup.editBox8.contents));

struct SamplePacket4
{
   int stringLen;
   char string[1];   
};

class MySocket4 : Socket
{

<<<<<<< HEAD
  
=======
   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {

      if(count >= sizeof(SamplePacket4))
      {
         SamplePacket4 * packet = (SamplePacket4 *) buffer;
         uint size = sizeof(SamplePacket4) + packet->stringLen;

         if(count >= size)
         {

            portssetup.recvString.contents = packet->string; //recvString in portssetup 
   
            return size;
         }
         
      }

      return 0;
   }
    /*  bool ()
      {
         String string = portssetup.sentString.contents;  //sentString  in portssetup 
         int len = strlen(string);
         int size = sizeof(SamplePacket4) + len;
         SamplePacket4 * packet = (SamplePacket4 *)new byte[size];
         packet->stringLen = len;
         memcpy(packet->string, string, len+1);
         (socket4).Send(packet, size);

         delete packet;
         return true;
      }   */
>>>>>>> 749a344b817a69a214c7e9806ccc6ed60d826046
}

MySocket4 socket4 {};