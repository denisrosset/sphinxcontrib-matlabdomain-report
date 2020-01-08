classdef FRAGMENT_TYPE
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+lobster.FRAGMENT_TYPE.BLOCK_END` -- 
%    - `~+replab.+lobster.FRAGMENT_TYPE.BLOCK_START` -- 
%    - `~+replab.+lobster.FRAGMENT_TYPE.TEXT` -- 
%    - `~+replab.+lobster.FRAGMENT_TYPE.VAR` -- 
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
% Changed the enumeration to properties as the RepLAB code parsing does not support enumerations well
   properties (Constant)
       VAR = 1
       BLOCK_START = 2
       BLOCK_END = 3
       TEXT = 4
   end
   
end
