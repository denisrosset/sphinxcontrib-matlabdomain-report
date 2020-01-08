classdef HermitianMatrices < replab.Domain
% Describes the vector space of n x n quaternion Hermitian matrices
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+quaternion.HermitianMatrices.HermitianMatrices` -- 
%    - `~+replab.+quaternion.HermitianMatrices.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+quaternion.HermitianMatrices.assertEqv` -- Compares two elements for equality
%    - `~+replab.+quaternion.HermitianMatrices.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+quaternion.HermitianMatrices.disp` -- 
%    - `~+replab.+quaternion.HermitianMatrices.eq` -- Equality test
%    - `~+replab.+quaternion.HermitianMatrices.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+quaternion.HermitianMatrices.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+quaternion.HermitianMatrices.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+quaternion.HermitianMatrices.lambda` -- Constructs a domain from function handles
%    - `~+replab.+quaternion.HermitianMatrices.longStr` -- Multi-line description of the current object
%    - `~+replab.+quaternion.HermitianMatrices.n` -- integer: Matrix size
%    - `~+replab.+quaternion.HermitianMatrices.parent` -- 
%    - `~+replab.+quaternion.HermitianMatrices.sample` -- Generates a n x n quaternion Hermitian matrix
%    - `~+replab.+quaternion.HermitianMatrices.shortStr` -- Single line text description of the current object
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
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    properties
        n % integer: Matrix size
    end
    
    properties (Access = protected)
        parent;
    end
    
    methods
        
        function self = HermitianMatrices(n)
            self.n = n;
            self.parent = replab.quaternion.Matrices(n, n);
        end
        
        %% Str methods
        
        function s = headerStr(self)
            s = sprintf('%d x %d quaternion Hermitian matrices', self.n, self.n);
        end
        
        %% Domain methods
        
        function b = eqv(self, X, Y)
            b = self.parent.eqv(X, Y);
        end
        
        function X = sample(self)
        % Generates a n x n quaternion Hermitian matrix
        %
        % We adapt the procedure used for complex Hermitian
        % matrices but haven't proved that it is the correct
        % approach (factors could be off)
            n = self.n;
            X = replab.quaternion.H.zeros(n, n);
            for r = 1:n
                X(r, r) = randn;
                s1 = randn(1, n-r);
                si = randn(1, n-r);
                sj = randn(1, n-r);
                sk = randn(1, n-r);
                if r < n
                    X(r, r+1:end) = replab.quaternion.H(s1, si, sj, sk)/2;
                    X(r+1:end, r) = conj(X(r, r+1:end));
                end
            end
        end    

    end

end
