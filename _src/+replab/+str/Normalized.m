classdef Normalized < replab.Str
% Represents a vector along with a normalization factor for pretty printing
%
% The vector value is ``vec * factor``, except that `factor` is already represented by a string
% to be concatenated with the vector string representation
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+str.Normalized.Normalized` -- 
%    - `~+replab.+str.Normalized.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+str.Normalized.disp` -- 
%    - `~+replab.+str.Normalized.eq` -- Equality test
%    - `~+replab.+str.Normalized.factor` -- char: String description of the normalization factor
%    - `~+replab.+str.Normalized.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+str.Normalized.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+str.Normalized.longStr` -- Multi-line description of the current object
%    - `~+replab.+str.Normalized.shortStr` -- Single line text description of the current object
%    - `~+replab.+str.Normalized.vec` -- double row vector: Vector to print
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: additionalFields
%
%       Documentation in :meth:`+replab.Str.additionalFields`
%
%    .. method:: disp
%
%       No documentation
%
%    .. method:: eq
%
%       Documentation in :meth:`+replab.Str.eq`
%
%    .. method:: headerStr
%
%       Documentation in :meth:`+replab.Str.headerStr`
%
%    .. method:: hiddenFields
%
%       Documentation in :meth:`+replab.Str.hiddenFields`
%
%    .. method:: longStr
%
%       Documentation in :meth:`+replab.Str.longStr`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    properties (SetAccess = protected)
        vec % double row vector: Vector to print
        factor % char: String description of the normalization factor
    end
    
    methods
        
        function self = Normalized(vec, factor)
            assert(isa(factor, 'char'), 'Factor must be  a string');
            self.vec = vec;
            self.factor = factor;
        end
        
        function s = shortStr(self, maxColumns)
            maxL = maxColumns - length(self.factor);
            vecStr = replab.shortStr(self.vec, maxL);
            s = [vecStr self.factor];
        end
        
    end
    
end
