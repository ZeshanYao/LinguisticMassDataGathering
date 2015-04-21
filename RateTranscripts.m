function varargout = RateTranscripts(varargin)
% RATETRANSCRIPTS MATLAB code for RateTranscripts.fig
%      RATETRANSCRIPTS, by itself, creates a new RATETRANSCRIPTS or raises the existing
%      singleton*.
%
%      H = RATETRANSCRIPTS returns the handle to a new RATETRANSCRIPTS or the handle to
%      the existing singleton*.
%
%      RATETRANSCRIPTS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RATETRANSCRIPTS.M with the given input arguments.
%
%      RATETRANSCRIPTS('Property','Value',...) creates a new RATETRANSCRIPTS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RateTranscripts_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RateTranscripts_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RateTranscripts

% Last Modified by GUIDE v2.5 07-Feb-2015 17:20:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RateTranscripts_OpeningFcn, ...
                   'gui_OutputFcn',  @RateTranscripts_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before RateTranscripts is made visible.
function RateTranscripts_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RateTranscripts (see VARARGIN)

% Choose default command line output for RateTranscripts
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


set(handles.slider1, 'value',0.5);
set(handles.slider2, 'value',0.5);
set(handles.slider3, 'value',0.5);
set(handles.slider4, 'value',0.5);
set(handles.slider5, 'value',0.5);

axes(handles.axes1);
plot([-0.7 0.7],[0.6 0.6],'ok')
hold on
x = -0.9:0.1:0.9;
y = -x.^2/3-1;
plot(x,y,'k');
rectangle('Position',[-2 -2, 4 4],'Curvature',[1 1])
axis off

axes(handles.axes2);
plot([-0.7 0.7],[0.6 0.6],'ok')
hold on
x = -0.9:0.1:0.9;
y = x.^2/3-1;
plot(x,y,'k');
rectangle('Position',[-2 -2, 4 4],'Curvature',[1 1])
axis off

% UIWAIT makes RateTranscripts wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RateTranscripts_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in nextButton.
function nextButton_Callback(hObject, eventdata, handles)
% hObject    handle to nextButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

savePath = get(handles.savePath,'string');
saveName = get(handles.fileName,'string');
m = dlmread(fullfile(savePath,[saveName '.txt']));
num = str2double(get(handles.passageNum, 'String'));

values(1) = num;
values(2) = m(1,num);
values(3) = get(handles.slider1, 'value');
values(4) = get(handles.slider2, 'value');
values(5) = get(handles.slider3, 'value');
values(6) = get(handles.slider4, 'value');
values(7) = get(handles.slider5, 'value');

dlmwrite(fullfile(savePath,[saveName '.txt']),values,'-append','precision','%.3f')

num = num + 1;
set(handles.passageNum, 'String', num);
set(handles.slider1, 'value',0.5);
set(handles.slider2, 'value',0.5);
set(handles.slider3, 'value',0.5);
set(handles.slider4, 'value',0.5);
set(handles.slider5, 'value',0.5);

textPath = get(handles.textPath,'string');
f = fopen(fullfile(textPath,[num2str(m(1,num)) '.txt']));
t = textscan(f,'%s');
t = t{1};
fclose(f);
textLine = [];
for i = 1:length(t)
    textLine = [textLine t{i} ' '];
end
set(handles.passageText1,'string',textLine);

set(handles.nextButton,'Visible','off')
pause(4)
set(handles.nextButton,'Visible','on')

function passageNum_Callback(hObject, eventdata, handles)
% hObject    handle to passageNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of passageNum as text
%        str2double(get(hObject,'String')) returns contents of passageNum as a double


% --- Executes during object creation, after setting all properties.
function passageNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to passageNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function textPath_Callback(hObject, eventdata, handles)
% hObject    handle to textPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textPath as text
%        str2double(get(hObject,'String')) returns contents of textPath as a double


% --- Executes during object creation, after setting all properties.
function textPath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function savePath_Callback(hObject, eventdata, handles)
% hObject    handle to savePath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of savePath as text
%        str2double(get(hObject,'String')) returns contents of savePath as a double


% --- Executes during object creation, after setting all properties.
function savePath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to savePath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in startButton.
function startButton_Callback(hObject, eventdata, handles)
% hObject    handle to startButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

savePath = get(handles.savePath,'string');
saveName = get(handles.fileName,'string');
textPath = get(handles.textPath,'string');

if ~exist(fullfile(savePath,[saveName '.txt']))
    
    p = dir(fullfile(textPath,'*.txt'));
    
    for i = length(p):-1:1
        m(i) = str2num(p(i).name(1:end-4));
    end
    c = clock;
    s = RandStream('mt19937ar','seed',c(3)*24*60*30+c(4)*24*60+c(5)*60+c(6));
    m2 = randperm(s,length(p));
    m = m(m2);
    dlmwrite(fullfile(savePath,[saveName '.txt']),m)
    dlmwrite(fullfile(savePath,[saveName '.txt']),0,'-append')
    set(handles.passageNum, 'String', 1);
    set(handles.passageTotal, 'String', length(p));
    num = 1;
else
    m = dlmread(fullfile(savePath,[saveName '.txt']));
    num = m(end,1)+1;
    set(handles.passageNum, 'String', num);
    set(handles.passageTotal, 'String', size(m,2));
end

textPath = get(handles.textPath,'string');
f = fopen(fullfile(textPath,[num2str(m(1,num)) '.txt']));
t = textscan(f,'%s');
t = t{1};
fclose(f);

textLine = [];
for i = 1:length(t)
    textLine = [textLine t{i} ' '];
end
set(handles.passageText1,'string',textLine);

pause(4)
set(handles.nextButton,'Visible','on')


function fileName_Callback(hObject, eventdata, handles)
% hObject    handle to fileName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fileName as text
%        str2double(get(hObject,'String')) returns contents of fileName as a double


% --- Executes during object creation, after setting all properties.
function fileName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fileName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in browseTextButton.
function browseTextButton_Callback(hObject, eventdata, handles)
% hObject    handle to browseTextButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
p = uigetdir;
set(handles.textPath,'string',p);

% --- Executes on button press in browseDataButton.
function browseDataButton_Callback(hObject, eventdata, handles)
% hObject    handle to browseDataButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
p = uigetdir;
set(handles.savePath,'string',p);



function passageTotal_Callback(hObject, eventdata, handles)
% hObject    handle to passageTotal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of passageTotal as text
%        str2double(get(hObject,'String')) returns contents of passageTotal as a double


% --- Executes during object creation, after setting all properties.
function passageTotal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to passageTotal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
