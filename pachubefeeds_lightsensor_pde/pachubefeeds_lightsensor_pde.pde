import processing.serial.*;
import cc.arduino.*;
import eeml.*;

Arduino arduino;
float myValue;
float lastUpdate;

DataOut dOut;

void setup()
{
println(Arduino.list());
arduino = new Arduino(this, Arduino.list()[0], 57600);

dOut = new DataOut(this, "http://www.pachube.com/api/35483.xml", "4Xt4EbyHzKpoNj1w1fxsTEelWDPbBD6sGdVG2Tjj0iY"); 

dOut.addData(0,"light sensor");
dOut.addData(1,"timer");

}

void draw()
{
myValue = arduino.analogRead(0);
//println(myValue);   
if ((millis() - lastUpdate) > 10000){ 
       println(myValue);
       println("ready to PUT: ");      
       dOut.update(0, myValue);
       dOut.update(1,millis());
       int response = dOut.updatePachube();
       println(response);
       lastUpdate = millis();
      delay(300000);
    }   
  

}

