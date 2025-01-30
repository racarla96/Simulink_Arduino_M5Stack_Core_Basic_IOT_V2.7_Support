classdef M5Stack_Core < realtime.internal.SourceSampleTime & ...
        coder.ExternalDependency
    %
    % System object template for a source block.
    % 
    % This template includes most, but not all, possible properties,
    % attributes, and methods that you can implement for a System object in
    % Simulink.
    %
    % NOTE: When renaming the class name Source, the file name and
    % constructor name must be updated to use the class name.
    %
    
    % Copyright 2016-2018 The MathWorks, Inc.
    %#codegen
    %#ok<*EMCA>
    
    properties
        % Public, tunable properties.
    end
    
    properties (Nontunable)
        % Public, non-tunable properties.
    end
    
    properties (Access = private)
        % Pre-computed constants.
    end
    
    methods
        % Constructor
        function obj = M5Stack_Core(varargin)
            % Support name-value pair arguments when constructing the object.
            setProperties(obj,nargin,varargin{:});
        end
    end
    
    methods (Access=protected)
        function setupImpl(obj) %#ok<MANU>
            if isempty(coder.target)
                % Place simulation setup code here
            else
                % Call C-function implementing device initialization
                % coder.cinclude('source.h');
                % coder.ceval('source_init');
            end
        end
        
        function stepImpl(obj)   %#ok<MANU>
            if isempty(coder.target)
                % Place simulation output code here
            else
                % Call C-function implementing device output
            end
        end
        
        function releaseImpl(obj) %#ok<MANU>
            if isempty(coder.target)
                % Place simulation termination code here
            else
                % Call C-function implementing device termination
            end
        end
    end
    
    methods (Access=protected)
        %% Define output properties
        function num = getNumInputsImpl(~)
            num = 0;
        end
        
        function num = getNumOutputsImpl(~)
            num = 0;
        end
        
        function icon = getIconImpl(~)
            % Define a string as the icon for the System block in Simulink.
            icon = 'M5Stack Core';
        end    
    end
    
    methods (Static, Access=protected)
        function simMode = getSimulateUsingImpl(~)
            simMode = 'Interpreted execution';
        end
        
        function isVisible = showSimulateUsingImpl
            isVisible = false;
        end
    end
    
    methods (Static)
        function name = getDescriptiveName()
            name = 'Source';
        end
        
        function b = isSupportedContext(context)
            b = context.isCodeGenTarget('rtw');
        end
        
        function updateBuildInfo(buildInfo, context)
            if context.isCodeGenTarget('rtw')
                % Update buildInfo
                srcDir = fullfile(fileparts(mfilename('fullpath')),'src');
                includeDir = fullfile(fileparts(mfilename('fullpath')),'include');
                libDir =  fullfile(fileparts(mfilename('fullpath')),'libraries');
                % libDirA =  fullfile(fileparts(mfilename('fullpath')),'libraries/Adafruit_BusIO');
                % libDirB =  fullfile(fileparts(mfilename('fullpath')),'libraries/Adafruit_Motor_Shield_V2_Library');
                % libDirBA =  fullfile(fileparts(mfilename('fullpath')),'libraries/Adafruit_Motor_Shield_V2_Library/utility');

                % Include header files
                addIncludePaths(buildInfo,includeDir);
                addIncludePaths(buildInfo,libDir);
                % addIncludePaths(buildInfo,libDirA);
                % addIncludePaths(buildInfo,libDirB);
                % addIncludePaths(buildInfo,libDirBA);
                % 
                % % Include source files
                % addSourceFiles(buildInfo,'AFMSV2Driver.cpp',srcDir);
                % addSourceFiles(buildInfo,'Adafruit_I2CDevice.cpp',libDirA);
                % addSourceFiles(buildInfo,'Adafruit_MotorShield.cpp',libDirB);
                % addSourceFiles(buildInfo,'Adafruit_MS_PWMServoDriver.cpp',libDirBA);
    
                boardInfo = arduino.supportpkg.getBoardInfo;

                disp(boardInfo)

                switch boardInfo.Architecture
                    % case 'v'
                    otherwise
                        warning('Unexpected board type. Check again.')
                end
                

                % Use the following API's to add include files, sources and
                % linker flags
                %addIncludeFiles(buildInfo,'source.h',includeDir);
                %addSourceFiles(buildInfo,'source.c',srcDir);
                %addLinkFlags(buildInfo,{'-lSource'});
                %addLinkObjects(buildInfo,'sourcelib.a',srcDir);
                %addCompileFlags(buildInfo,{'-D_DEBUG=1'});
                %addDefines(buildInfo,'MY_DEFINE_1')
            end
        end
    end
end
