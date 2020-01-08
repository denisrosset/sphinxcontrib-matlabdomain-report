classdef RepByImages < replab.Rep
% A finite dimensional representation of a finite group
%
% It works by representing the finite group as a permutation group (if it is not already a permutation group),
% then using a BSGS construction that stores the stabilizer chain with transversal elements both encoding the
% group transversals and their images (see `replab.bsgs.Chain`).
%
% If the finite group is not a permutation group, a "nice monomorphism" in the sense of GAP is used, see:
% https://www.gap-system.org/Manuals/doc/ref/chap40.html#X7FFD731684606BC6)
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.RepByImages.RepByImages` -- Constructs a representation from images of group generators and their inverses
%    - `~+replab.RepByImages.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.RepByImages.blkdiag` -- Direct sum of representations
%    - `~+replab.RepByImages.chain` -- 
%    - `~+replab.RepByImages.chain_` -- BSGS chain with images
%    - `~+replab.RepByImages.commutant` -- Returns the commutant of this representation
%    - `~+replab.RepByImages.commutant_` -- 
%    - `~+replab.RepByImages.complexification` -- Returns the complexification of a real representation
%    - `~+replab.RepByImages.conj` -- Returns the complex conjugate representation of this representation
%    - `~+replab.RepByImages.decomposition` -- Returns the irreducible decomposition of this representation
%    - `~+replab.RepByImages.decomposition_` -- 
%    - `~+replab.RepByImages.dimension` -- integer: Representation dimension
%    - `~+replab.RepByImages.directSum` -- Computes the direct sum of representations
%    - `~+replab.RepByImages.directSumOfCopies` -- Returns a direct sum of copies of this representation
%    - `~+replab.RepByImages.disp` -- 
%    - `~+replab.RepByImages.dual` -- Returns the dual representation of this representation
%    - `~+replab.RepByImages.eq` -- Equality test
%    - `~+replab.RepByImages.equivariant` -- Returns the space of equivariant linear maps from this rep to another rep
%    - `~+replab.RepByImages.field` -- {'R', 'C'}: Vector space defined on real (R) or complex (C) field
%    - `~+replab.RepByImages.fromRep` -- 
%    - `~+replab.RepByImages.group` -- replab.CompactGroup: Group being represented
%    - `~+replab.RepByImages.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.RepByImages.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.RepByImages.image` -- Returns the image of a group element
%    - `~+replab.RepByImages.images` -- Generator images
%    - `~+replab.RepByImages.inverseImage` -- Returns the image of the inverse of a group element
%    - `~+replab.RepByImages.inverseImages` -- Generator inverse images
%    - `~+replab.RepByImages.isUnitary` -- {true, false, []}: Whether the representation is unitary
%    - `~+replab.RepByImages.kron` -- Tensor product of representations
%    - `~+replab.RepByImages.lambda` -- Creates a non unitary representation from an image function
%    - `~+replab.RepByImages.leftConjugateUnitary` -- Returns the (left) conjugation of this representation
%    - `~+replab.RepByImages.longStr` -- Multi-line description of the current object
%    - `~+replab.RepByImages.matrixColAction` -- Computes the matrix-representation product
%    - `~+replab.RepByImages.matrixRowAction` -- Computes the representation-matrix product
%    - `~+replab.RepByImages.overC` -- Returns whether this representation is defined over the complex field
%    - `~+replab.RepByImages.overR` -- Returns whether this representation is defined over the real field
%    - `~+replab.RepByImages.sample` -- Samples an element from the group and returns its image under the representation
%    - `~+replab.RepByImages.shortStr` -- Single line text description of the current object
%    - `~+replab.RepByImages.subRep` -- Returns a subrepresentation of this representation
%    - `~+replab.RepByImages.subRepUnitary` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.RepByImages.subRepUnitaryByIntegerBasis` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.RepByImages.tensor` -- Computes the tensor product of representations
%    - `~+replab.RepByImages.tensorPower` -- Returns a tensor power of this representation
%    - `~+replab.RepByImages.unitarize` -- Returns a unitary representation equivalent to this representation
%    - `~+replab.RepByImages.unitaryChangeOfBasis` -- Returns the change of basis to a unitary representation
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: blkdiag
%
%       Documentation in :meth:`+replab.Rep.blkdiag`
%
%    .. method:: commutant
%
%       Documentation in :meth:`+replab.Rep.commutant`
%
%    .. attribute:: commutant_
%
%       No documentation
%
%    .. method:: complexification
%
%       Documentation in :meth:`+replab.Rep.complexification`
%
%    .. method:: conj
%
%       Documentation in :meth:`+replab.Rep.conj`
%
%    .. method:: decomposition
%
%       Documentation in :meth:`+replab.Rep.decomposition`
%
%    .. attribute:: decomposition_
%
%       No documentation
%
%    .. attribute:: dimension
%
%       Documentation in :attr:`+replab.Rep.dimension`
%
%    .. method:: directSum
%
%       Documentation in :meth:`+replab.Rep.directSum`
%
%    .. method:: directSumOfCopies
%
%       Documentation in :meth:`+replab.Rep.directSumOfCopies`
%
%    .. method:: disp
%
%       No documentation
%
%    .. method:: dual
%
%       Documentation in :meth:`+replab.Rep.dual`
%
%    .. method:: eq
%
%       Documentation in :meth:`+replab.Str.eq`
%
%    .. method:: equivariant
%
%       Documentation in :meth:`+replab.Rep.equivariant`
%
%    .. attribute:: field
%
%       Documentation in :attr:`+replab.Rep.field`
%
%    .. attribute:: group
%
%       Documentation in :attr:`+replab.Rep.group`
%
%    .. method:: headerStr
%
%       Documentation in :meth:`+replab.Str.headerStr`
%
%    .. attribute:: isUnitary
%
%       Documentation in :attr:`+replab.Rep.isUnitary`
%
%    .. method:: kron
%
%       Documentation in :meth:`+replab.Rep.kron`
%
%    .. method:: lambda
%
%       Documentation in :meth:`+replab.Rep.lambda`
%
%    .. method:: leftConjugateUnitary
%
%       Documentation in :meth:`+replab.Rep.leftConjugateUnitary`
%
%    .. method:: longStr
%
%       Documentation in :meth:`+replab.Str.longStr`
%
%    .. method:: matrixColAction
%
%       Documentation in :meth:`+replab.Rep.matrixColAction`
%
%    .. method:: matrixRowAction
%
%       Documentation in :meth:`+replab.Rep.matrixRowAction`
%
%    .. method:: overC
%
%       Documentation in :meth:`+replab.Rep.overC`
%
%    .. method:: overR
%
%       Documentation in :meth:`+replab.Rep.overR`
%
%    .. method:: sample
%
%       Documentation in :meth:`+replab.Rep.sample`
%
%    .. method:: shortStr
%
%       Documentation in :meth:`+replab.Str.shortStr`
%
%    .. method:: subRep
%
%       Documentation in :meth:`+replab.Rep.subRep`
%
%    .. method:: subRepUnitary
%
%       Documentation in :meth:`+replab.Rep.subRepUnitary`
%
%    .. method:: subRepUnitaryByIntegerBasis
%
%       Documentation in :meth:`+replab.Rep.subRepUnitaryByIntegerBasis`
%
%    .. method:: tensor
%
%       Documentation in :meth:`+replab.Rep.tensor`
%
%    .. method:: tensorPower
%
%       Documentation in :meth:`+replab.Rep.tensorPower`
%
%    .. method:: unitarize
%
%       Documentation in :meth:`+replab.Rep.unitarize`
%
%    .. method:: unitaryChangeOfBasis
%
%       Documentation in :meth:`+replab.Rep.unitaryChangeOfBasis`
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    properties (SetAccess = protected)
        images % Generator images
        inverseImages % Generator inverse images
    end
    
    properties (Access = protected)
        chain_ % BSGS chain with images
    end
        
    methods
                
        %% Own methods
        
        function self = RepByImages(group, field, dimension, isUnitary, images, inverseImages)
        % Constructs a representation from images of group generators and their inverses
        %
        % Args:
        %   group (instance of `replab.FiniteGroup`): Finite group represented
        %   field ({'R', 'C'}): Whether the representation if real (R) or complex (C)
        %   isUnitary ({true, false, []}): Whether the representation is unitary
        %   images (row cell array of double matrices): Images of the generators of `group` in the same order
        %   inverseImages (row cell array of double matrices, optional): Inverse images of the generators
        %                                                                Optional if the representation is unitary
            assert(isa(group, 'replab.NiceFiniteGroup'));
            assert(isa(images, 'cell'));
            if nargin < 6 || isequal(inverseImages, [])
                assert(~isempty(isUnitary) && isUnitary, 'The representation must be unitary when inverse images are omitted');
                inverseImages = cellfun(@(x) x', images, 'uniform', 0);
            end
            assert(length(inverseImages) == group.nGenerators);
            assert(isa(inverseImages, 'cell'));
            self.group = group;
            self.field = field;
            self.dimension = dimension;
            self.isUnitary = isUnitary;
            self.images = images;
            self.inverseImages = inverseImages;
            for i = 1:self.group.nGenerators
                assert(isequal(size(images{i}), [dimension dimension]));
                assert(isequal(size(inverseImages{i}), [dimension dimension]));
            end                
        end
        
        function c = chain(self)
            if isempty(self.chain_)
                if self.isUnitary
                    if self.overR
                        J = replab.OrthogonalGroup(self.dimension);
                    else
                        J = replab.UnitaryGroup(self.dimension);
                    end
                    niceId = self.group.niceMonomorphismImage(self.group.identity);
                    n = length(niceId);
                    nG = self.group.nGenerators;
                    I = zeros(n, nG);
                    for i = 1:nG
                        I(:,i) = self.group.niceMonomorphismImage(self.group.generator(i));
                    end
                    self.chain_ = replab.bsgs.Chain.makeWithImages(n, I, J, self.images);
                else
                    J = replab.GeneralLinearGroupWithInverses(self.field, self.dimension);
                    niceId = self.group.niceMonomorphismImage(self.group.identity);
                    n = length(niceId);
                    nG = self.group.nGenerators;
                    I = zeros(n, nG);
                    elements = cell(1, nG);
                    for i = 1:nG
                        I(:,i) = self.group.niceMonomorphismImage(self.group.generator(i));
                        elements{i} = [self.images{i} self.inverseImages{i}];
                    end
                    C = replab.bsgs.Chain(n, J);
                    C.insertStrongGenerators(I, elements);
                    C.randomizedSchreierSims;
                    cut = @(X) X(:, 1:self.dimension);
                    C.mutableMapImages(replab.GeneralLinearGroup(self.field, self.dimension), cut);
                    C.makeImmutable;
                    self.chain_ = C;
                end
            end
            c = self.chain_;
        end
        
        %% Str methods

        function names = hiddenFields(self)
            names = hiddenFields@replab.Rep(self);
            names{1, end+1} = 'images';
        end
        
        function [names values] = additionalFields(self)
            [names values] = additionalFields@replab.Rep(self);
            for i = 1:length(self.images)
                names{1, end+1} = sprintf('images{%d}', i);
                values{1, end+1} = self.images{i};
            end
        end

        %% Rep methods
        
        function rho = image(self, g)
            img = self.group.niceMonomorphismImage(g);
            rho = self.chain.image(img);
        end
        
        function rho = inverseImage(self, g)
            img = self.group.niceMonomorphismImage(g);
            rho = self.chain.inverseImage(img);
        end
        
    end

    methods (Static)
        
        function rep1 = fromRep(rep)
            assert(isa(rep.group, 'replab.NiceFiniteGroup'));
            nG = rep.group.nGenerators;
            images = cell(1, nG);
            inverseImages = cell(1, nG);
            for i = 1:nG
                g = rep.group.generator(i);
                images{i} = rep.image(g);
                inverseImages{i} = rep.inverseImage(g);
            end
            rep1 = replab.RepByImages(rep.group, rep.field, rep.dimension, rep.isUnitary, images, inverseImages);
        end
        
    end
end
