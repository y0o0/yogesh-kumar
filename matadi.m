
  
    
  for k=1:5
     disp(k);
 
 s=serial('COM1','BaudRate',9600);
   
  for n=1:.1:2000
    for m=1:.01:2000
    end  
  end
  
  
  disp('ruk');
  
  fopen(s);
     

     
    for p=1:.1:2000
    for q=1:.01:200
    end
end


disp('press');
   
  
fprintf('press');
  for d=1:.1:2000
    for f=1:.01:200
    end
  end 
   
   a=fgets(s)
   
   b=a+1;
   
   c=b(1,1)+b(1,2)+b(1,3);
   d=c-74;
   
   
     
if(d==1)
     
     disp('PIR SENSOR 1 ACTIVE ');
   iiii;
  
     for p=1:.1:2000
    for q=1:.01:200
    end
end

   close all;
   clear all;
   clc
  
        
 elseif(d==2)
      disp('PIRSENSOR 2 ACTIVE');
     iiii;
     for p=1:.1:2000
    for q=1:.01:200
    end
end

     close all;
     clear all;
     clc
  
        
     elseif(d==3)
      disp('PIRSENSOR 3 ACTIVE');
     iiii;
     for p=1:.1:2000
    for q=1:.01:200
    end
end

     close all;
     clear all;
     clc
  
   
      
        elseif(d==4)
      
            disp('PIR SENSOR 4 ACTIVE');
       
  iiii;
  for p=1:.1:2000
    for q=1:.01:200
    end
end

  close all;
  clear all;
  clc
  
elseif(d==0)
     
    disp('please try again');
    
       close all;
       clear all;
       clc;

end


end

 close all;
 clc;
 clear all;
 
 