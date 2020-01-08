classdef FiniteGroupDecomposition < replab.Str
% Describes the decomposition of a finite group into a product of sets
%
% We assume the existence of sets T1, T2, ..., Tn such that every group elements has a unique decomposition
% g = t1 t2 ... tn, where ti is in Ti; thus, we have that length(T1)*length(T2)*...*length(Tn) = group order
%
% We require additionally that in each set Ti, Ti{1} is the group identity.
%
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.FiniteGroupDecomposition.FiniteGroupDecomposition` -- 
%    - `~+replab.FiniteGroupDecomposition.T` -- row cell array of row cell arrays: Stores the sets Ti as {T1 T2 ... Tn}
%    - `~+replab.FiniteGroupDecomposition.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.FiniteGroupDecomposition.disp` -- 
%    - `~+replab.FiniteGroupDecomposition.eq` -- Equality test
%    - `~+replab.FiniteGroupDecomposition.group` -- replab.FiniteGroup: Group decomposed
%    - `~+replab.FiniteGroupDecomposition.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.FiniteGroupDecomposition.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.FiniteGroupDecomposition.longStr` -- Multi-line description of the current object
%    - `~+replab.FiniteGroupDecomposition.shortStr` -- Single line text description of the current object
%    - `~+replab.FiniteGroupDecomposition.trivial` -- Constructs a group decomposition using a single set
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
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    properties (SetAccess = protected)
        group % replab.FiniteGroup: Group decomposed
        T % row cell array of row cell arrays: Stores the sets Ti as {T1 T2 ... Tn}
    end
    
    methods
        
        function self = FiniteGroupDecomposition(group, T)
            self.group = group;
            self.T = T;
        end
        
    end
    
    methods (Static)
        
        function D = trivial(group)
        % Constructs a group decomposition using a single set
        %
        % No efficiency gains are then expected.
        %
        % Args:
        %   group (replab.FiniteGroup): Finite group to decompose
            O = double(group.order);
            T = group.elements.toCell;
            idIndex = double(group.elements.find(group.identity));
            T = T([idIndex setdiff(1:O, idIndex)]);
            D = replab.FiniteGroupDecomposition(group, {T});
        end
        
    end
    
end
