function varargout = RatePronunciation(varargin)
% RATEPRONUNCIATION MATLAB code for RatePronunciation.fig
%      RATEPRONUNCIATION, by itself, creates a new RATEPRONUNCIATION or raises the existing
%      singleton*.
%
%      H = RATEPRONUNCIATION returns the handle to a new RATEPRONUNCIATION or the handle to
%      the existing singleton*.
%
%      RATEPRONUNCIATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RATEPRONUNCIATION.M with the given input arguments.
%
%      RATEPRONUNCIATION('Property','Value',...) creates a new RATEPRONUNCIATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RatePronunciation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RatePronunciation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RatePronunciation

% Last Modified by GUIDE v2.5 17-Apr-2015 09:27:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RatePronunciation_OpeningFcn, ...
                   'gui_OutputFcn',  @RatePronunciation_OutputFcn, ...
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


% --- Executes just before RatePronunciation is made visible.
function RatePronunciation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RatePronunciation (see VARARGIN)

% Choose default command line output for RatePronunciation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


set(handles.slider1, 'value',0.5);
set(handles.slider2, 'value',0.5);
set(handles.slider3, 'value',0.5);
set(handles.slider4, 'value',0.5);

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

% --- Outputs from this function are returned to the command line.
function varargout = RatePronunciation_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
function slider1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
function slider2_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
function slider3_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
function slider4_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on button press in listenButton.
function listenButton_Callback(hObject, eventdata, handles)

soundPath = get(handles.soundPath,'string');
savePath = get(handles.savePath,'string');
saveName = get(handles.fileName,'string');
m = dlmread(fullfile(savePath,[saveName '.txt']));
listenNum = str2double(get(handles.speakerNum, 'String'));
[y,Fs] = audioread(fullfile(soundPath,[num2str(m(1,listenNum)) '.wav']));
handles.player = audioplayer(y,Fs);
play(handles.player)
    set(handles.listenButton,'visible','off')
if get(handles.radioOnceFree,'value') || (get(handles.radioSeveral,'value') && strcmp(get(handles.nextButton,'visible'),'on'))
    f = figure('Position',[400 400 240 80]);
    h = uicontrol('Position',[20 20 200 40],'String','Stop',...
        'Callback','uiresume(gcbf)');
    uiwait(gcf,ceil(handles.player.TotalSamples/handles.player.SampleRate));
    close(f);
else
    pause(ceil(handles.player.TotalSamples/handles.player.SampleRate));
end

set(handles.nextButton,'visible','on')
if get(handles.radioSeveral,'value')
    set(handles.listenButton,'visible','on')
end

% --- Executes on button press in nextButton.
function nextButton_Callback(hObject, eventdata, handles)
% hObject    handle to nextButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

savePath = get(handles.savePath,'string');
saveName = get(handles.fileName,'string');
m = dlmread(fullfile(savePath,[saveName '.txt']));
num = str2double(get(handles.speakerNum, 'String'));

values(1) = num;
values(2) = m(1,num);
values(3) = get(handles.slider1, 'value');
values(4) = get(handles.slider2, 'value');
values(5) = get(handles.slider3, 'value');
values(6) = get(handles.slider4, 'value');

dlmwrite(fullfile(savePath,[saveName '.txt']),values,'-append','precision','%.3f')

num = num + 1;
set(handles.speakerNum, 'String', num);
set(handles.slider1, 'value',0.5);
set(handles.slider2, 'value',0.5);
set(handles.slider3, 'value',0.5);
set(handles.slider4, 'value',0.5);

set(handles.listenButton,'visible','on')
set(handles.nextButton,'visible','off')

function speakerNum_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function speakerNum_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function soundPath_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function soundPath_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function savePath_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function savePath_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in startButton.
function startButton_Callback(hObject, eventdata, handles)
% hObject    handle to startButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global hear

hear = false;

set(handles.listenButton,'Visible','on')

savePath = get(handles.savePath,'string');
saveName = get(handles.fileName,'string');
soundPath = get(handles.soundPath,'string');

if ~exist(fullfile(savePath,[saveName '.txt']))
    
    p = dir(fullfile(soundPath,'*.wav'));
    
    for i = length(p):-1:1
        m(i) = str2num(p(i).name(1:end-4));
    end
    c = clock;
    s = RandStream('mt19937ar','seed',c(3)*24*60*30+c(4)*24*60+c(5)*60+c(6));
    m2 = randperm(s,length(p));
    set(handles.speakerNum, 'String', 1);
    set(handles.speakerTotal, 'String', length(p));
    dlmwrite(fullfile(savePath,[saveName '.txt']),m(m2))
    dlmwrite(fullfile(savePath,[saveName '.txt']),0,'-append')
else
    m = dlmread(fullfile(savePath,[saveName '.txt']));
    set(handles.speakerNum, 'String', m(end,1)+1);
    set(handles.speakerTotal, 'String', size(m,2));
end

function fileName_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function fileName_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in browseTextButton.
function browseTextButton_Callback(hObject, eventdata, handles)
p = uigetdir;
set(handles.soundPath,'string',p);

% --- Executes on button press in browseDataButton.
function browseDataButton_Callback(hObject, eventdata, handles)
p = uigetdir;
set(handles.savePath,'string',p);

function speakerTotal_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function speakerTotal_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radioOnceWait.
function radioOnceWait_Callback(hObject, eventdata, handles)
set(handles.radioOnceFree,'value',0);
set(handles.radioSeveral,'value',0);

function radioOnceFree_Callback(hObject, eventdata, handles)
set(handles.radioOnceWait,'value',0)
set(handles.radioSeveral,'value',0)

function radioSeveral_Callback(hObject, eventdata, handles)
set(handles.radioOnceFree,'value',0)
set(handles.radioOnceWait,'value',0)
