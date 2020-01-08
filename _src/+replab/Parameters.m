classdef Parameters
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.Parameters.averagingIterations` -- 
%    - `~+replab.Parameters.averagingSamples` -- 
%    - `~+replab.Parameters.bsgsFailureProbability` -- 
%    - `~+replab.Parameters.doubleEigTol` -- 
%    - `~+replab.Parameters.doubleSdpTol` -- 
%    - `~+replab.Parameters.randomizedSchreierSimsTries` -- Gets/sets the number of sifted elements before the BSGS chain is declared complete
%
% .. raw:: html
%
%    <h3>Own members</h3>

    
    methods (Static)
        
        function value = averagingSamples(newValue)
            persistent AveragingSamples;
            if nargin == 1
                AveragingSamples = newValue;
            elseif isempty(AveragingSamples)
                AveragingSamples = 3;
            end
            value = AveragingSamples;
        end
        
        function value = averagingIterations(newValue)
            persistent AveragingIterations;
            if nargin == 1
                AveragingIterations = newValue;
            elseif isempty(AveragingIterations)
                AveragingIterations = 1000;
            end
            value = AveragingIterations;
        end

        function value = randomizedSchreierSimsTries(newValue)
        % Gets/sets the number of sifted elements before the BSGS chain is declared complete
        %
        % This is the number of successive failed attempts to generate a new strong generator
        % before deciding the chain is complete in the randomized Schreier-Sims algorithm; 
        % the probability of failure is then less than 1/2^value.
        %
        % Args:
        %   newValue (integer, optional): New value
        %
        % Returns:
        %   integer: The current value.
            persistent RandomizedSchreierSimsTries;
            if nargin == 1
                RandomizedSchreierSimsTries = newValue;
            elseif isempty(RandomizedSchreierSimsTries)
                RandomizedSchreierSimsTries = 1000;
            end
            value = RandomizedSchreierSimsTries;
        end
        
        function value = bsgsFailureProbability(newValue)
            persistent BsgsFailureProbability;
            if nargin == 1
                BsgsFailureProbability = newValue;
            elseif isempty(BsgsFailureProbability)
                BsgsFailureProbability = 2^-100;
            end
            value = BsgsFailureProbability;
        end
        
        function value = doubleEigTol(newValue)
            persistent DoubleEigTol;
            if nargin == 1
                DoubleEigTol = newValue;
            elseif isempty(DoubleEigTol)
                DoubleEigTol = 1e-10;
            end
            value = DoubleEigTol;
        end

        function value = doubleSdpTol(newValue)
            persistent DoubleSdpTol;
            if nargin == 1
                DoubleSdpTol = newValue;
            elseif isempty(DoubleSdpTol)
                DoubleSdpTol = 1e-5;
            end
            value = DoubleSdpTol;
        end
        
    end

end
