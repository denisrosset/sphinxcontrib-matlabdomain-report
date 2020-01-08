classdef Element < replab.Str
% A code base element which can be retrieved from an identifier
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+infra.Element.Element` -- 
%    - `~+replab.+infra.Element.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+infra.Element.children` -- Returns a cell vector of the children of this element
%    - `~+replab.+infra.Element.childrenNames` -- Returns a cell vector of the children names of this element
%    - `~+replab.+infra.Element.codeBase` -- `replab.infra.CodeBase`: Code base this object is part of
%    - `~+replab.+infra.Element.disp` -- 
%    - `~+replab.+infra.Element.eq` -- Equality test
%    - `~+replab.+infra.Element.fullIdentifier` -- Returns the full identifier corresponding to this object
%    - `~+replab.+infra.Element.get` -- Retrieves a (grand) child of this element from path elements
%    - `~+replab.+infra.Element.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+infra.Element.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+infra.Element.longStr` -- Multi-line description of the current object
%    - `~+replab.+infra.Element.lookup` -- Returns a package element if present
%    - `~+replab.+infra.Element.matlabDomainIdentifier` -- Returns the Sphinx MATLAB domain identifier corresponding to this object
%    - `~+replab.+infra.Element.name` -- charstring: Name of the current element, i.e. last part of its identifier
%    - `~+replab.+infra.Element.parent` -- Returns the parent element of this element, or ``[]`` if this element is root
%    - `~+replab.+infra.Element.path` -- Returns the path of this identifier as a cell vector of strings
%    - `~+replab.+infra.Element.shmIdentifier` -- Returns the fieldname-encoded identifier corresponding to this object
%    - `~+replab.+infra.Element.shortStr` -- Single line text description of the current object
%    - `~+replab.+infra.Element.splitPath` -- Returns the package path and the element relative path
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
        codeBase % `replab.infra.CodeBase`: Code base this object is part of
        name % charstring: Name of the current element, i.e. last part of its identifier
    end

    methods % Abstract methods

        function [packagePath elementPath] = splitPath(self)
        % Returns the package path and the element relative path
        %
        % For example, this could be ``{'replab'}, {'Group' 'compose'}``
            error('Abstract');
        end

        function c = childrenNames(self)
        % Returns a cell vector of the children names of this element
            error('Abstract');
        end

        function e = lookup(self, id)
        % Returns a package element if present
        %
        % Args:
        %   id (charstring): Package element identifier
        %
        % Returns:
        %   `replab.infra.Element` or []: Package element, or ``[]`` if not found
            error('Abstract');
        end

    end

    methods

        function self = Element(codeBase, name)
            if nargin >= 1
                self.codeBase = codeBase;
            end
            if nargin >= 2
                self.name = name;
            end
        end

        % replab.Str methods

        function [names values] = additionalFields(self)
            [names values] = additionalFields@replab.Str(self);
            c = self.childrenNames;
            for i = 1:length(c)
                names{1,end+1} = sprintf('get(''%s'')', c{i});
                values{1,end+1} = self.get(c{i});
            end
        end

        function str = headerStr(self)
            kind = strsplit(class(self), '.');
            kind = kind{end};
            str = sprintf('%s (%s)', kind, self.fullIdentifier);
        end

        % Own methods

        function c = children(self)
        % Returns a cell vector of the children of this element
            c = cellfun(@(n) self.lookup(n), self.childrenNames, 'uniform', 0);
        end

        function p = parent(self)
        % Returns the parent element of this element, or ``[]`` if this element is root
            if isempty(self.path)
                p = [];
            else
                pp = self.path;
                pp = pp(1:end-1);
                p = self.codeBase.get(pp{:});
            end
        end

        function e = get(self, varargin)
        % Retrieves a (grand) child of this element from path elements
            if isempty(varargin) || isempty(varargin{1})
                e = self;
            else
                id = varargin{1};
                rest = varargin(2:end);
                child = self.lookup(varargin{1});
                if isempty(child)
                    if isempty(rest)
                        restStr = '';
                    else
                        restStr = ['.[' strjoin(rest, '.') ']'];
                    end
                    error('Member %s%s not found in element %s', id, restStr, self.fullIdentifier);
                end
                e = child.get(rest{:});
            end
        end

        function p = path(self)
        % Returns the path of this identifier as a cell vector of strings
            [p1 p2] = self.splitPath;
            p = horzcat(p1, p2);
        end

        function id = fullIdentifier(self)
        % Returns the full identifier corresponding to this object
        %
        % For example, this could be 'replab.Group.compose'
            id = strjoin(self.path, '.');
        end

        function id = matlabDomainIdentifier(self)
        % Returns the Sphinx MATLAB domain identifier corresponding to this object
        %
        % For example, this could be '+replab.Group.compose'
            [pkgPath elPath] = self.splitPath;
            pkgPath = cellfun(@(p) ['+' p], pkgPath, 'uniform', 0);
            id = strjoin(horzcat(pkgPath, elPath), '.');
        end

        function id = shmIdentifier(self)
        % Returns the fieldname-encoded identifier corresponding to this object
        %
        % For example, this could be `replab__Group__compose`
            id = replab.infra.shm.encode(self.path);
        end

    end

end
