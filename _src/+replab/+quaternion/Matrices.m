classdef Matrices < replab.Domain
% Describes the vector space of nR x nC quaternion matrices
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+quaternion.Matrices.Matrices` -- 
%    - `~+replab.+quaternion.Matrices.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+quaternion.Matrices.assertEqv` -- Compares two elements for equality
%    - `~+replab.+quaternion.Matrices.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+quaternion.Matrices.disp` -- 
%    - `~+replab.+quaternion.Matrices.eq` -- Equality test
%    - `~+replab.+quaternion.Matrices.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+quaternion.Matrices.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+quaternion.Matrices.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+quaternion.Matrices.lambda` -- Constructs a domain from function handles
%    - `~+replab.+quaternion.Matrices.longStr` -- Multi-line description of the current object
%    - `~+replab.+quaternion.Matrices.nC` -- integer: Column size
%    - `~+replab.+quaternion.Matrices.nR` -- integer: Row size
%    - `~+replab.+quaternion.Matrices.sample` -- Samples an element from this domain
%    - `~+replab.+quaternion.Matrices.shortStr` -- Single line text description of the current object
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
        nR % integer: Row size
        nC % integer: Column size
    end
    
    methods
        
        function self = Matrices(nR, nC)
            self.nR = nR;
            self.nC = nC;
        end
        
        %% Str methods
        
        function s = headerStr(self)
            s = sprintf('%d x %d quaternion matrices', self.nR, self.nC);
        end
        
        %% Domain methods
        
        function b = eqv(self, X, Y)
            b = ~replab.isNonZeroMatrix(X - Y, replab.Parameters.doubleEigTol);
        end
        
        function X = sample(self)
            part1 = randn(self.nR, self.nC);
            parti = randn(self.nR, self.nC);
            partj = randn(self.nR, self.nC);
            partk = randn(self.nR, self.nC);
            X = replab.quaternion.H(part1, parti, partj, partk)/2;
        end
        
    end

end
