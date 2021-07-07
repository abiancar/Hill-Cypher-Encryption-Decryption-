format rat
n = 3;
m = 3;
key = ones(n,m);


disp('ENTER YOUR ENCRYPTION KEY')

     %converts the key into numbers
     for i=1:n
         for j=1:m
             tmp = input('What should the next entry be? ','s');
             if tmp <97 
                 tmp = tmp + 32;
             end
             key(i,j)= tmp;
         end
     end
     key = key - 97; 
     %key is now in numerical form
    
     invKey = key^-1;
     
     %finding denominator of Key inverse
     [N,D] = numden(sym(invKey(1,1)));
     D = double(D);
     invKey = double(invKey);
     
     %tests all numbers between 1 and 26 to find a 'n' that satisfies 
     %1/a = n mod (b) , given a and b
     
     guess = 0;
     for i=0:26
         while mod((1243 * guess),26)~=1;
         guess = guess + 1;
         end
         
     end
     modinvK = guess;
     
     %transforming inverse into modular inverse
     invKey = invKey*D*modinvK;
     
       
    %receives message from user
    mssg = input("What message would you like to decrypt? ",'s');
    mssg = double(mssg)-97;
    %message converted to integers    
    msgSize = size(mssg);
    mssgLength = msgSize(2);
    for i=1:mssgLength
        if mssg(i)<0
            mssg(i)=mssg(i)+32;
        end
    end
    
    %using counter to facilitate indexing vectors
    Loc = 0;
    encVectors={};
    
    
    %Adds encrypted vectors to Vector CellArray and multiplies them by 
    % the key inverse
    for i=1:mssgLength/n
        encVectors{1,i}=invKey*[mssg(Loc*3+1);mssg(Loc*3+2);mssg(Loc*3+3)]
        Loc = Loc + 1;
    end
    
    %Convert finalized CellArray to Matrix
    encVectors = cell2mat(encVectors);
    
    %Converting numerical elements of Matrix back into Latin Characters
    encVectors = char(mod(int16(encVectors),26)+97);
    encMssg = "";
    for col=1:mssgLength/n
        for row=1:n
            encMssg = strcat(encMssg,encVectors(row,col));
        end
    end
    disp("YOUR SECRET MESSAGE IS:")
    disp(encMssg)

    

   


