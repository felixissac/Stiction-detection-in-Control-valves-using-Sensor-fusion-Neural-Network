function correct_prediction = centernorm_testnonstiction(trainednet)

load('isdb10.mat')
loops_bas = [1; 2; 3; 8];
loops_chem = [3; 13; 14; 15; 16; 17; 21; 27; 33; 34; 36; 37; 38; 39; 40; 44; 45; 46; 47; 48; 52; 53; 54; 56; 58; 59; 61; 62 ];
loops_met = [1; 2; 3];
%loops_min = [1];
loops_pap = [4; 6; 7; 8; 9];
loops_power = [3; 5];

process = ["buildings", "chemicals", "metals","pulpPapers", "power"];
size_i = size(loops_bas,1) + size(loops_chem,1) + size(loops_met,1) + size(loops_pap,1) + size(loops_power,1);
count = 1;
result = zeros(size_i,2);
for i = 1:size(process,2)
    if i == 1     %%BUILDING
        
        for j=1:size(loops_bas,1)
            OP_value = normalize((cdata.(process(i)).("loop"+loops_bas(j)).OP(1:500,:)),'center');
            PV_value = normalize((cdata.(process(i)).("loop"+loops_bas(j)).PV(1:500,:)),'center');
            newinput = dvalue(OP_value,PV_value);
            output = sim(trainednet, newinput);
            result(count,1) = output(1);
            result(count,2) = output(2);
            count = count + 1;
        end
    end
    
     if i == 2    %%CHEMICALS
        
        for j=1:size(loops_chem,1)
            OP_value = normalize((cdata.(process(i)).("loop"+loops_chem(j)).OP(1:500,:)),'center');
            PV_value = normalize((cdata.(process(i)).("loop"+loops_chem(j)).PV(1:500,:)),'center');
            newinput = dvalue(OP_value,PV_value);
            output = sim(trainednet, newinput);
            result(count,1) = output(1);
            result(count,2) = output(2);
            count = count + 1;
        end
     end
    
    
     
    
      if i == 3  %METALS
        
        for j=1:size(loops_met,1)
            OP_value = normalize((cdata.(process(i)).("loop"+loops_met(j)).OP(1:500,:)),'center');
            PV_value = normalize((cdata.(process(i)).("loop"+loops_met(j)).PV(1:500,:)),'center');
            newinput = dvalue(OP_value,PV_value);
            output = sim(trainednet, newinput);
            result(count,1) = output(1);
            result(count,2) = output(2);
            count = count + 1;
        end
      end
     
     
      if i == 4    %PULPAPER
        
        for j=1:size(loops_pap,1)
            OP_value = normalize((cdata.(process(i)).("loop"+loops_pap(j)).OP(1:500,:)),'center');
            PV_value = normalize((cdata.(process(i)).("loop"+loops_pap(j)).PV(1:500,:)),'center');
            newinput = dvalue(OP_value,PV_value);
            output = sim(trainednet, newinput);
            result(count,1) = output(1);
            result(count,2) = output(2);
            count = count + 1;
        end
        
      end
      
      
      
      if i == 5    %POWER
        
        for j=1:size(loops_power,1)
            OP_value = normalize((cdata.(process(i)).("loop"+loops_power(j)).OP(1:500,:)),'center');
            PV_value = normalize((cdata.(process(i)).("loop"+loops_power(j)).PV(1:500,:)),'center');
            newinput = dvalue(OP_value,PV_value);
            output = sim(trainednet, newinput);
            result(count,1) = output(1);
            result(count,2) = output(2);
            count = count + 1;
        end
    end
                 
end
%%

actual_result = zeros(size_i,1);
check_vector = zeros(size(result,1),1);
for i = 1:size(check_vector,1) %Creating the check_vector
    if result(i,1) > 0.55
        check_vector(i,1) = 1;
    elseif result(i,1) < 0.45
        check_vector(i,1) = 0;
    else 
        check_vector(i,1) = 2;
    end
end

correct_prediction = 0;
predict_vector = string(zeros(size(result,1),1));
for i = 1:size(check_vector,1)
    
    if check_vector(i,1) == actual_result(i,1)
        predict_vector(i,1) = "Correct";
        correct_prediction = correct_prediction + 1;
    elseif check_vector(i,1) == 2
        predict_vector(i,1) = "Uncertain";
    else 
        predict_vector(i,1) = "Wrong";
    end

end

%fprintf('\nCorrect number of prediction are: %f', correct_prediction)
final_result = [result predict_vector actual_result check_vector];
correct_prediction;
%fprintf('Done')
end




%%
%Function 
function p = dvalue(op,pv)
    
    p = size(op);
    sop = size(op,1);
    spv = size(pv,1);
    
    mop = (1/sop)*mean(op);
    mpv = (1/spv)*mean(pv);
    
    p = (((op - mop).^2 + (pv - mpv).^2).^(1/2));
end

