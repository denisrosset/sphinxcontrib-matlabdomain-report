classdef PropertyData < replab.Str
% Describes the data recovered when parsing a MATLAB class property
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+infra.PropertyData.PropertyData` -- 
%    - `~+replab.+infra.PropertyData.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+infra.PropertyData.attributes` -- struct: Attributes from the ``properties`` block
%    - `~+replab.+infra.PropertyData.declarationLineNumber` -- integer: Line number of the property declaration
%    - `~+replab.+infra.PropertyData.disp` -- 
%    - `~+replab.+infra.PropertyData.docLineNumbers` -- row integer vector: Line numbers of the documentation comment
%    - `~+replab.+infra.PropertyData.docLines` -- row cell array of charstring: Documentation comment lines stripped of leading whitespace and leading ``%``
%    - `~+replab.+infra.PropertyData.eq` -- Equality test
%    - `~+replab.+infra.PropertyData.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+infra.PropertyData.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+infra.PropertyData.longStr` -- Multi-line description of the current object
%    - `~+replab.+infra.PropertyData.name` -- charstring: Property name
%    - `~+replab.+infra.PropertyData.parse` -- Parses a property definition
%    - `~+replab.+infra.PropertyData.shortStr` -- Single line text description of the current object
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
        name % charstring: Property name
        declarationLineNumber % integer: Line number of the property declaration
        docLines % row cell array of charstring: Documentation comment lines stripped of leading whitespace and leading ``%``
        docLineNumbers % row integer vector: Line numbers of the documentation comment
                       %
                       %                     Overlaps with `declarationLineNumber`
        attributes % struct: Attributes from the ``properties`` block
    end
    
    methods

        function self = PropertyData(name, declarationLineNumber, docLines, docLineNumbers, attributes)
            self.name = name;
            self.declarationLineNumber = declarationLineNumber;
            self.docLines = docLines;
            self.docLineNumbers = docLineNumbers;
            self.attributes = attributes;
        end
        
    end
    
    methods (Static)
       
        function [pos pd] = parse(ct, pos, attributes)
        % Parses a property definition
        %
        % The formats can be
        %
        % name
        % name;
        % name = value
        % name = value;
        %
        % followed eventually by a comment as in
        %
        % name = value; % documentation comment
        %
        % and possibly multiline comments as in
        %
        % name = value; % documentation comment
        %               % comment continued
            startPos = pos;
            [pos line] = ct.expect(pos, '!');
            if isempty(pos)
                pd = [];
                return
            end
            
            % splits the property line around a possible % indicating a comment
            parts = strsplit(line, '%');
            def = parts{1};
            firstDocLine = strjoin(parts(2:end), '%');
            
            % splits the property code to get the property name (i.e. anything before the first = or ;)
            parts = regexp(def, '[=;]', 'split');
            name = strtrim(parts{1});
            if isempty(name)
                replab.infra.parseError(ct, startPos, 'Cannot find property name');
            end
            if ~isempty(regexp(name, '__'))
                replab.infra.parseError(ct, pos, 'Name of method/function cannot contain double underscore');
            end
            if isempty(firstDocLine)
                docLines = {};
                docLineNumbers = [];
            else
                docLines = {firstDocLine};
                docLineNumbers = startPos;
                l = 2;
                while 1
                    [res line] = ct.expect(pos, '%');
                    if isempty(res)
                        break
                    else
                        content = line(2:end);
                        if l == 2 && ~isempty(strtrim(content))
                            replab.infra.parseWarning(ct, pos, 'Second documentation comment line should be empty');
                        end
                        docLines{1,l} = content;
                        docLineNumbers(1,l) = pos;
                        pos = res;
                    end
                    l = l + 1;
                end
            end
            pd = replab.infra.PropertyData(name, startPos, docLines, docLineNumbers, attributes);
        end
        
    end

end
