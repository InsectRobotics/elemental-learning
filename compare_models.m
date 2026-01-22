% Script for comparing stimulus representations, learning rules and paradigms

% N.B. using plot8, first half should be commented out because the representation,
% rule and salience are being set by the script 'plot8' that cycles through
% all possible variations and calls this script to run the paradigms.

% First choose one representation by uncommenting one of the following
% Each is a script defining A,B,AB etc. as vectors and also defines a
% vector of start values before learning (normally all 0)

% elements
% unique_cue
% configural
% pearce
% overlap
% context

% Next line is just used to corresponding create graph title
% Change to match the script being used above

% representation='unique-cue';

% Second, choose the learning rule from: 
%   'basic' - this changes values of elements independently of each other
%   'basic-pos' - this is like basic but with a decay 
%   'rw' - this uses the Rescorla-Wagner learning rule
%   'template' - this uses the rule defined by Balkenius et al (2008)
%   'neuromod' - this is simple equivalent of the Izhikevich algorithm
% See file learn.m for the definition of each

% rule='neuromod';

% Specify if learning and test include 'saliency' adjustment for multiple
% cues.
% If = 0, no adjustment is made. If salient is set to non-zero, then the 
% learning increment is divided by the number of elements in the CS,
% and the CR (the sum of values for test stimuli) is similarly adjusted.

% salient = 0; 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Specify which paradigms to run and collect results
%
% Arguments are: the value vector at the start of learning;
%                the conditioned stimuli (CS)
%                the corresponding unconditioned stimuli values (US)
%                the learning rule (specified above)
%                the use (or not) of saliency (specified above)
%                the number of repeated presentations for each row of the CS
%                the number of cycles through all CS-US pairings
%                the stimuli presented in the test to choose between
% Note that the result (or conditioned response) is taken to be the difference 
% in the sum of values for the first vs. the second alternative in the choice test 


[elemental,el_cr]= paradigm(start,[A;B],[1;0],rule,salient,3,1,[A;B]);
% next is testing can learn two things at once
[double,db_cr]= paradigm(start,[A;B;C],[1;1;0],rule,salient,3,1,[A;C]);
[double2,db2_cr]= paradigm(start,[A;B;C],[1;1;0],rule,salient,3,1,[B;C]);

% next is an extinction paradigm, not used on flies, to see what models do
[equal,eq_cr]= paradigm(start,[A;A],[1;0],rule,salient,9,1,[A;B]);

[mixture,mix_cr]= paradigm(start,[AB;CD],[1;0],rule,salient,3,2,[AB;CD]);

[discrimination,disc_cr]= paradigm(start,[AB;BC],[1;0],rule,salient,3,2,[AB;BC]);

[negative,neg_cr]= paradigm(start,[A;B;AB],[1;1;0],rule,salient,3,3,[A;AB]);
% next line is so can calculate final score using both A and B as
% alternatives - they can be different due to order of learning.
[negative2,neg2_cr]= paradigm(start,[A;B;AB],[1;1;0],rule,salient,3,3,[B;AB]);

[positive,pos_cr]= paradigm(start,[AB;A;B],[1;0;0],rule,salient,3,3,[AB;A]);
[positive2,pos2_cr]= paradigm(start,[AB;A;B],[1;0;0],rule,salient,3,3,[AB;B]);

[biconditional,bic_cr]= paradigm(start,[AB;CD;AC;BD],[1;1;0;0],rule,salient,3,3,[AB;AC]);
[biconditional2,bic2_cr]= paradigm(start,[AB;CD;AC;BD],[1;1;0;0],rule,salient,3,3,[AB;BD]);
[biconditional3,bic3_cr]= paradigm(start,[AB;CD;AC;BD],[1;1;0;0],rule,salient,3,3,[CD;AC]);
[biconditional4,bic4_cr]= paradigm(start,[AB;CD;AC;BD],[1;1;0;0],rule,salient,3,3,[CD;BD]);
[biconditionala,bica_cr]= paradigm(start,[AC;BD;AB;CD],[1;1;0;0],rule,salient,3,3,[AC;AB]);
[biconditional2a,bic2a_cr]= paradigm(start,[AC;BD;AB;CD],[1;1;0;0],rule,salient,3,3,[BD;AB]);
[biconditional3a,bic3a_cr]= paradigm(start,[AC;BD;AB;CD],[1;1;0;0],rule,salient,3,3,[AC;CD]);
[biconditional4a,bic4a_cr]= paradigm(start,[AC;BD;AB;CD],[1;1;0;0],rule,salient,3,3,[BD;CD]);

[blocking,block_cr]=paradigm(start,[A;AB],[1;1],rule,salient,3,1,[B;C]);

%[blocking_control,cont_cr]= paradigm(start,[AB],[1],rule,salient,3,1,[B;C]);
[blocking_control,cont_cr]= paradigm(start,[D;AB],[1;1],rule,salient,3,1,[B;C]);

[precondition,pre_cr]=paradigm(start,[AB; A],[0; 1],rule,salient,3,1,[B;C]);


% Plot the results

% Pick out final result, corresponding to the fly data
final=[el_cr(size(el_cr,1)), ...
    (db_cr(size(db_cr,1))+db_cr(size(db_cr,1)))./2, ...
    mix_cr(size(mix_cr,1)), ...
    disc_cr(size(disc_cr,1)), ...
    (pos_cr(size(pos_cr,1))+pos2_cr(size(pos_cr,1)))./2, ...
    (neg_cr(size(neg_cr,1)) + neg2_cr(size(neg2_cr,1)))./2, ...
    (bic_cr(size(bic_cr,1))+bic2_cr(size(bic_cr,1))+bic3_cr(size(bic_cr,1))+bic4_cr(size(bic_cr,1))+bica_cr(size(bic_cr,1))+bic2a_cr(size(bic_cr,1))+bic3a_cr(size(bic_cr,1))+bic4a_cr(size(bic_cr,1)) )./8, ...
    block_cr(size(block_cr,1)), ...
    cont_cr(size(cont_cr,1)), ...
    pre_cr(size(pre_cr,1))]

 plot([1:10],final,'o')
 axis([0 11 min(min(final)-.02,-.2) max(final)+.02])
 set(gca,'XTick',[1:10])
  set(gca,'XTickLabel','E|T|M|D|P|N|Bi|Bl|C|Pc')
 % set(gca,'XTickLabel','||||||||')
 title([representation,', learn=',rule,', salience=',num2str(salient)'])
 hold
 plot([0:11],zeros(12),'r:')
 hold
