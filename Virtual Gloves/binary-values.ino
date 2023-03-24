int fsrPin = 0
// the FSR and 10K pulldown are connected to a0
int fsrReading
const int motorpin = 7 const int flexPin = A1
void setup() {
    // put your setup code here, to run once: Serial.begin(9600)
    pinMode(7, OUTPUT)
}
void loop() {
    // put your main code here, to run repeatedly:
    int flexValue
        flexValue = analogRead(flexPin) fsrReading = analogRead(fsrPin) / *Serial.print("Sensors:\n") Serial.print("FSR:\n") Serial.print(fsrReading) Serial.print("\n")
        Serial.print("Flex:\n") Serial.print(flexValue) Serial.print("\n")
        * /
        if (flexValue < 790 & &fsrReading > 0) {
            Serial.print("Binary 1\n") digitalWrite(motorpin, HIGH) delay(150)
        }
    if (flexValue > 810 & &fsrReading > 0) {
        Serial.print("Binary 0\n") digitalWrite(motorpin, HIGH) delay(150)
    }
    delay(200)
}