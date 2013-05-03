int ledPin = 10;    // LED connected to digital pin 10
int x, z;
int n;

void setup()  { 
  Serial.begin(9600);      // sets the serial port to 9600
  // nothing happens in setup 
} 

void loop()  { 
  
  z = analogRead(1);       // read analog input pin 1
  if (z > 282) {
    n = n + (z-282)/3;
    if (n>255) n = 255;
  } else{
    n = n - (282-z)/3;
    if (n < 0) n = 0;
  }
  
  x = analogRead(0);       // read analog input pin 0
  if (x > 282) {
    n = n - (x-282)/3; 
    if (n < 0) n = 0;
  } else{
    n = n + (282-x)/3;
    if (n>255) n = 255;
  }
  
  analogWrite(ledPin, n);
  analogWrite(9, n);
  delay(100);
  //readSensor();
}

void readSensor() 
{
  x = analogRead(0);       // read analog input pin 0
  z = analogRead(1);       // read analog input pin 1
  Serial.print("rotational rates are x, z: ");
  Serial.print(x, DEC);    // print the rotational rate in the X axis
  Serial.print(" ");       // prints a space between the numbers
  Serial.println(z, DEC);  // print the rotational rate in the Z axis
  delay(100);              // wait 100ms for next reading
}
