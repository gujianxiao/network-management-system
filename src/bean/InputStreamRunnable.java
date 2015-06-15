package bean;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

class InputStreamRunnable implements Runnable  
{  
   BufferedReader bReader=null;  
   String type=null;  
   public InputStreamRunnable(InputStream is, String _type)  
   {  
       try  
       {  
           bReader=new BufferedReader(new InputStreamReader(new BufferedInputStream(is),"UTF-8"));  
           type=_type;  
       }  
       catch(Exception ex)  
       {  
       }  
   }  
   public void run()  
   {  
       String line;  
       int lineNum=0;  
       StringBuilder sb=new StringBuilder();
       String initiateinfo;
 
       try  
       {  
           while((line=bReader.readLine())!=null)  
           {  
               lineNum++; 
               sb.append(line);  
               sb.append("/n");  

               //Thread.sleep(200);  
           }  
           initiateinfo=sb.toString();
           System.out.println(initiateinfo);
       }  
       catch(Exception ex)  
      {  
      }  
  }  
} 
