classdef Matrices < replab.domain.VectorSpace
% Describes the vector space of nR x nC real/complex matrices
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+domain.Matrices.Matrices` -- Constructs the space of nR x nC real/complex matrices
%    - `~+replab.+domain.Matrices.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+domain.Matrices.assertEqv` -- Compares two elements for equality
%    - `~+replab.+domain.Matrices.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+domain.Matrices.disp` -- 
%    - `~+replab.+domain.Matrices.eq` -- Equality test
%    - `~+replab.+domain.Matrices.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+domain.Matrices.field` -- {'R', 'C'}: Matrices with real (R) or complex (C) coefficients
%    - `~+replab.+domain.Matrices.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+domain.Matrices.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+domain.Matrices.lambda` -- Constructs a domain from function handles
%    - `~+replab.+domain.Matrices.longStr` -- Multi-line description of the current object
%    - `~+replab.+domain.Matrices.nC` -- integer: Column size
%    - `~+replab.+domain.Matrices.nR` -- integer: Row size
%    - `~+replab.+domain.Matrices.overC` -- Returns whether this vector space is defined over the complex field
%    - `~+replab.+domain.Matrices.overR` -- Returns whether this vector space is defined over the real field
%    - `~+replab.+domain.Matrices.sample` -- Samples an element from this domain
%    - `~+replab.+domain.Matrices.shortStr` -- Single line text description of the current object
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
        nR % integer: Row size
        nC % integer: Column size
    end
    
    methods
        
        %% Own methods
        
        function self = Matrices(field, nR, nC)
        % Constructs the space of nR x nC real/complex matrices
        %
        % Args:
        %   field ({'R', 'C'}): Real (R) or complex (C) coefficients
        %   nR (integer): Number of rows
        %   nC (integer): Number of columns
            self.field = field;
            self.nR = nR;
            self.nC = nC;
        end

        %% Str methods
        
        function s = headerStr(self)
            if self.overR
                s = sprintf('%d x %d real matrices', self.nR, self.nC);
            else
                s = sprintf('%d x %d complex matrices', self.nR, self.nC);
            end
        end
        
        %% Domain methods
        
        function b = eqv(self, X, Y)
            b = ~replab.isNonZeroMatrix(X - Y, replab.Parameters.doubleEigTol);
        end
        
        function X = sample(self)
            if self.overR
                X = randn(self.nR, self.nC);
            else
                realPart = randn(self.nR, self.nC);
                imagPart = randn(self.nR, self.nC);
                X = (realPart + 1i * imagPart)/sqrt(2);
            end
        end
        
    end

end
