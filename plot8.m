% Script for generating graphs comparing representations, rules and
% saliency effects. 

rules = char('basic','rw','template','neuromod');
backgrounds = [1 1 .8; 1 0.9 0.8; 1 1 0.7; 0.96 .85 0.85];

% elemental
elements
representation='elemental';
figure;

for j=1:4
    rule=deblank(rules(j,:));
    for i=1:2
        subplot(4,2,2*j-2+i)
        salient = i-1;
        compare_models
        set(gca,'Color',backgrounds(j,:))
    end
end
set(gcf,'Color',[.75,.85,.69])

% unique cue
unique_cue
representation='unique cue';
figure;

for j=1:4
    rule=deblank(rules(j,:));
    for i=1:2
        subplot(4,2,2*j-2+i)
        salient = i-1;
        compare_models
        set(gca,'Color',backgrounds(j,:))
    end
end
set(gcf,'Color',[.76,1,.76])

% configural
configural
representation='configural';
figure;

for j=1:4
    rule=deblank(rules(j,:));
    for i=1:2
        subplot(4,2,2*j-2+i)
        salient = i-1;
        compare_models
        set(gca,'Color',backgrounds(j,:))
    end
end
set(gcf,'Color',[0.75,.85,.85])

% overlap
pearce
representation='pearce';
figure;

for j=1:4
    rule=deblank(rules(j,:));
    for i=1:2
        subplot(4,2,2*j-2+i)
        salient = i-1;
        compare_models
        set(gca,'Color',backgrounds(j,:))
    end
end
set(gcf,'Color',[.75,0.94,1])

% context
context
representation='context';
figure;

for j=1:4
    rule=deblank(rules(j,:));
    for i=1:2
        subplot(4,2,2*j-2+i)
        salient = i-1;
        compare_models
        set(gca,'Color',backgrounds(j,:))
    end
end
set(gcf,'Color',[0.72,0.78,.71])




