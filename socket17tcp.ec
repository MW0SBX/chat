import "ecere"
import "mainpanel"
import "ports-setup"

define samplePort = (atoi(portssetup.editBox1.contents));

struct SamplePacket
{
   int stringLen;
   char string[1];   
};

class SampleService : Service
{

    void OnAccept()
    {
    //   SampleSocket { this };
       thissocket = SampleSocket { this };
    }
}

class SampleSocket : Socket
{
   void OnConnect() 
   {
      mainpanel.picture70.visible = true;
      thissocket = this;
      
   }

   unsigned int OnReceive(unsigned char * buffer, unsigned int count)
   {

      if(count >= sizeof(SamplePacket))
      {
         SamplePacket * packet = (SamplePacket *) buffer;
         uint size = sizeof(SamplePacket) + packet->stringLen;

         if(count >= size)
         {
            chatFile.Puts (packet->string);
             
            return size;
         }
         
      }

      return 0;
   }
}

SampleService service { port = samplePort };
SampleSocket thissocket;
SampleSocket connectSocket { };
