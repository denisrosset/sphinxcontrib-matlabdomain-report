classdef Doc < replab.Str
% Contents of a documentation block comment
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+infra.Doc.Doc` -- 
%    - `~+replab.+infra.Doc.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+infra.Doc.content` -- Returns the lines joined with newlines
%    - `~+replab.+infra.Doc.disp` -- 
%    - `~+replab.+infra.Doc.eq` -- Equality test
%    - `~+replab.+infra.Doc.firstLine` -- Returns the first line of the documentation comment block
%    - `~+replab.+infra.Doc.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+infra.Doc.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+infra.Doc.isempty` -- 
%    - `~+replab.+infra.Doc.line` -- Returns the i-th line of this documentation comment block
%    - `~+replab.+infra.Doc.lineNumbers` -- row integer vector: Line numbers
%    - `~+replab.+infra.Doc.lines` -- row cell array of charstring: Trimmed documentation lines
%    - `~+replab.+infra.Doc.longStr` -- Multi-line description of the current object
%    - `~+replab.+infra.Doc.nLines` -- Returns the number of lines in this documentation comment block
%    - `~+replab.+infra.Doc.parent` -- `.SourceElement`: Member containing this documentation
%    - `~+replab.+infra.Doc.shortStr` -- Single line text description of the current object
%
% .. admonition:: Inherited elements
%    :class: collapsed
%
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
        parent % `.SourceElement`: Member containing this documentation
        lines % row cell array of charstring: Trimmed documentation lines
        lineNumbers % row integer vector: Line numbers
    end

    methods

        function self = Doc(parent, rawLines, lineNumbers)
            self.parent = parent;
            self.lines = replab.infra.uniformLeftTrim(rawLines);
            self.lineNumbers = lineNumbers;
        end

        function c = content(self)
        % Returns the lines joined with newlines
            c = strjoin(self.lines, char(10));
        end

        function n = nLines(self)
        % Returns the number of lines in this documentation comment block
            n = length(self.lines);
        end

        function l = line(self, i)
        % Returns the i-th line of this documentation comment block
            l = self.lines{i};
        end

        function fl = firstLine(self)
        % Returns the first line of the documentation comment block
        %
        % Care is taken to return an empty string if the comment block is empty,
        % and to add trailing ``...`` if for some reason the first paragraph
        % spans multiple lines.
            switch self.nLines
              case 0
                fl = '';
              case 1
                fl = self.line(1);
              otherwise
                if isempty(self.line(2))
                    fl = self.line(1);
                else
                    fl = [self.line(1) ' ...'];
                end
            end
        end

        function [names values] = additionalFields(self)
            [names values] = additionalFields@replab.Str(self);
            if ~isempty(lines)
                names{1,end+1} = 'firstLine';
                values{1,end+1} = self.firstLine;
            end
        end

        function b = isempty(self)
            b = true;
            for i = 1:length(self.lines)
                b = b && isempty(strtrim(self.lines{i}));
            end
        end

    end

end
