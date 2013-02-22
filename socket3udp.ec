import "ecere"
import "mainpanel"


define samplePort3 = (atoi(portssetup.editBox7.contents));

struct SamplePacket3
{
   int stringLen;
   char string[1];   
};

class MySocket3 : Socket
{
   void OnConnect() 
   {
       mainpanel.picture51.visible = true; 
   }

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {

      if(count >= sizeof(SamplePacket3))
      {
         SamplePacket3 * packet = (SamplePacket3 *) buffer;
         uint size = sizeof(SamplePacket3) + packet->stringLen;

         if(count >= size)
         {

            portssetup.recvString.contents = packet->string; //recvString in portssetup 
   
            return size;
         }
         
      }

      return 0;
   }
      bool ()
      {
         String string = portssetup.sentString.contents;  //sentString  in portssetup 
         int len = strlen(string);
         int size = sizeof(SamplePacket3) + len;
         SamplePacket3 * packet = (SamplePacket3 *)new byte[size];
         packet->stringLen = len;
         memcpy(packet->string, string, len+1);
         (socket3).Send(packet, size);

         delete packet;
         return true;
      }  
}

MySocket3 socket3 {};