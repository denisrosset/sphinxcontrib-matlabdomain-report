classdef VectorSpace < replab.Domain
% Base class for vector spaces that can be either real or complex
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+domain.VectorSpace.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+domain.VectorSpace.assertEqv` -- Compares two elements for equality
%    - `~+replab.+domain.VectorSpace.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+domain.VectorSpace.disp` -- 
%    - `~+replab.+domain.VectorSpace.eq` -- Equality test
%    - `~+replab.+domain.VectorSpace.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+domain.VectorSpace.field` -- {'R', 'C'}: Matrices with real (R) or complex (C) coefficients
%    - `~+replab.+domain.VectorSpace.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+domain.VectorSpace.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+domain.VectorSpace.lambda` -- Constructs a domain from function handles
%    - `~+replab.+domain.VectorSpace.longStr` -- Multi-line description of the current object
%    - `~+replab.+domain.VectorSpace.overC` -- Returns whether this vector space is defined over the complex field
%    - `~+replab.+domain.VectorSpace.overR` -- Returns whether this vector space is defined over the real field
%    - `~+replab.+domain.VectorSpace.sample` -- Samples an element from this domain
%    - `~+replab.+domain.VectorSpace.shortStr` -- Single line text description of the current object
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: additionalFields
%
%       Documentation in :meth:`+replab.Str.additionalFields`
%
%    .. method:: assertEqv
%
%       Documentation in :meth:`+replab.Domain.assertEqv`
%
%    .. method:: assertNotEqv
%
%       Documentation in :meth:`+replab.Domain.assertNotEqv`
%
%    .. method:: disp
%
%       No documentation
%
%    .. method:: eq
%
%       Documentation in :meth:`+replab.Str.eq`
%
%    .. method:: eqv
%
%       Documentation in :meth:`+replab.Domain.eqv`
%
%    .. method:: headerStr
%
%       Documentation in :meth:`+replab.Str.headerStr`
%
%    .. method:: hiddenFields
%
%       Documentation in :meth:`+replab.Str.hiddenFields`
%
%    .. method:: lambda
%
%       Documentation in :meth:`+replab.Domain.lambda`
%
%    .. method:: longStr
%
%       Documentation in :meth:`+replab.Str.longStr`
%
%    .. method:: sample
%
%       Documentation in :meth:`+replab.Domain.sample`
%
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    properties
        field % {'R', 'C'}: Matrices with real (R) or complex (C) coefficients
    end
    
    methods
        
        function b = overR(self)
        % Returns whether this vector space is defined over the real field
        %
        % Returns:
        %   logical: True if the vector space is defined over the real field
            b = isequal(self.field, 'R');
        end
        
        function b = overC(self)
        % Returns whether this vector space is defined over the complex field
        %
        % Returns:
        %   logical: True if this vector space are defined over the complex field
            b = isequal(self.field, 'C');
        end
        
    end
    
end
