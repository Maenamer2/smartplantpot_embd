
_main:

;G2_project.c,32 :: 		void main() {
;G2_project.c,33 :: 		Lcd_init();
	CALL       _Lcd_Init+0
;G2_project.c,34 :: 		myDelay() ;
	CALL       _myDelay+0
;G2_project.c,35 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;G2_project.c,36 :: 		myDelay();
	CALL       _myDelay+0
;G2_project.c,37 :: 		AID_INT();
	CALL       _AID_INT+0
;G2_project.c,38 :: 		myDelay();
	CALL       _myDelay+0
;G2_project.c,39 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;G2_project.c,40 :: 		TRISC=0X00;
	CLRF       TRISC+0
;G2_project.c,41 :: 		CCPWM_init();
	CALL       _CCPWM_init+0
;G2_project.c,42 :: 		while(1){
L_main0:
;G2_project.c,43 :: 		water_level();
	CALL       _water_level+0
;G2_project.c,44 :: 		t=((AID_read2()*500)/1023);
	CALL       _AID_read2+0
	MOVLW      244
	MOVWF      R4+0
	MOVLW      1
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      _t+0
	MOVF       R0+1, 0
	MOVWF      _t+1
;G2_project.c,45 :: 		inttostr(t,lmr1);
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _lmr1+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;G2_project.c,47 :: 		if(t >25 && t <30){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _t+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main17
	MOVF       _t+0, 0
	SUBLW      25
L__main17:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
	MOVLW      128
	XORWF      _t+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main18
	MOVLW      30
	SUBWF      _t+0, 0
L__main18:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
L__main15:
;G2_project.c,49 :: 		LCD_out(1,1,"TEMP=  ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_G2_project+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;G2_project.c,50 :: 		LCD_out(1,10,lmr1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _lmr1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;G2_project.c,51 :: 		myDelay();
	CALL       _myDelay+0
;G2_project.c,52 :: 		fan(250);
	MOVLW      250
	MOVWF      FARG_fan_p1+0
	CLRF       FARG_fan_p1+1
	CALL       _fan+0
;G2_project.c,53 :: 		PORTB=PORTB|0X04;
	BSF        PORTB+0, 2
;G2_project.c,54 :: 		PORTB=PORTB&0XF7;}
	MOVLW      247
	ANDWF      PORTB+0, 1
L_main4:
;G2_project.c,57 :: 		if(t <25){
	MOVLW      128
	XORWF      _t+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVLW      25
	SUBWF      _t+0, 0
L__main19:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;G2_project.c,59 :: 		PORTB=PORTB|0X04;
	BSF        PORTB+0, 2
;G2_project.c,60 :: 		PORTB=PORTB&0XF7;
	MOVLW      247
	ANDWF      PORTB+0, 1
;G2_project.c,61 :: 		LCD_out(1,1,"TEMP=  ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_G2_project+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;G2_project.c,62 :: 		LCD_out(1,10,lmr1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _lmr1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;G2_project.c,63 :: 		myDelay();
	CALL       _myDelay+0
;G2_project.c,64 :: 		fan(125);
	MOVLW      125
	MOVWF      FARG_fan_p1+0
	MOVLW      0
	MOVWF      FARG_fan_p1+1
	CALL       _fan+0
;G2_project.c,65 :: 		}
L_main5:
;G2_project.c,66 :: 		water_level();
	CALL       _water_level+0
;G2_project.c,67 :: 		}
	GOTO       L_main0
;G2_project.c,69 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_AID_read2:

;G2_project.c,72 :: 		unsigned int AID_read2(void){   //CHANNEL 1
;G2_project.c,74 :: 		ADCON0=ADCON0|0X04;
	BSF        ADCON0+0, 2
;G2_project.c,75 :: 		while(ADCON0 & 0X04);
L_AID_read26:
	BTFSS      ADCON0+0, 2
	GOTO       L_AID_read27
	GOTO       L_AID_read26
L_AID_read27:
;G2_project.c,76 :: 		return (ADRESH<<8) | ADRESL  ;
	MOVF       ADRESH+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       ADRESL+0, 0
	IORWF      R0+0, 1
	MOVLW      0
	IORWF      R0+1, 1
;G2_project.c,78 :: 		}
L_end_AID_read2:
	RETURN
; end of _AID_read2

_AID_INT:

;G2_project.c,79 :: 		void AID_INT(void){
;G2_project.c,80 :: 		ADCON0=0X41;
	MOVLW      65
	MOVWF      ADCON0+0
;G2_project.c,81 :: 		ADCON1=0XCE;
	MOVLW      206
	MOVWF      ADCON1+0
;G2_project.c,82 :: 		TRISA=0XFF;}
	MOVLW      255
	MOVWF      TRISA+0
L_end_AID_INT:
	RETURN
; end of _AID_INT

_CCPWM_init:

;G2_project.c,84 :: 		void CCPWM_init( void){
;G2_project.c,85 :: 		TRISC=0X00;
	CLRF       TRISC+0
;G2_project.c,86 :: 		T2CON = 0x07; //1:5 postscale, TMR2 on, 16 prescaler
	MOVLW      7
	MOVWF      T2CON+0
;G2_project.c,88 :: 		CCP2CON = 0x0C; //PWM mode
	MOVLW      12
	MOVWF      CCP2CON+0
;G2_project.c,89 :: 		PR2 = 250;//end value set to 250
	MOVLW      250
	MOVWF      PR2+0
;G2_project.c,91 :: 		CCPR2L= 125;
	MOVLW      125
	MOVWF      CCPR2L+0
;G2_project.c,92 :: 		}
L_end_CCPWM_init:
	RETURN
; end of _CCPWM_init

_fan:

;G2_project.c,93 :: 		void fan(unsigned int p1){
;G2_project.c,94 :: 		CCPR1L=p1;
	MOVF       FARG_fan_p1+0, 0
	MOVWF      CCPR1L+0
;G2_project.c,95 :: 		}
L_end_fan:
	RETURN
; end of _fan

_water_level:

;G2_project.c,98 :: 		void water_level(){//for measuring the water level
;G2_project.c,100 :: 		if (PORTB=PORTB&0X01)
	MOVLW      1
	ANDWF      PORTB+0, 1
	MOVF       PORTB+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_water_level8
;G2_project.c,101 :: 		PORTB=PORTB|0X80;
	BSF        PORTB+0, 7
L_water_level8:
;G2_project.c,102 :: 		}
L_end_water_level:
	RETURN
; end of _water_level

_myDelay:

;G2_project.c,104 :: 		void myDelay(void){
;G2_project.c,106 :: 		for(k=0;k<40;k++){
	CLRF       _k+0
	CLRF       _k+1
L_myDelay9:
	MOVLW      0
	SUBWF      _k+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__myDelay26
	MOVLW      40
	SUBWF      _k+0, 0
L__myDelay26:
	BTFSC      STATUS+0, 0
	GOTO       L_myDelay10
;G2_project.c,108 :: 		for(j=0;j<2000;j++){
	CLRF       _j+0
	CLRF       _j+1
L_myDelay12:
	MOVLW      7
	SUBWF      _j+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__myDelay27
	MOVLW      208
	SUBWF      _j+0, 0
L__myDelay27:
	BTFSC      STATUS+0, 0
	GOTO       L_myDelay13
;G2_project.c,109 :: 		k=k;
;G2_project.c,110 :: 		j=j;
;G2_project.c,108 :: 		for(j=0;j<2000;j++){
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;G2_project.c,111 :: 		}
	GOTO       L_myDelay12
L_myDelay13:
;G2_project.c,106 :: 		for(k=0;k<40;k++){
	INCF       _k+0, 1
	BTFSC      STATUS+0, 2
	INCF       _k+1, 1
;G2_project.c,112 :: 		}
	GOTO       L_myDelay9
L_myDelay10:
;G2_project.c,113 :: 		}
L_end_myDelay:
	RETURN
; end of _myDelay
