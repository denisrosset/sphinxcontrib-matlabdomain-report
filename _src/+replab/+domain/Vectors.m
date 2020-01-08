classdef Vectors < replab.domain.VectorSpace
% Describes the vector space of d-dimensional real/complex column vectors
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+domain.Vectors.Vectors` -- Constructs the space of d-dimensional real/complex column vectors
%    - `~+replab.+domain.Vectors.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+domain.Vectors.assertEqv` -- Compares two elements for equality
%    - `~+replab.+domain.Vectors.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+domain.Vectors.d` -- integer: Dimension
%    - `~+replab.+domain.Vectors.disp` -- 
%    - `~+replab.+domain.Vectors.eq` -- Equality test
%    - `~+replab.+domain.Vectors.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+domain.Vectors.field` -- {'R', 'C'}: Matrices with real (R) or complex (C) coefficients
%    - `~+replab.+domain.Vectors.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+domain.Vectors.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+domain.Vectors.lambda` -- Constructs a domain from function handles
%    - `~+replab.+domain.Vectors.longStr` -- Multi-line description of the current object
%    - `~+replab.+domain.Vectors.overC` -- Returns whether this vector space is defined over the complex field
%    - `~+replab.+domain.Vectors.overR` -- Returns whether this vector space is defined over the real field
%    - `~+replab.+domain.Vectors.sample` -- Samples an element from this domain
%    - `~+replab.+domain.Vectors.shortStr` -- Single line text description of the current object
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
%    .. attribute:: field
%
%       Documentation in :attr:`+replab.+domain.VectorSpace.field`
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
%    .. method:: overC
%
%       Documentation in :meth:`+replab.+domain.VectorSpace.overC`
%
%    .. method:: overR
%
%       Documentation in :meth:`+replab.+domain.VectorSpace.overR`
%
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    properties
        d % integer: Dimension
    end
    
    methods
        
        %% Own methods
        
        function self = Vectors(field, d)
        % Constructs the space of d-dimensional real/complex column vectors
        %
        % Args:
        %   field ({'R', 'C'}): Real (R) or complex (C) coefficients
        %   d (integer): Dimension
            self.field = field;
            self.d = d;
        end
        
        %% Str methods
        
        function s = headerStr(self)
            if self.overR
                s = sprintf('%d x 1 real vectors', self.d);
            else
                s = sprintf('%d x 1 complex vectors', self.d);
            end
        end
        
        %% Domain methods
        
        function b = eqv(self, X, Y)
            b = ~replab.isNonZeroMatrix(X - Y, replab.Parameters.doubleEigTol);
        end
        
        function X = sample(self)
            if self.overR
                X = randn(self.d, 1);
            else
                realPart = randn(self.d, 1);
                imagPart = randn(self.d, 1);
                X = (realPart + 1i * imagPart)/sqrt(2);
            end
        end
        
    end

end
