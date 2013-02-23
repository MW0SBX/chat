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

<<<<<<< HEAD
  
=======
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
   /*
   
   {
      String string = portssetup.sentString.contents;  //sentString  in portssetup 
      int len = strlen(string);
      int size = sizeof(SamplePacket1) + len;
      SamplePacket1 * packet = (SamplePacket1 *)new byte[size];
      packet->stringLen = len;
      memcpy(packet->string, string, len+1);
      (socket1).Send(packet, size);

      delete packet;
      return true;
   }*/
>>>>>>> 749a344b817a69a214c7e9806ccc6ed60d826046
}

MySocket1 socket1 {};