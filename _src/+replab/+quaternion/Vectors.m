classdef Vectors < replab.Domain
% Describes the vector space of d x 1 quaternion vectors
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+quaternion.Vectors.Vectors` -- 
%    - `~+replab.+quaternion.Vectors.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+quaternion.Vectors.assertEqv` -- Compares two elements for equality
%    - `~+replab.+quaternion.Vectors.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+quaternion.Vectors.d` -- dimension
%    - `~+replab.+quaternion.Vectors.disp` -- 
%    - `~+replab.+quaternion.Vectors.eq` -- Equality test
%    - `~+replab.+quaternion.Vectors.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+quaternion.Vectors.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+quaternion.Vectors.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+quaternion.Vectors.lambda` -- Constructs a domain from function handles
%    - `~+replab.+quaternion.Vectors.longStr` -- Multi-line description of the current object
%    - `~+replab.+quaternion.Vectors.sample` -- Samples an element from this domain
%    - `~+replab.+quaternion.Vectors.shortStr` -- Single line text description of the current object
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
        d; % dimension
    end
    
    methods
        
        function self = Vectors(d)
            self.d = d;
        end
        
        % Str
        
        function s = headerStr(self)
            s = sprintf('%d x 1 quaternion vectors', self.d);
        end
        
        % Domain
        
        function b = eqv(self, X, Y)
            b = ~replab.isNonZeroMatrix(X - Y, replab.Parameters.doubleEigTol);
        end
        
        function X = sample(self)
            part1 = randn(self.d, 1);
            parti = randn(self.d, 1);
            partj = randn(self.d, 1);
            partk = randn(self.d, 1);
            X = replab.quaternion.H(part1, parti, partj, partk)/2;
        end
        
    end

end
