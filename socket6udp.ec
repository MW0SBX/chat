import "ecere"
import "mainpanel"
import "ports-setup"

define samplePort6 = (atoi(portssetup.editBox10.contents));

struct SamplePacket6
{
   int stringLen;
   char string[1];   
};

class MySocket6 : Socket
{
   void OnConnect() 
   {
       mainpanel.picture54.visible = true; 
   }

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {

      if(count >= sizeof(SamplePacket6))
      {
         SamplePacket6 * packet = (SamplePacket6 *) buffer;
         uint size = sizeof(SamplePacket6) + packet->stringLen;

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
         int size = sizeof(SamplePacket6) + len;
         SamplePacket6 * packet = (SamplePacket6 *)new byte[size];
         packet->stringLen = len;
         memcpy(packet->string, string, len+1);
         (socket6).Send(packet, size);

         delete packet;
         return true;
      }  
}

MySocket6 socket6 {};