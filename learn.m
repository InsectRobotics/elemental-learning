function learn = learn(cond,us,values,rule,salient)
% function update rule for learning values, cond is binary coding for 
% presence of stimuli on the current trial


rate = 0.5;

salience = ones(size(cond));

% assume total salience equally divided amongst all elements in the cond.
if salient 
    if sum(cond)
        salience = salience./sum(cond);
    end
end

% alternative salience calculation such that higher value stimuli have 
% higher salience
% if salient 
%     if sum(cond)
%         salience = (salience+values)./sum(cond);
%     end
% end

increment=zeros(1,length(values));

if strcmp(rule,'basic')
    for i=1:length(cond)
        increment(i)= rate.*salience(i).*cond(i)*(us - values(i));
    end
    learn = values + increment;
end

if strcmp(rule,'template') 
   if us  % difference in update rule when reinforced
        for i=1:length(cond)
            if cond(i)
                increment(i)= rate.*salience(i).*cond(i).*(us - values(i));
            else % decay for inactive elements on reinforcement
               increment(i)=-.2;
               % increment(i)= rate.*salience(i).*(0 - values(i));
            end 
        end
%    else
%        for i=1:length(cond)
%         increment(i)= rate.*salience(i).*cond(i)*(us - values(i));
%        end
    end
        learn = values + increment;
    % change any negative weights to 0
        neg = find(learn<0);
        learn(neg)=0;
end

if strcmp(rule,'rw')
    for i=1:length(cond)
        increment(i)= rate.*salience(i).*cond(i).*(us - sum(values.*cond));
    end
    learn = values + increment;
end

% if strcmp(rule,'template')
%     if us  % update only when rewarded
%         for i=1:length(cond)
%             if cond(i)
%                 increment(i)= rate.*salience(i).*cond(i).*(us - sum((values.*cond)));
%             else
%             increment(i)=-0.2;
%             end
%         end
%         learn = values + increment;
%         % change any negative weights to 0
%         neg = find(learn<0);
%         learn(neg)=0;
%         % normalise
%         if sum(learn) % non-zero sum
%             learn=learn./sum(learn);
%         end
%     else learn = values;
%     end
% end

if strcmp(rule,'neuromod')
    increase = 0.2;  % amount of increase each time rewarded
    if us  % update only when rewarded    
        for i=1:length(cond)
            if cond(i)
                increment(i)= salience(i).*increase;
            end
        end
        learn = values + increment;
    else learn = values;
    end
end


