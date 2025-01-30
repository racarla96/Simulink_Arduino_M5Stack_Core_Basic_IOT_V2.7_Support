classdef ESP32WROOMM5StackBoard < codertarget.arduinobase.board.ESP32WROOMBase
    
    % Copyright 2022 The MathWorks, Inc.
    methods
        function obj = ESP32WROOMM5StackBoard
            %BoardName
            obj.BoardName = "ESP32WROOMM5StackBoard";

            %ESP32 specific settings
            obj.ESP32CPUFrequency = '240000000L';           %  build.f_cpu
            obj.ESP32BoardName = 'ESP32_DEV';               %  build.board
            obj.ESP32FlashMode = 'dio';                     %  build.flash_mode
            obj.ESP32FlashFrequency = '80m';                %  build.flash_freq
            obj.ESP32FlashSize = '16MB';                    %  menu.FlashSize
            obj.ESP32PartitionsScheme = 'default';          %  menu.PartitionScheme.*.build.partitions
            obj.ESP32Defines = '';                          %  build.defines
            obj.ESP32ExtraFlags = '';                       %  build.extra_flags
            obj.ESP32LinkerExtraLibs = '';                  %  build.extra_libs  
            obj.ESP32ProgramMemory = 1310720;               %  upload.maximum_size
            obj.ESP32DataMemory = 327680;                   %  upload.maximum_data_size
            obj.ESP32Module = 'ESP32-WROOM';

            %Digital Input
            obj.DigitalInputPins = [1:5 12:19 21:23 25:27 32:39]; 
			
            %Digital Output
            obj.DigitalOutputPins = [1:5 12:19 21:23 25:27 32:33]; 

            %Analog Input
            obj.AnalogPins = [0 3:7 10 12:19];
            obj.AnalogPinRef = [36 39 32 33 34 35 4 2 15 13 12 14 27 25 26];

            %External Interrupt
            obj.InterruptPins = {'1','2','3','4','5',...
            '12','13','14','15','16','17','18','19',...
            '21','22','23','25','26','27',...
            '32','33','34','35','36','39'};
            obj.InterruptModes = {'LOW','CHANGE','RISING','FALLING'};

            %PWM
            obj.PWMPins = [1:5 12:19 21:23 25:27 32:33]; 
            obj.PWMTimers = [1:5 12:19 21:23 25:27 32:33]; 
            obj.PWMInvalidPins = [];

            %Servo
            obj.ServoPins = [1:5 12:19 21:23 25:27 32:33]; 

            %Ultrasonic
            obj.UltrasonicPins = [1:5 12:19 21:23 25:27 32:33]; 

            %SPI
            obj.SPIModules = 1;
            obj.SPIMOSIPin = 23;
            obj.SPIMISOPin = 19;
            obj.SPICLKPin = 18;
            obj.SPICSPins = [1:5 12:19 21:23 25:27 32:33]; 
        end
    end
end
