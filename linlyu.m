classdef linlyu < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        WaterQualityInformationSystemUIFigure  matlab.ui.Figure
        GridLayout                   matlab.ui.container.GridLayout
        LeftPanel                    matlab.ui.container.Panel
        YearSelectionDropDownLabel   matlab.ui.control.Label
        YearSelectionDropDown        matlab.ui.control.DropDown
        UITable                      matlab.ui.control.Table
        ChangeDataEditFieldLabel     matlab.ui.control.Label
        ChangeData                   matlab.ui.control.NumericEditField
        ReadDataButton               matlab.ui.control.Button
        ChangeDataButton             matlab.ui.control.Button
        MonthSelectionDropDownLabel  matlab.ui.control.Label
        MonthSelectionDropDown       matlab.ui.control.DropDown
        OriginalDataEditFieldLabel   matlab.ui.control.Label
        OriginalData                 matlab.ui.control.NumericEditField
        InquireSingleDataButton      matlab.ui.control.Button
        RightPanel                   matlab.ui.container.Panel
        UIAxes2                      matlab.ui.control.UIAxes
        ParameterSelectionDropDownLabel  matlab.ui.control.Label
        ParameterSelectionDropDown   matlab.ui.control.DropDown
        ImageSelectionDropDownLabel  matlab.ui.control.Label
        ImageSelectionDropDown       matlab.ui.control.DropDown
        AverageValueEditFieldLabel   matlab.ui.control.Label
        Result                       matlab.ui.control.NumericEditField
        PlotButton                   matlab.ui.control.Button
    end

    % Properties that correspond to apps with auto-reflow
    properties (Access = private)
        onePanelWidth = 576;
    end

    
    properties (Access = private)
        % initial environmental related data
        current_data = [];
        current_data0 = [];
        %
        current_title0='Plot of Dissolved Oxygen'
        current_title1 = ' in a year'
    end
    
    methods (Access = private)
        function results = resetButtonBackground(app)
            % Change the background color and title
            title1 = strcat(app.current_title0, app.current_title1)
            title(app.UIAxes2, title1)
            app.PlotButton.BackgroundColor='yellow'
        end
    end


    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            % Import the initial data form
            app.current_data = xlsread('Data.xlsx');
            t=readtable("Data.xlsx","Sheet",1);
            app.UITable.Data=t;
            % Add columnName for the table
            t.Properties.VariableNames{1}='Year';
            t.Properties.VariableNames{2}='Months Index';
            t.Properties.VariableNames{3}='Dissolved Oxygen';
            t.Properties.VariableNames{4}='permanganate index';
            t.Properties.VariableNames{5}='BOD5';
            t.Properties.VariableNames{6}='Ammonia nitrogen';
            t.Properties.VariableNames{7}='Petroleum';
            t.Properties.VariableNames{8}='Volatile Penol';
            t.Properties.VariableNames{9}='CODcr';
            t.Properties.VariableNames{10}='Total nitrogen';
            t.Properties.VariableNames{11}='Total phosphorus';
            t.Properties.VariableNames{12}='Sulfuret';
            t.Properties.VariableNames{13}='Number of paracolon';
            app.UITable.ColumnName=t.Properties.VariableNames;
            app.PlotButton.BackgroundColor='yellow'
            
            % Plot the initial figure
            app.current_data=xlsread('Data.xlsx', 'C2:C13');
            x = 1:12;
            plot(app.UIAxes2,x,app.current_data(1:12,1),'b--o');
            title1 = strcat(app.current_title0, app.current_title1)
            title(app.UIAxes2, title1)
            
            % Define the initial inquired single data
            app.current_data0=app.current_data(1,1);
            
            % Turn on the grid
            grid(app.UIAxes2, 'on');
            app.UIAxes2.XTick = [1 2 3 4 5 6 7 8 9 10 11 12];
            grid(app.UIAxes2, 'minor');
        end

        % Button pushed function: PlotButton
        function PlotButtonPushed(app, event)
            resetButtonBackground(app)
            app.PlotButton.BackgroundColor='blue'
            title1 = strcat(app.current_title0, app.current_title1)
            title(app.UIAxes2, title1)
            
            % Plot the corresponding figure
            x = 1:12;
            plot(app.UIAxes2,x,app.current_data(1:12,1),'b--o');
            
            %Calculate the average value
            app.Result.Value = sum(app.current_data(1:12,1))/12;
        end

        % Button pushed function: ReadDataButton
        function ReadDataButtonPushed(app, event)
            t=readtable("Data.xlsx","Sheet",2);
            app.UITable.Data=t;
            % Define column names for each column
            t.Properties.VariableNames{1}='Year';
            t.Properties.VariableNames{2}='Months Index';
            t.Properties.VariableNames{3}='Dissolved Oxygen';
            t.Properties.VariableNames{4}='permanganate index';
            t.Properties.VariableNames{5}='BOD5';
            t.Properties.VariableNames{6}='Ammonia nitrogen';
            t.Properties.VariableNames{7}='Petroleum';
            t.Properties.VariableNames{8}='Volatile Penol';
            t.Properties.VariableNames{9}='CODcr';
            t.Properties.VariableNames{10}='Total nitrogen';
            t.Properties.VariableNames{11}='Total phosphorus';
            t.Properties.VariableNames{12}='Sulfuret';
            t.Properties.VariableNames{13}='Number of paracolon';
            app.UITable.ColumnName=t.Properties.VariableNames;
            
        end

        % Value changed function: YearSelectionDropDown
        function YearSelectionDropDownValueChanged(app, event)
            value = app.YearSelectionDropDown.Value;
            switch value
                case '2018'   
            end   
        end

        % Value changed function: ParameterSelectionDropDown
        function ParameterSelectionDropDownValueChanged(app, event)
            value = app.ParameterSelectionDropDown.Value;
            switch value
                case 'Dissolved Oxygen'
                    app.current_data=xlsread('Data.xlsx', 'C2:C13');
                    app.current_title0='Plot of Dissolved Oxygen'
                    resetButtonBackground(app)
                case 'Permanganate Index'    
                    app.current_data=xlsread('Data.xlsx', 'D2:D13');
                    app.current_title0='Plot of Permanganate Index'
                    resetButtonBackground(app)
                case 'BOD5'    
                    app.current_data=xlsread('Data.xlsx', 'E2:E13');
                    app.current_title0='Plot of BOD5'
                    resetButtonBackground(app)
                case 'Ammonia nitrogen'    
                    app.current_data=xlsread('Data.xlsx', 'F2:F13');
                    app.current_title0='Plot of Ammonia nitrogen'
                    resetButtonBackground(app)
                case 'Petroleum'    
                    app.current_data=xlsread('Data.xlsx', 'G2:G13');
                    app.current_title0='Plot of Petroleum'
                    resetButtonBackground(app)
                case 'Volatile Penol'    
                    app.current_data=xlsread('Data.xlsx', 'H2:H13');
                    app.current_title0='Plot of Volatile Penol'
                    resetButtonBackground(app)
                case 'CODcr'    
                    app.current_data=xlsread('Data.xlsx', 'I2:I13');
                    app.current_title0='Plot of CODcr'
                    resetButtonBackground(app)
                case 'Total nitrogen'    
                    app.current_data=xlsread('Data.xlsx', 'J2:J13');
                    app.current_title0='Plot of Total nitrogen'
                    resetButtonBackground(app)
                case 'Total phosphorus'    
                    app.current_data=xlsread('Data.xlsx', 'K2:K13');
                    app.current_title0='Plot of Total phosphorus'
                    resetButtonBackground(app)
                case 'Sulfuret'    
                    app.current_data=xlsread('Data.xlsx', 'L2:L13');
                    app.current_title0='Plot of Sulfuret'
                    resetButtonBackground(app)
                case 'Number of paracolon'    
                    app.current_data=xlsread('Data.xlsx', 'M2:M13');
                    app.current_title0='Plot of Number of paracolon'
                    resetButtonBackground(app)
            end   
            
        end

        % Callback function
        function AverageValueEditFieldValueChanged(app, event)
       
        end

        % Value changed function: MonthSelectionDropDown
        function MonthSelectionDropDownValueChanged(app, event)
            value = app.MonthSelectionDropDown.Value;
            switch value
                case '1'    
                    app.current_data0=app.current_data(1,1);
                case '2'    
                    app.current_data0=app.current_data(2,1);
                case '3' 
                    app.current_data0=app.current_data(3,1);
                case '4' 
                    app.current_data0=app.current_data(4,1);
                case '5' 
                    app.current_data0=app.current_data(5,1);
                case '6' 
                    app.current_data0=app.current_data(6,1);
                case '7' 
                    app.current_data0=app.current_data(7,1);
                case '8' 
                    app.current_data0=app.current_data(8,1);
                case '9' 
                    app.current_data0=app.current_data(9,1);
                case '10' 
                    app.current_data0=app.current_data(10,1);
                case '11' 
                    app.current_data0=app.current_data(11,1);
                case '12' 
                    app.current_data0=app.current_data(12,1);
            end      
        end

        % Button pushed function: InquireSingleDataButton
        function InquireSingleDataButtonPushed(app, event)
            app.OriginalData.Value = sum(app.current_data0(:,:));
        end

        % Button pushed function: ChangeDataButton
        function ChangeDataButtonPushed(app, event)
            app.OriginalData.Value = app.ChangeData.Value;
            app.current_data(1,1) = app.ChangeData.Value;
        end

        % Changes arrangement of the app based on UIFigure width
        function updateAppLayout(app, event)
            currentFigureWidth = app.WaterQualityInformationSystemUIFigure.Position(3);
            if(currentFigureWidth <= app.onePanelWidth)
                % Change to a 2x1 grid
                app.GridLayout.RowHeight = {480, 480};
                app.GridLayout.ColumnWidth = {'1x'};
                app.RightPanel.Layout.Row = 2;
                app.RightPanel.Layout.Column = 1;
            else
                % Change to a 1x2 grid
                app.GridLayout.RowHeight = {'1x'};
                app.GridLayout.ColumnWidth = {303, '1x'};
                app.RightPanel.Layout.Row = 1;
                app.RightPanel.Layout.Column = 2;
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create WaterQualityInformationSystemUIFigure and hide until all components are created
            app.WaterQualityInformationSystemUIFigure = uifigure('Visible', 'off');
            app.WaterQualityInformationSystemUIFigure.AutoResizeChildren = 'off';
            app.WaterQualityInformationSystemUIFigure.Position = [100 100 640 480];
            app.WaterQualityInformationSystemUIFigure.Name = 'Water Quality Information System';
            app.WaterQualityInformationSystemUIFigure.SizeChangedFcn = createCallbackFcn(app, @updateAppLayout, true);

            % Create GridLayout
            app.GridLayout = uigridlayout(app.WaterQualityInformationSystemUIFigure);
            app.GridLayout.ColumnWidth = {303, '1x'};
            app.GridLayout.RowHeight = {'1x'};
            app.GridLayout.ColumnSpacing = 0;
            app.GridLayout.RowSpacing = 0;
            app.GridLayout.Padding = [0 0 0 0];
            app.GridLayout.Scrollable = 'on';

            % Create LeftPanel
            app.LeftPanel = uipanel(app.GridLayout);
            app.LeftPanel.Title = 'Water quality information management system';
            app.LeftPanel.Layout.Row = 1;
            app.LeftPanel.Layout.Column = 1;

            % Create YearSelectionDropDownLabel
            app.YearSelectionDropDownLabel = uilabel(app.LeftPanel);
            app.YearSelectionDropDownLabel.HorizontalAlignment = 'right';
            app.YearSelectionDropDownLabel.Position = [28 423 78 22];
            app.YearSelectionDropDownLabel.Text = 'Year Selection';

            % Create YearSelectionDropDown
            app.YearSelectionDropDown = uidropdown(app.LeftPanel);
            app.YearSelectionDropDown.Items = {'2017', '2018'};
            app.YearSelectionDropDown.ValueChangedFcn = createCallbackFcn(app, @YearSelectionDropDownValueChanged, true);
            app.YearSelectionDropDown.Position = [119 423 71 22];
            app.YearSelectionDropDown.Value = '2017';

            % Create UITable
            app.UITable = uitable(app.LeftPanel);
            app.UITable.ColumnName = {'Column 1'; 'Column 2'; 'Column 3'; 'Column 4'};
            app.UITable.RowName = {};
            app.UITable.Position = [15 11 267 227];

            % Create ChangeDataEditFieldLabel
            app.ChangeDataEditFieldLabel = uilabel(app.LeftPanel);
            app.ChangeDataEditFieldLabel.HorizontalAlignment = 'right';
            app.ChangeDataEditFieldLabel.Position = [140 284 101.375 22];
            app.ChangeDataEditFieldLabel.Text = 'Change Data';

            % Create ChangeData
            app.ChangeData = uieditfield(app.LeftPanel, 'numeric');
            app.ChangeData.Position = [170 263 71 22];

            % Create ReadDataButton
            app.ReadDataButton = uibutton(app.LeftPanel, 'push');
            app.ReadDataButton.ButtonPushedFcn = createCallbackFcn(app, @ReadDataButtonPushed, true);
            app.ReadDataButton.Position = [189 424 93 21];
            app.ReadDataButton.Text = 'Read Data';

            % Create ChangeDataButton
            app.ChangeDataButton = uibutton(app.LeftPanel, 'push');
            app.ChangeDataButton.ButtonPushedFcn = createCallbackFcn(app, @ChangeDataButtonPushed, true);
            app.ChangeDataButton.Position = [28 273 89 22];
            app.ChangeDataButton.Text = 'Change Data';

            % Create MonthSelectionDropDownLabel
            app.MonthSelectionDropDownLabel = uilabel(app.LeftPanel);
            app.MonthSelectionDropDownLabel.HorizontalAlignment = 'right';
            app.MonthSelectionDropDownLabel.Position = [24 381 93 22];
            app.MonthSelectionDropDownLabel.Text = 'Month Selection';

            % Create MonthSelectionDropDown
            app.MonthSelectionDropDown = uidropdown(app.LeftPanel);
            app.MonthSelectionDropDown.Items = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'};
            app.MonthSelectionDropDown.ValueChangedFcn = createCallbackFcn(app, @MonthSelectionDropDownValueChanged, true);
            app.MonthSelectionDropDown.Position = [132 381 100 22];
            app.MonthSelectionDropDown.Value = '1';

            % Create OriginalDataEditFieldLabel
            app.OriginalDataEditFieldLabel = uilabel(app.LeftPanel);
            app.OriginalDataEditFieldLabel.HorizontalAlignment = 'right';
            app.OriginalDataEditFieldLabel.Position = [137 347 101 22];
            app.OriginalDataEditFieldLabel.Text = 'Original Data';

            % Create OriginalData
            app.OriginalData = uieditfield(app.LeftPanel, 'numeric');
            app.OriginalData.Editable = 'off';
            app.OriginalData.Position = [167 326 71 22];

            % Create InquireSingleDataButton
            app.InquireSingleDataButton = uibutton(app.LeftPanel, 'push');
            app.InquireSingleDataButton.ButtonPushedFcn = createCallbackFcn(app, @InquireSingleDataButtonPushed, true);
            app.InquireSingleDataButton.Position = [24 326 117 22];
            app.InquireSingleDataButton.Text = 'Inquire Single Data';

            % Create RightPanel
            app.RightPanel = uipanel(app.GridLayout);
            app.RightPanel.Title = 'Decision support system';
            app.RightPanel.Layout.Row = 1;
            app.RightPanel.Layout.Column = 2;

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.RightPanel);
            title(app.UIAxes2, 'Data Trend')
            xlabel(app.UIAxes2, 'Months')
            ylabel(app.UIAxes2, 'Parameter')
            app.UIAxes2.PlotBoxAspectRatio = [1.5672514619883 1 1];
            app.UIAxes2.YTick = [0 0.5 1];
            app.UIAxes2.TitleFontWeight = 'bold';
            app.UIAxes2.Position = [6 1 331 273];

            % Create ParameterSelectionDropDownLabel
            app.ParameterSelectionDropDownLabel = uilabel(app.RightPanel);
            app.ParameterSelectionDropDownLabel.HorizontalAlignment = 'right';
            app.ParameterSelectionDropDownLabel.Position = [51 402 116.375 22];
            app.ParameterSelectionDropDownLabel.Text = 'Parameter Selection';

            % Create ParameterSelectionDropDown
            app.ParameterSelectionDropDown = uidropdown(app.RightPanel);
            app.ParameterSelectionDropDown.Items = {'Dissolved Oxygen', 'Permanganate Index', 'BOD5', 'Ammonia nitrogen', 'Petroleum', 'Volatile Penol', 'CODcr', 'Total nitrogen', 'Total phosphorus', 'Sulfuret', 'Number of paracolon', '', '', '', '', '', ''};
            app.ParameterSelectionDropDown.ValueChangedFcn = createCallbackFcn(app, @ParameterSelectionDropDownValueChanged, true);
            app.ParameterSelectionDropDown.Position = [170 402 121.788759689922 22];
            app.ParameterSelectionDropDown.Value = 'Dissolved Oxygen';

            % Create ImageSelectionDropDownLabel
            app.ImageSelectionDropDownLabel = uilabel(app.RightPanel);
            app.ImageSelectionDropDownLabel.HorizontalAlignment = 'right';
            app.ImageSelectionDropDownLabel.Position = [56 347 91 22];
            app.ImageSelectionDropDownLabel.Text = 'Image Selection';

            % Create ImageSelectionDropDown
            app.ImageSelectionDropDown = uidropdown(app.RightPanel);
            app.ImageSelectionDropDown.Items = {'Actural trend', 'Predicting trend'};
            app.ImageSelectionDropDown.Position = [166 347 121.788759689922 22];
            app.ImageSelectionDropDown.Value = 'Actural trend';

            % Create AverageValueEditFieldLabel
            app.AverageValueEditFieldLabel = uilabel(app.RightPanel);
            app.AverageValueEditFieldLabel.HorizontalAlignment = 'right';
            app.AverageValueEditFieldLabel.Position = [184 305 84.375 22];
            app.AverageValueEditFieldLabel.Text = 'Average Value';

            % Create Result
            app.Result = uieditfield(app.RightPanel, 'numeric');
            app.Result.Editable = 'off';
            app.Result.Position = [184 273 121.788759689922 22];

            % Create PlotButton
            app.PlotButton = uibutton(app.RightPanel, 'push');
            app.PlotButton.ButtonPushedFcn = createCallbackFcn(app, @PlotButtonPushed, true);
            app.PlotButton.Position = [76 273 60 22];
            app.PlotButton.Text = 'Plot';

            % Show the figure after all components are created
            app.WaterQualityInformationSystemUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = linlyu

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.WaterQualityInformationSystemUIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.WaterQualityInformationSystemUIFigure)
        end
    end
end