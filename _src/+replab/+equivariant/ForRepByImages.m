classdef ForRepByImages < replab.Equivariant
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+equivariant.ForRepByImages.Equivariant` -- Constructor; use `replab.makeEquivariant(repR, repC)` in user code
%    - `~+replab.+equivariant.ForRepByImages.ForRepByImages` -- 
%    - `~+replab.+equivariant.ForRepByImages.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+equivariant.ForRepByImages.assertEqv` -- Compares two elements for equality
%    - `~+replab.+equivariant.ForRepByImages.assertNotEqv` -- Compares two elements for inequality
%    - `~+replab.+equivariant.ForRepByImages.computeImages` -- 
%    - `~+replab.+equivariant.ForRepByImages.decompositionC` -- transversal inverse images for repC
%    - `~+replab.+equivariant.ForRepByImages.decompositionR` -- transversal images for repR
%    - `~+replab.+equivariant.ForRepByImages.disp` -- 
%    - `~+replab.+equivariant.ForRepByImages.eq` -- Equality test
%    - `~+replab.+equivariant.ForRepByImages.eqv` -- Tests domain elements for equality/equivalence
%    - `~+replab.+equivariant.ForRepByImages.field` -- {'R', 'C'}: field of the vector space real (R) or complex x(C)
%    - `~+replab.+equivariant.ForRepByImages.group` -- replab.CompactGroup: group being represented
%    - `~+replab.+equivariant.ForRepByImages.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+equivariant.ForRepByImages.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+equivariant.ForRepByImages.isEquivariant` -- Returns whether the matrix X represents an equivariant linear map
%    - `~+replab.+equivariant.ForRepByImages.lambda` -- Constructs a domain from function handles
%    - `~+replab.+equivariant.ForRepByImages.longStr` -- Multi-line description of the current object
%    - `~+replab.+equivariant.ForRepByImages.nC` -- integer: column size
%    - `~+replab.+equivariant.ForRepByImages.nR` -- integer: row size
%    - `~+replab.+equivariant.ForRepByImages.parent` -- parent domain, real or complex matrices
%    - `~+replab.+equivariant.ForRepByImages.project` -- Projects any nR x nC matrix in the equivariant subspace
%    - `~+replab.+equivariant.ForRepByImages.repC` -- replab.Rep: representation of column space
%    - `~+replab.+equivariant.ForRepByImages.repR` -- replab.Rep: representation of row space
%    - `~+replab.+equivariant.ForRepByImages.sample` -- Samples an element from this domain
%    - `~+replab.+equivariant.ForRepByImages.shortStr` -- Single line text description of the current object
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: Equivariant
%
%       Documentation in :meth:`+replab.Equivariant.Equivariant`
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
%    .. attribute:: field
%
%       Documentation in :attr:`+replab.Equivariant.field`
%
%    .. attribute:: group
%
%       Documentation in :attr:`+replab.Equivariant.group`
%
%    .. method:: headerStr
%
%       Documentation in :meth:`+replab.Str.headerStr`
%
%    .. method:: hiddenFields
%
%       Documentation in :meth:`+replab.Str.hiddenFields`
%
%    .. method:: isEquivariant
%
%       Documentation in :meth:`+replab.Equivariant.isEquivariant`
%
%    .. method:: lambda
%
%       Documentation in :meth:`+replab.Domain.lambda`
%
%    .. method:: longStr
%
%       Documentation in :meth:`+replab.Str.longStr`
%
%    .. attribute:: nC
%
%       Documentation in :attr:`+replab.Equivariant.nC`
%
%    .. attribute:: nR
%
%       Documentation in :attr:`+replab.Equivariant.nR`
%
%    .. attribute:: parent
%
%       Documentation in :attr:`+replab.Equivariant.parent`
%
%    .. attribute:: repC
%
%       Documentation in :attr:`+replab.Equivariant.repC`
%
%    .. attribute:: repR
%
%       Documentation in :attr:`+replab.Equivariant.repR`
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


    properties (Access = protected)
        decompositionR % transversal images for repR
        decompositionC % transversal inverse images for repC
    end
    
    methods (Access = protected)
       
        function computeImages(self)
            self.decompositionR = self.repR.chain.V;
            if self.repR == self.repC
                self.decompositionC = self.repC.chain.Vinv;
            else
                U = self.repR.chain.U;
                k = length(U);
                decC = cell(1, k);
                for i = 1:k
                    Ri = U{i};
                    nEl = size(Ri, 2);
                    Ci = cell(1, nEl);
                    for j = 1:nEl
                        Ci{j} = self.repC.chain.inverseImage(Ri(:,j)');
                    end
                    decC{i} = Ci;
                end
                self.decompositionC = decC;
            end
        end
        
    end
    
    methods

        function self = ForRepByImages(repR, repC)
            if ~isa(repR, 'replab.RepByImages')
                error('replab:dispatch:tryNext', 'try next');
            end
            if ~isa(repC, 'replab.RepByImages')
                error('replab:dispatch:tryNext', 'try next');
            end
            self = self@replab.Equivariant(repR, repC);
        end
        
        function X = project(self, X)
            if isempty(self.decompositionR) || isempty(self.decompositionC)
                self.computeImages;
            end
            R = self.decompositionR;
            Cinv = self.decompositionC;
            for i = length(R):-1:1
                Ri = R{i};
                Cinvi = Cinv{i};
                nEls = length(Ri);
                S = X;
                for j = 2:nEls
                    gX = Ri{j} * X * Cinvi{j};
                    S = S + gX;
                end
                X = S/nEls;
            end
        end
        
    end
    
end
