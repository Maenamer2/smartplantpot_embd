sbit LCD_RS at RD7_bit;
sbit LCD_EN at RD4_bit;
sbit LCD_D7 at RD1_bit;
sbit LCD_D6 at RD0_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD6_bit;


sbit LCD_RS_Direction at TRISD7_bit;
sbit LCD_EN_Direction at TRISD4_bit;
sbit LCD_D7_Direction at TRISD1_bit;
sbit LCD_D6_Direction at TRISD0_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD6_bit;

unsigned int AID_read2(void);
unsigned int tick2;
unsigned int cntr2;
unsigned int p1;
unsigned int p2;
void CCPWM_init(void);
int t;
unsigned int tick3;
char lmr1[5];
void AID_INT(void);
void fan(unsigned int p1);
void water_level();
void myDelay(void);
unsigned int k;
unsigned int j;

void main() {
Lcd_init();
myDelay() ;
Lcd_Cmd(_LCD_CURSOR_OFF);
myDelay();
AID_INT();
myDelay();
Lcd_Cmd(_LCD_CLEAR);
TRISC=0X00;
CCPWM_init();
while(1){
water_level();
t=((AID_read2()*500)/1023);
inttostr(t,lmr1);

if(t >25 && t <30){

  LCD_out(1,1,"TEMP=  ");
  LCD_out(1,10,lmr1);
  myDelay();
  fan(250);
  PORTB=PORTB|0X04;
  PORTB=PORTB&0XF7;}


if(t <25){

      PORTB=PORTB|0X04;
      PORTB=PORTB&0XF7;
      LCD_out(1,1,"TEMP=  ");
      LCD_out(1,10,lmr1);
      myDelay();
      fan(125);
      }
        water_level();
      }
       LCD_Cmd(_LCD_CLEAR);
       }
       
       
unsigned int AID_read2(void){   //CHANNEL 1

ADCON0=ADCON0|0X04;
while(ADCON0 & 0X04);
return (ADRESH<<8) | ADRESL  ;

}
 void AID_INT(void){
 ADCON0=0X41;
 ADCON1=0XCE;
 TRISA=0XFF;}

 void CCPWM_init( void){
 TRISC=0X00;
 T2CON = 0x07; //1:5 postscale, TMR2 on, 16 prescaler

 CCP2CON = 0x0C; //PWM mode
 PR2 = 250;//end value set to 250

 CCPR2L= 125;
}
void fan(unsigned int p1){
CCPR1L=p1;
}


void water_level(){//for measuring the water level

if (PORTB=PORTB&0X01)
PORTB=PORTB|0X80;
 }
 
 void myDelay(void){
  // reserve one memory location (8-bit) unsigned:0-255
  for(k=0;k<40;k++){

     for(j=0;j<2000;j++){
         k=k;
         j=j;
     }
     }
     }