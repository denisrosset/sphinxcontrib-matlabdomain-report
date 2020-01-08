classdef Declarations < replab.Str
% Describes all the declarations of a class element
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+infra.Declarations.Declarations` -- 
%    - `~+replab.+infra.Declarations.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+infra.Declarations.bestEffortDocFirstLine` -- 
%    - `~+replab.+infra.Declarations.classElement` -- `.ClassElement`: Class element investigated
%    - `~+replab.+infra.Declarations.codeBase` -- `.CodeBase`: Code base we look in
%    - `~+replab.+infra.Declarations.disp` -- 
%    - `~+replab.+infra.Declarations.eq` -- Equality test
%    - `~+replab.+infra.Declarations.findAll` -- Returns all declarations of the method/property
%    - `~+replab.+infra.Declarations.findBest` -- 
%    - `~+replab.+infra.Declarations.findBestDocumented` -- Returns the documented declaration with highest priority
%    - `~+replab.+infra.Declarations.findDocumentedElements` -- Returns all declarations of the method/property that have documentation
%    - `~+replab.+infra.Declarations.hasDoc` -- 
%    - `~+replab.+infra.Declarations.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+infra.Declarations.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+infra.Declarations.longStr` -- Multi-line description of the current object
%    - `~+replab.+infra.Declarations.shortStr` -- Single line text description of the current object
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
        codeBase % `.CodeBase`: Code base we look in
        classElement % `.ClassElement`: Class element investigated
    end

    methods

        function self = Declarations(codeBase, classElement)
            self.codeBase = codeBase;
            self.classElement = classElement;
        end

        % replab.Str

        function str = headerStr(self)
            str = sprintf('All declarations of %s', self.classElement.fullIdentifier);
        end

        % Own methods

        function els = findAll(self)
        % Returns all declarations of the method/property
            cl = self.classElement.parentClass;
            name = self.classElement.name;
            % concatenate the class under investigation and superclasses
            cls = horzcat({cl}, cl.allSuperclasses);
            % find all classes which have a declaration of our element
            mask = cellfun(@(c) isfield(c.ownElementsStruct, name), cls);
            % select those
            cls = cls(mask);
            % find members
            els = cellfun(@(c) c.ownElementsStruct.(name), cls, 'uniform', 0);
        end

        function el = findBest(self)
            els = self.findAll;
            el = els{1};
        end

        function els = findDocumentedElements(self)
        % Returns all declarations of the method/property that have documentation
            els = self.findAll;
            mask = cellfun(@(e) ~e.doc.isempty, els);
            els = els(mask);
        end

        function l = bestEffortDocFirstLine(self)
            el = self.findBestDocumented;
            if isempty(el)
                l = '';
            else
                l = el.doc.firstLine;
                if isempty(l)
                    l = '';
                end
            end
        end

        function b = hasDoc(self)
            b = ~isempty(self.findBestDocumented);
        end

        function el = findBestDocumented(self)
        % Returns the documented declaration with highest priority
            els = self.findDocumentedElements;
            if isempty(els)
                el = [];
            else
                el = els{1};
            end
        end

    end

end
