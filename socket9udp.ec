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
   void OnConnect() 
   {
       mainpanel.picture57.visible = true; 
   }

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
      bool ()
      {
         String string = portssetup.sentString.contents;  //sentString  in portssetup 
         int len = strlen(string);
         int size = sizeof(SamplePacket9) + len;
         SamplePacket9 * packet = (SamplePacket9 *)new byte[size];
         packet->stringLen = len;
         memcpy(packet->string, string, len+1);
         (socket9).Send(packet, size);

         delete packet;
         return true;
      }  
}

MySocket9 socket9 {};