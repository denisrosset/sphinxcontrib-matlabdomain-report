classdef IrreducibleLaws < replab.Laws
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.IrreducibleLaws.IrreducibleLaws` -- 
%    - `~+replab.IrreducibleLaws.M` -- 
%    - `~+replab.IrreducibleLaws.addTestCases` -- Adds law checks as test cases to the given test suite
%    - `~+replab.IrreducibleLaws.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.IrreducibleLaws.assert` -- Assert function with a verbose error message
%    - `~+replab.IrreducibleLaws.check` -- Runs the randomized tests without using MOxUnit
%    - `~+replab.IrreducibleLaws.disp` -- 
%    - `~+replab.IrreducibleLaws.eq` -- Equality test
%    - `~+replab.IrreducibleLaws.getTestCases` -- Enumerates the laws present in "self" by looking for methods of the form law_propertyName_TYPES
%    - `~+replab.IrreducibleLaws.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.IrreducibleLaws.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.IrreducibleLaws.irreducible` -- Irreducible decomposition
%    - `~+replab.IrreducibleLaws.law_decomposes_entire_space` -- 
%    - `~+replab.IrreducibleLaws.laws_isotypic_components` -- 
%    - `~+replab.IrreducibleLaws.longStr` -- Multi-line description of the current object
%    - `~+replab.IrreducibleLaws.nRuns` -- Sets/tells the default number of runs
%    - `~+replab.IrreducibleLaws.shortStr` -- Single line text description of the current object
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: addTestCases
%
%       Documentation in :meth:`+replab.Laws.addTestCases`
%
%    .. method:: additionalFields
%
%       Documentation in :meth:`+replab.Str.additionalFields`
%
%    .. method:: assert
%
%       Documentation in :meth:`+replab.Laws.assert`
%
%    .. method:: check
%
%       Documentation in :meth:`+replab.Laws.check`
%
%    .. method:: disp
%
%       No documentation
%
%    .. method:: eq
%
%       Documentation in :meth:`+replab.Str.eq`
%
%    .. method:: getTestCases
%
%       Documentation in :meth:`+replab.Laws.getTestCases`
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
%    .. method:: nRuns
%
%       Documentation in :meth:`+replab.Laws.nRuns`
%
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    properties
        irreducible; % Irreducible decomposition
        M;
    end
    
    methods
        
        function self = IrreducibleLaws(irreducible)
            self.irreducible = irreducible;
            d = self.irreducible.dimension;
            self.M = replab.domain.Matrices(irreducible.parent.field, d, d);
        end
        
        function law_decomposes_entire_space(self)
            U = self.irreducible.U;
            self.M.assertEqv(U' * U, eye(self.irreducible.parent.dimension));
        end
        
        function isotypicLaws = laws_isotypic_components(self)
            children = cellfun(@(x) replab.IsotypicLaws(x), self.irreducible.components, 'uniform', 0);
            isotypicLaws = replab.LawsCollection(children);
        end
        
    end
end
