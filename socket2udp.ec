import "ecere"
import "mainpanel"


define samplePort2 = (atoi(portssetup.editBox6.contents));

struct SamplePacket2
{
   int stringLen;
   char string[1];   
};

class MySocket2 : Socket
{
   void OnConnect() 
   {
       mainpanel.picture50.visible = true; 
   }

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {

      if(count >= sizeof(SamplePacket2))
      {
         SamplePacket2 * packet = (SamplePacket2 *) buffer;
         uint size = sizeof(SamplePacket2) + packet->stringLen;

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
         int size = sizeof(SamplePacket2) + len;
         SamplePacket2 * packet = (SamplePacket2 *)new byte[size];
         packet->stringLen = len;
         memcpy(packet->string, string, len+1);
         (socket2).Send(packet, size);

         delete packet;
         return true;
      }  
}

MySocket2 socket2 {};