import "ecere"
import "mainpanel"


define samplePort12 = (atoi(portssetup.editBox16.contents));

struct SamplePacket12
{
   int stringLen;
   char string[1];   
};

class MySocket12 : Socket
{
   void OnConnect() 
   {
       mainpanel.picture60.visible = true; 
   }

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {

      if(count >= sizeof(SamplePacket12))
      {
         SamplePacket12 * packet = (SamplePacket12 *) buffer;
         uint size = sizeof(SamplePacket12) + packet->stringLen;

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
         int size = sizeof(SamplePacket12) + len;
         SamplePacket12 * packet = (SamplePacket12 *)new byte[size];
         packet->stringLen = len;
         memcpy(packet->string, string, len+1);
         (socket12).Send(packet, size);

         delete packet;
         return true;
      }  
}

MySocket12 socket12 {};