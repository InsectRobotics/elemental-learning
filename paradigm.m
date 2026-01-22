function [ paradigm,result ] = paradigm(values, CS, US, rule, salient, repeats, cycles, test)
%PARADIGM Using the CS - US pairs specified, applies learning rule
%   Each pair is presented for the number of repeats and the whole
%   set is presented for the number of cycles specified. The result
%   is calculated from the test specification.

learnt = values;
result = 0;

for j=1:cycles
    for i=1:size(CS,1)  % for each row in CS
        for r=1:repeats
                values=learn(CS(i,:),US(i),values,rule,salient);
                learnt = [learnt; values];
        end
    end 
end
paradigm = learnt;
for k=2:size(learnt,1) % result of test 1 against 2 after each change in learnt values
    pref = learnt(k,:).*test(1,:);
    alt = learnt(k,:).*test(2,:);
    if salient 
        pref=pref./sum(test(1,:));
        alt=alt./sum(test(2,:));
    end  
    % result = [result; sum(pref-alt)];
    % note next line enforces a maximum response size of 1 or -1
    result = [result; max(-1,min(1,sum(pref-alt)))];
end

end

