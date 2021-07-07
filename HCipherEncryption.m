format rat
n = 3;
m = 3;
key = ones(n,m);

disp('ENTER YOUR KEY')

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
     disp(key)

 
       
    %receives message from user
    mssg = input("What message would you like to encrypt? ",'s');
    mssg = double(mssg)-97;
   
    
    %message converted to integers    
    msgSize = size(mssg);
    mssgLength = msgSize(2);
    for i=1:mssgLength
        if mssg(i)<0
            mssg(i)=mssg(i)+32;
        end
    end
    

    Loc = 0;
    encVectors={};
    %Appends Vector CellArray with vectors
    
    for i=1:mssgLength/n
        encVectors{1,i}=key*[mssg(Loc*3+1);mssg(Loc*3+2);mssg(Loc*3+3)];
        Loc = Loc + 1;
    end
    
    %Convert finalized CellArray to Matrix
    encVectors = cell2mat(encVectors);
    
    %Converts matrix numbers back into letters
    encVectors = char(mod(encVectors,26)+97);
    encMssg = "";
    for col=1:mssgLength/n
        for row=1:n
            encMssg = strcat(encMssg,encVectors(row,col));
        end
    end
    
    disp('MESSAGE ENCRYPTED:')
    disp(encMssg)


   





