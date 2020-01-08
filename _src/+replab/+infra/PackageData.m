classdef PackageData < replab.Str
%
% .. admonition:: Class members list
%    :class: collapsed
%
%    - `~+replab.+infra.PackageData.PackageData` -- 
%    - `~+replab.+infra.PackageData.additionalFields` -- Returns the name/value pairs corresponding to additional fields to be printed
%    - `~+replab.+infra.PackageData.disp` -- 
%    - `~+replab.+infra.PackageData.eq` -- Equality test
%    - `~+replab.+infra.PackageData.headerStr` -- Tiny single line description of the current object type
%    - `~+replab.+infra.PackageData.hiddenFields` -- Returns the names of the fields that are not printed as a row vector
%    - `~+replab.+infra.PackageData.longStr` -- Multi-line description of the current object
%    - `~+replab.+infra.PackageData.ownClasses` -- row cell vector of `+replab.+infra.ClassData`: Data of classes
%    - `~+replab.+infra.PackageData.ownFunctions` -- row cell vector of `+replab.+infra.FunctionLikeData`: Data of functions
%    - `~+replab.+infra.PackageData.path` -- row cell vector of charstring: path of the package
%    - `~+replab.+infra.PackageData.shortStr` -- Single line text description of the current object
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
        path % row cell vector of charstring: path of the package
        ownFunctions % row cell vector of `+replab.+infra.FunctionLikeData`: Data of functions
        ownClasses % row cell vector of `+replab.+infra.ClassData`: Data of classes
    end

    methods

        function self = PackageData(path, ownFunctions, ownClasses)
            self.path = path;
            self.ownFunctions = ownFunctions;
            self.ownClasses = ownClasses;
        end

    end

end
