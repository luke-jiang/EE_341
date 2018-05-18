clear all; close all;
% relevant parameters
Fs = 8000;
t_whole = 0:(1/Fs):(2-1/Fs);
t_half = 0:(1/Fs):(1-1/Fs);
t_quarter = 0:(1/Fs):(0.5-1/Fs);
pause = 0 * t_quarter;
lenSeg = length(t_quarter);  % 4000
note_text = 'twinkle.txt';
output_name = [note_text, '_result.wav'];

% implementing two octaves (whole and half)
octave_whole = makeOctave(2, Fs, 1:8);  % 5 * lenSeg
octave_half = makeOctave(1, Fs, 1:8);   % 3 * lenSeg
octave_quarter = makeOctave(0.5, Fs, 1:8); % 2 * lenSeg

% get ADSR windows
[t_1, ADSR_whole] = ADSR(2, Fs, 1/8, 1/8, 1/4, 3, 1);
[t_2, ADSR_half] = ADSR(1, Fs, 1/8, 1/8, 1/4, 3, 1);
[t_3, ADSR_quarter] = ADSR(0.5, Fs, 1/8, 1/8, 1/4, 3, 1);
whole_mod = [ADSR_whole, pause];
half_mod = [ADSR_half, pause];
quarter_mod = [ADSR_quarter, pause];

% modulate three octaves with corresponding ADSR windows.
for i = 1:8
    octave_whole(i,:) = octave_whole(i,:) .* whole_mod;
    octave_half(i,:) = octave_half(i,:) .* half_mod;
    octave_quarter(i,:) = octave_quarter(i,:) .* quarter_mod;
end
% read from text
fileID = fopen(note_text);
notes = textscan(fileID, '%c');
notes = notes{1};
%notes2index = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];

% calculate the length of result music signal
reslen = 0;
for i = 1:length(notes)
    note = notes(i);
    
    if strcmp(note, '-')
        reslen = reslen + 3 * lenSeg;
    else 
        reslen = reslen + 1 * lenSeg;
    end
end        
result = zeros(1, reslen + lenSeg);

% implement the result signal
overlap = 200;
wholeNote = false;
j = 1;
for i = 1:length(notes)
     note = notes(i);
     if ~strcmp(note, '-') && ~strcmp(note, '*')
         wholeNote = i < length(notes) && strcmp(notes(i+1), '-');
         halfNote = i < length(notes) && strcmp(notes(i+1), '*');
         index = note - 'A' + 1;
         if index < 0 || index > 8
             msgID = 'ASDR:BadInput';
             msg = 'illegal sound character input';
             throw (MException(msgID, msg));
         end
         if wholeNote
             result(j:j + (5 * lenSeg - 1)) = result(j:j + (5 * lenSeg - 1)) + octave_whole(index,:);
             j = j + 4 * lenSeg - overlap;
         elseif halfNote
             result(j:j + (3 * lenSeg - 1)) = result(j:j + (3 * lenSeg - 1)) + octave_half(index,:);
             j = j + 2 * lenSeg - overlap;
         else 
             result(j:j + (2 * lenSeg - 1)) = result(j:j + (2 * lenSeg - 1)) + octave_quarter(index,:);
             j = j + 1 * lenSeg - overlap;
         end
    end
end

% write result to file
audiowrite(output_name, result, Fs);

        
