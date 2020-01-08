classdef DirectSumRep < replab.Rep
% A direct sum of representations, such that images are diagonal by blocks
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+rep.DirectSumRep.DirectSumRep` -- Constructs a direct sum from a cell array of representations
%    - `~+replab.+rep.DirectSumRep.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+rep.DirectSumRep.blkdiag` -- Direct sum of representations
%    - `~+replab.+rep.DirectSumRep.block` -- Returns a block in the direct sum
%    - `~+replab.+rep.DirectSumRep.blocks` -- row cell array of replab.Rep: Contained subrepresentations
%    - `~+replab.+rep.DirectSumRep.commutant` -- Returns the commutant of this representation
%    - `~+replab.+rep.DirectSumRep.commutant_` -- 
%    - `~+replab.+rep.DirectSumRep.complexification` -- Returns the complexification of a real representation
%    - `~+replab.+rep.DirectSumRep.conj` -- Returns the complex conjugate representation of this representation
%    - `~+replab.+rep.DirectSumRep.decomposition` -- Returns the irreducible decomposition of this representation
%    - `~+replab.+rep.DirectSumRep.decomposition_` -- 
%    - `~+replab.+rep.DirectSumRep.dimension` -- integer: Representation dimension
%    - `~+replab.+rep.DirectSumRep.directSum` -- Computes the direct sum of representations
%    - `~+replab.+rep.DirectSumRep.directSumOfCopies` -- Returns a direct sum of copies of this representation
%    - `~+replab.+rep.DirectSumRep.disp` -- 
%    - `~+replab.+rep.DirectSumRep.dual` -- Returns the dual representation of this representation
%    - `~+replab.+rep.DirectSumRep.eq` -- Equality test
%    - `~+replab.+rep.DirectSumRep.equivariant` -- Returns the space of equivariant linear maps from this rep to another rep
%    - `~+replab.+rep.DirectSumRep.field` -- {'R', 'C'}: Vector space defined on real (R) or complex (C) field
%    - `~+replab.+rep.DirectSumRep.group` -- replab.CompactGroup: Group being represented
%    - `~+replab.+rep.DirectSumRep.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+rep.DirectSumRep.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+rep.DirectSumRep.image` -- Returns the image of a group element
%    - `~+replab.+rep.DirectSumRep.inverseImage` -- Returns the image of the inverse of a group element
%    - `~+replab.+rep.DirectSumRep.isUnitary` -- {true, false, []}: Whether the representation is unitary
%    - `~+replab.+rep.DirectSumRep.kron` -- Tensor product of representations
%    - `~+replab.+rep.DirectSumRep.lambda` -- Creates a non unitary representation from an image function
%    - `~+replab.+rep.DirectSumRep.leftConjugateUnitary` -- Returns the (left) conjugation of this representation
%    - `~+replab.+rep.DirectSumRep.longStr` -- Multi-line description of the current object
%    - `~+replab.+rep.DirectSumRep.matrixColAction` -- Computes the matrix-representation product
%    - `~+replab.+rep.DirectSumRep.matrixRowAction` -- Computes the representation-matrix product
%    - `~+replab.+rep.DirectSumRep.nBlocks` -- Returns the number of blocks in the direct sum
%    - `~+replab.+rep.DirectSumRep.overC` -- Returns whether this representation is defined over the complex field
%    - `~+replab.+rep.DirectSumRep.overR` -- Returns whether this representation is defined over the real field
%    - `~+replab.+rep.DirectSumRep.sample` -- Samples an element from the group and returns its image under the representation
%    - `~+replab.+rep.DirectSumRep.shortStr` -- Single line text description of the current object
%    - `~+replab.+rep.DirectSumRep.subRep` -- Returns a subrepresentation of this representation
%    - `~+replab.+rep.DirectSumRep.subRepUnitary` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.+rep.DirectSumRep.subRepUnitaryByIntegerBasis` -- Returns a unitary subrepresentation of this unitary representation
%    - `~+replab.+rep.DirectSumRep.tensor` -- Computes the tensor product of representations
%    - `~+replab.+rep.DirectSumRep.tensorPower` -- Returns a tensor power of this representation
%    - `~+replab.+rep.DirectSumRep.unitarize` -- Returns a unitary representation equivalent to this representation
%    - `~+replab.+rep.DirectSumRep.unitaryChangeOfBasis` -- Returns the change of basis to a unitary representation
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

    
    properties
        blocks % row cell array of replab.Rep: Contained subrepresentations
    end
    
    methods
        
        function self = DirectSumRep(blocks)
        % Constructs a direct sum from a cell array of representations
        %
        % All the subrepresentations should be defined on the same group, and on the same field.
        %
        % Args:
        %   blocks (row cell array of replab.Rep): Subrepresentations
            assert(length(blocks) >= 1);
            d = 0;
            for i = 1:length(blocks)
                assert(isa(blocks{i}, 'replab.Rep'));
                d = d + blocks{i}.dimension;
            end
            self.dimension = d;
            blocksAreUnitary = cellfun(@(x) x.isUnitary, blocks, 'uniform', 0);
            self.isUnitary = replab.trileanAnd(blocksAreUnitary{:});
            for i = 2:length(blocks)
                assert(blocks{1}.group == blocks{i}.group);
                assert(isequal(blocks{1}.field, blocks{i}.field));
            end
            self.blocks = blocks;
            self.group = blocks{1}.group;
            self.field = blocks{1}.field;
        end
        
        function n = nBlocks(self)
        % Returns the number of blocks in the direct sum
        %
        % Returns:
        %   integer: Number of subrepresentations composing this representation
            n = length(self.blocks);
        end
        
        function block = block(self, i)
        % Returns a block in the direct sum
        %
        % Args:
        %   i (integer): Index of block
        %
        % Returns:
        %   replab.Rep: Representation corresponding to the i-th block
            block = self.blocks{i};
        end

        %% Str methods
                
        function names = hiddenFields(self)
            names = hiddenFields@replab.Rep(self);
            names{1, end+1} = 'blocks';
        end
        
        function [names values] = additionalFields(self)
            [names values] = additionalFields@replab.Rep(self);
            for i = 1:self.nBlocks
                names{1, end+1} = sprintf('block(%d)', i);
                values{1, end+1} = self.block(i);
            end
        end
        
        %% Rep methods

        function rho = image(self, g)
            rhos = cellfun(@(rep) rep.image(g), self.blocks, 'uniform', 0);
            rho = blkdiag(rhos{:});
        end
        
        function rho = inverseImage(self, g)
            rhos = cellfun(@(rep) rep.inverseImage(g), self.blocks, 'uniform', 0);
            rho = blkdiag(rhos{:});
        end

    end

end
