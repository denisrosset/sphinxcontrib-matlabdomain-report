classdef IndexedFamily < replab.IndexedFamily
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+lambda.IndexedFamily.IndexedFamily` -- 
%    - `~+replab.+lambda.IndexedFamily.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+lambda.IndexedFamily.at` -- Retrieves a element by position
%    - `~+replab.+lambda.IndexedFamily.atFun` -- Handle that implements IndexedFamily.at
%    - `~+replab.+lambda.IndexedFamily.disp` -- 
%    - `~+replab.+lambda.IndexedFamily.eq` -- Equality test
%    - `~+replab.+lambda.IndexedFamily.find` -- Returns the index of a given element
%    - `~+replab.+lambda.IndexedFamily.findFun` -- Handle that implements IndexedFamily.find
%    - `~+replab.+lambda.IndexedFamily.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+lambda.IndexedFamily.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+lambda.IndexedFamily.lambda` -- Constructs an indexed family from function handles
%    - `~+replab.+lambda.IndexedFamily.longStr` -- Multi-line description of the current object
%    - `~+replab.+lambda.IndexedFamily.sample` -- Returns an element sampled uniformly
%    - `~+replab.+lambda.IndexedFamily.shortStr` -- Single line text description of the current object
%    - `~+replab.+lambda.IndexedFamily.size` -- vpi: Number of elements contained in this enumerator
%    - `~+replab.+lambda.IndexedFamily.toCell` -- Returns a row cell array containing all elements of this family
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
%    .. method:: lambda
%
%       Documentation in :meth:`+replab.IndexedFamily.lambda`
%
%    .. method:: longStr
%
%       Documentation in :meth:`+replab.Str.longStr`
%
%    .. method:: sample
%
%       Documentation in :meth:`+replab.IndexedFamily.sample`
%
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
%    .. attribute:: size
%
%       Documentation in :attr:`+replab.IndexedFamily.size`
%
%    .. method:: toCell
%
%       Documentation in :meth:`+replab.IndexedFamily.toCell`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    properties (SetAccess = protected)
        atFun % Handle that implements IndexedFamily.at
        findFun % Handle that implements IndexedFamily.find
    end
    
    methods
        
        function self = IndexedFamily(size, atFun, findFun)
            if isa(size, 'vpi')
                self.size = size;
            else
                self.size = vpi(size);
            end
            self.atFun = atFun;
            self.findFun = findFun;            
        end
        
        function names = hiddenFields(self)
            names = replab.str.uniqueNames( ...
                hiddenFields@replab.IndexedFamily(self), ...
                {'atFun' 'sampleFun'} ...
                );
        end
        
        function obj = at(self, ind)
            obj = self.atFun(vpi(ind));
        end
        
        function ind = find(self, obj)
            ind = self.findFun(obj);
        end
        
    end
    
end
