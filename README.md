# elemental-learning

A simple matlab model to explore associative learning.

The code corresponds to this paper: Young, J.M., Wessnitzer, J., Armstrong, J.D. and Webb, B., 2011. Elemental and non-elemental olfactory learning in Drosophila. Neurobiology of learning and memory, 96(2), pp.339-352.

To run one learning model with one representation, edit the start of the 
file "compare_models.m", as described in that file. 

The representation chosen defines vectors representing to A, B, AB etc.
The different representations are given in the scripts: 
elements.m, unique_cue.m, configural.m, pearce.m, context.m

"compare_models.m" calls on the function "paradigm.m" which runs the
specified pattern of CS-US pairings for the specified number of times
and collects the results. 

"paradigm.m" calls the function "learn.m" which runs one learning update
using the specified learning rule.
 
=================

Alternatively the file "plot8.m" runs through all representations and all 
learning rules (calling on "compare_models.m" as required)  
and plots the results in groups of 8 graphs.
