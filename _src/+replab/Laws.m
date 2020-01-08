classdef Laws < replab.Str
% Describes a structure that obeys to algebraic laws
%
% Laws are described by methods called law_METHODNAME_TYPES
% where
% - METHODNAME is a snake_case identifier with each word starting
%   with a lower case character,
% - TYPES is a string composed of the concatenation of the possible definitions below
%   - Zn is an integer from -n to n, represented as a double
%   - Nn is an integer from 1 to n, represented as a double
%   - N0n is an integer from 0 to n, represented as a double
%   - any other letter should be the name of a property of this Laws instance
%     representing a domain
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.Laws.addTestCases` -- Adds law checks as test cases to the given test suite
%    - `~+replab.Laws.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.Laws.assert` -- Assert function with a verbose error message
%    - `~+replab.Laws.check` -- Runs the randomized tests without using MOxUnit
%    - `~+replab.Laws.disp` -- 
%    - `~+replab.Laws.eq` -- Equality test
%    - `~+replab.Laws.getTestCases` -- Enumerates the laws present in "self" by looking for methods of the form law_propertyName_TYPES
%    - `~+replab.Laws.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.Laws.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.Laws.longStr` -- Multi-line description of the current object
%    - `~+replab.Laws.nRuns` -- Sets/tells the default number of runs
%    - `~+replab.Laws.shortStr` -- Single line text description of the current object
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
%
%    .. method:: additionalFields
%
%       Documentation in :meth:`+replab.Str.additionalFields`
%
%    .. method:: disp
%
%       No documentation
%
%    .. method:: eq
%
%       Documentation in :meth:`+replab.Str.eq`
%
%    .. method:: headerStr
%
%       Documentation in :meth:`+replab.Str.headerStr`
%
%    .. method:: hiddenFields
%
%       Documentation in :meth:`+replab.Str.hiddenFields`
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

    
    methods
        
        function assert(self, predicate, context)
        % Assert function with a verbose error message
            if ~isscalar(predicate) || ~islogical(predicate)
                errorDesc = 'input %s is not a logical scalar';
                errorId = 'assertTrue:invalidCondition';
            elseif ~predicate
                errorDesc = 'input %s does not evaluate to true';
                errorId = 'assertTrue:falseCondition';
            else
                return
            end
            if nargin < 3
                context = '';
            end
            names = evalin('caller', 'who');
            nV = length(names);
            values = cell(1, nV);
            for i = 1:nV
                values{i} = evalin('caller', names{i});
            end
            message = replab.laws.message(errorDesc, context, {predicate}, names, values);
            if replab.settings.isOctave
                error(errorId, '%s', message);
            else
                throwAsCaller(MException(errorId, '%s', message));
            end
        end
        
        function [testNames testFuns] = getTestCases(self)
        % Enumerates the laws present in "self" by looking for methods of the form law_propertyName_TYPES
            testNames = {};
            testFuns = {};
            MC = metaclass(self);
            M = MC.MethodList;
            for i = 1:length(M)
                if isa(M, 'cell')
                    % Octave returns a cell array 
                    method = M{i};
                else
                    % Matlab an object array
                    method = M(i);
                end
                name = method.Name;
                if length(name) > 5 && isequal(name(1:5), 'laws_')
                    % It is a method that populates test cases from a Laws
                    % subinstance
                    nameParts = strsplit(name, '_');
                    prefix = [strjoin(nameParts(2:end), ' ') '->'];
                    newLaws = self.(name);
                    [newTestNames newTestFuns] = newLaws.getTestCases;
                    newTestNames = cellfun(@(x) [prefix x], newTestNames, 'UniformOutput', false);
                    testNames = horzcat(testNames, newTestNames);
                    testFuns = horzcat(testFuns, newTestFuns);
                end
                if length(name) > 4 && isequal(name(1:4), 'law_')
                    % It is a method that describes a test case
                    [lawName argFuns] = replab.laws.collectTypes(self, name);
                    if length(argFuns) > 0
                        testFun = @() replab.laws.runNTimes(replab.Laws.nRuns, self, name, argFuns);
                    else
                        testFun = @() replab.laws.runNTimes(1, self, name, {});
                    end
                    testNames{end+1} = lawName;
                    testFuns{end+1} = testFun;
                end
            end
        end
        
        function check(self)
        % Runs the randomized tests without using MOxUnit
        %
        % Useful from the REPL command line
            [testNames testFuns] = self.getTestCases;
            for i = 1:length(testNames)
                disp(sprintf('Checking %s...', testNames{i}));
                f = testFuns{i};
                f();
            end
        end
        
        function testSuite = addTestCases(self, testSuite, testName)
        % Adds law checks as test cases to the given test suite
        %
        % Inputs:
        % testSuite      - MOxUnitTestSuite object
        % testName       - (optional) name of the test
            nRuns = replab.Laws.nRuns;
            if nargin < 3
                testName = class(self);
            end
            % location comes from the calling function
            [call_stack, idx] = dbstack('-completenames');
            location = call_stack(idx + 1).file;
            [testNames testFuns] = self.getTestCases;
            for i = 1:length(testNames)
                caseName = [testName ': ' testNames{i}];
                testCase = MOxUnitFunctionHandleTestCase(caseName, location, testFuns{i});
                testSuite = addTest(testSuite, testCase);
            end
        end
        
    end
    
    methods (Static)
        function value = nRuns(newValue)
        % Sets/tells the default number of runs
        %
        % Args:
        %     newValue: integer, sets the number of runs (optional)
        %
        % Returns:
        %     value: number of runs

            persistent n;
            if isempty(n)
                n = 20;
            end
            if nargin >= 1
                assert((newValue >= 1) && (round(newValue) == newValue), 'newValue should be a positive integer');
                n = newValue;
            end
            value = n;
        end
    end
    
end
