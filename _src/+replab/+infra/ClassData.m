classdef ClassData < replab.Str
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+infra.ClassData.ClassData` -- 
%    - `~+replab.+infra.ClassData.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+infra.ClassData.disp` -- 
%    - `~+replab.+infra.ClassData.docLineNumbers` -- row integer vector: Line numbers of the documentation comment
%    - `~+replab.+infra.ClassData.docLines` -- row cell array of charstring: Documentation comment lines stripped of leading whitespace and leading ``%``
%    - `~+replab.+infra.ClassData.eq` -- Equality test
%    - `~+replab.+infra.ClassData.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+infra.ClassData.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+infra.ClassData.longStr` -- Multi-line description of the current object
%    - `~+replab.+infra.ClassData.name` -- charstring: Class name
%    - `~+replab.+infra.ClassData.ownMethods` -- row cell array of `+replab.+infra.FunctionLikeData`: Data about methods
%    - `~+replab.+infra.ClassData.ownProperties` -- row cell array of `+replab.+infra.PropertyData`: Data about properties
%    - `~+replab.+infra.ClassData.parse` -- Parses a full class definition
%    - `~+replab.+infra.ClassData.parseBlank` -- Parses a blank line
%    - `~+replab.+infra.ClassData.parseClassElement` -- Parses an element that can appear in a class definition
%    - `~+replab.+infra.ClassData.parseComment` -- Parses a comment line
%    - `~+replab.+infra.ClassData.parseMethods` -- Parses a methods block
%    - `~+replab.+infra.ClassData.parseMethodsElement` -- Parses an element that can appear in a methods block
%    - `~+replab.+infra.ClassData.parseProperties` -- Parses a properties block
%    - `~+replab.+infra.ClassData.parsePropertiesElement` -- Parses an element that can appear in a properties block
%    - `~+replab.+infra.ClassData.parseProperty` -- 
%    - `~+replab.+infra.ClassData.shortStr` -- Single line text description of the current object
%    - `~+replab.+infra.ClassData.superclassIdentifiers` -- row cell array of charstring: Full qualified names of parent identifiers
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


    properties
        name % charstring: Class name
        superclassIdentifiers % row cell array of charstring: Full qualified names of parent identifiers
        docLines % row cell array of charstring: Documentation comment lines stripped of leading whitespace and leading ``%``
        docLineNumbers % row integer vector: Line numbers of the documentation comment
        ownMethods % row cell array of `+replab.+infra.FunctionLikeData`: Data about methods
        ownProperties % row cell array of `+replab.+infra.PropertyData`: Data about properties
    end

    methods

        function self = ClassData(name, superclassIdentifiers, docLines, docLineNumbers, ownMethods, ownProperties)
            self.name = name;
            self.superclassIdentifiers = superclassIdentifiers;
            self.docLines = docLines;
            self.docLineNumbers = docLineNumbers;
            self.ownMethods = ownMethods;
            self.ownProperties = ownProperties;
        end

    end

    methods (Static)

        function res = parseBlank(ct, pos)
        % Parses a blank line
            res = ct.expect(pos, ' ');
        end

        function res = parseComment(ct, pos)
        % Parses a comment line
            res = ct.expect(pos, '%');
        end

        function [res met] = parseMethodsElement(ct, pos, attributes)
        % Parses an element that can appear in a methods block
            met = [];
            res = replab.infra.ClassData.parseBlank(ct, pos);
            if ~isempty(res)
                return
            end
            res = replab.infra.ClassData.parseComment(ct, pos);
            if ~isempty(res)
                return
            end
            [res met] = replab.infra.FunctionLikeData.parse(ct, pos, attributes);
            if ~isempty(res)
                return
            end
            res = [];
            met = [];
        end

        function [pos mets] = parseMethods(ct, pos)
        % Parses a methods block
            mets = {};
            [pos line] = ct.expect(pos, 'm');
            if isempty(pos)
                return
            end
            % Remove an eventual comment
            parts = strsplit(line, '%');
            line = strtrim(parts{1});
            if isequal(line, 'methods')
                % No attributes
                attributes = struct;
            else
                % Has attributes
                tokens = regexp(line, '^methods\s*\((.*)\)$', 'tokens', 'once');
                if length(tokens) ~= 1
                    replab.infra.parseError(ct, pos, 'Was expecting attributes, but unknown format encountered');
                end
                attributes = replab.infra.parseAttributes(tokens{1});
            end
            while 1
                [res met] = replab.infra.ClassData.parseMethodsElement(ct, pos, attributes);
                if isempty(res)
                    break
                else
                    if ~isempty(met)
                        mets{1,end+1} = met;
                    end
                    pos = res;
                end
            end
            [res line] = ct.expect(pos, '<');
            if isempty(res)
                replab.infra.parseError(ct, pos, 'Expected ''end'' token here');
            end
            pos = res;
        end

        function [pos prop] = parseProperty(ct, pos, attributes, packageNameParts, className, filename)
            [pos prop] = replab.infra.PropertyData.parse(ct, pos, attributes);
            if isempty(pos)
                prop = [];
            end
        end

        function [res prop] = parsePropertiesElement(ct, pos, attributes)
        % Parses an element that can appear in a properties block
            prop = [];
            res = replab.infra.ClassData.parseBlank(ct, pos);
            if ~isempty(res)
                return
            end
            res = replab.infra.ClassData.parseComment(ct, pos);
            if ~isempty(res)
                return
            end
            [res prop] = replab.infra.ClassData.parseProperty(ct, pos, attributes);
            if ~isempty(res)
                return
            end
            res = [];
            prop = [];
        end

        function [pos props] = parseProperties(ct, pos)
        % Parses a properties block
            props = {};
            [pos line] = ct.expect(pos, 'p');
            if isempty(pos)
                return
            end
            % Remove an eventual comment
            parts = strsplit(line, '%');
            line = strtrim(parts{1});
            if isequal(line, 'properties')
                % No attributes
                attributes = struct;
            else
                % Has attributes
                tokens = regexp(line, '^properties\s*\((.*)\)$', 'tokens', 'once');
                if length(tokens) ~= 1
                    replab.infra.parseError(ct, pos, 'Was expecting attributes, but unknown format encountered');
                end
                attributes = replab.infra.parseAttributes(tokens{1});
            end
            while 1
                [res prop] = replab.infra.ClassData.parsePropertiesElement(ct, pos, attributes);
                if isempty(res)
                    break
                else
                    if ~isempty(prop)
                        props{1,end+1} = prop;
                    end
                    pos = res;
                end
            end
            [res line] = ct.expect(pos, '<');
            if isempty(res)
                replab.infra.parseError(ct, pos, 'Expected ''end'' token here');
            end
            pos = res;
        end

        function [res mets props] = parseClassElement(ct, pos)
        % Parses an element that can appear in a class definition
            mets = {};
            props = {};
            res = replab.infra.ClassData.parseBlank(ct, pos);
            if ~isempty(res)
                return
            end
            res = replab.infra.ClassData.parseComment(ct, pos);
            if ~isempty(res)
                return
            end
            [res props] = replab.infra.ClassData.parseProperties(ct, pos);
            if ~isempty(res)
                return
            end
            mets = {};
            props = {};
            [res mets] = replab.infra.ClassData.parseMethods(ct, pos);
            if ~isempty(res)
                return
            end
            res = [];
            mets = {};
            props = {};
        end

        function c = parse(ct)
        % Parses a full class definition
            pos = 1;
            [res line] = ct.expect(pos, 'c');
            if isempty(res)
                replab.infra.parseError(ct, pos, 'Expected class definition here');
            end
            pos = res;
            tokens = cellfun(@strtrim, regexp(line, '[&<]', 'split'), 'uniform', 0);
            matches = regexp(tokens{1}, '^classdef\s+(\w+)$', 'tokens', 'once');
            name = matches{1};
            if ~isequal(name, ct.sourceIdentifier)
                replab.infra.parseError(ct, pos, 'Class declaration name %s does not match filename %s.m', ...
                                        name, ct.sourceIdentifier);
            end
            parentNames = tokens(2:end);
            [res docLines docLineNumbers] = replab.infra.parseDocLines(ct, pos);
            if isempty(res)
                replab.infra.parseError(ct, pos, 'Unable to parse documentation');
            end
            pos = res;
            mets = {};
            props = {};
            while 1
                [res newMets newProps] = replab.infra.ClassData.parseClassElement(ct, pos);
                if isempty(res)
                    break
                else
                    pos = res;
                    mets = horzcat(mets, newMets);
                    props = horzcat(props, newProps);
                end
            end
            res = ct.expect(pos, '<');
            if isempty(res)
                replab.infra.parseError(ct, pos, 'Expected ''end'' token here');
            end
            pos = res;
            c = replab.infra.ClassData(name, parentNames, docLines, docLineNumbers, mets, props);
        end

    end

end
