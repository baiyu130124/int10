assume cs:code,ss:stack,ds:data
  
data segment
  
data ends
 
 stack segment
          db 16 dup (0)
  stack ends

 code segment

  start: mov ax,stack
         mov ss,ax
         mov sp,16
 
         mov ax,data
         mov ds,ax

         jmp cls

  next:  mov ah,2    ;置光标  
         mov bh,0    ;第0页  
         mov dh,1    ;dh中放行号  
         mov dl,1    ;dl中放列号  
         int 10h  
  
         mov ah,9    ;在光标位置显示字符串  
         mov al,'a'  ;字符  
         mov bl,0ch  ;黑底红字  
         mov bh,0    ;第0页  
         mov cx,3    ;字符串个数  
        int 10h  





        mov ax,4c00h
        int 21h
 
 ;----------------------------------------
 cls:   mov bx,0b800h        ;显存地址 0xb800
        mov es,bx
 
         mov bx,0
         mov cx,4000           ;文本模式显示25行，80字   即80*25*2 = 4000字节
  s:     mov dl,0            ；将NULL字符，即ASCII 0 放入低位
         mov dh,0            ；将颜色 0 即 黑色 放入高位    
         mov es:[bx],dx        
         add bx,2
         loop s

        jmp next


 
 code ends
 end start