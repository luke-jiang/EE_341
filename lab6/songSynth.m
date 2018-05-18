clear all; close all;
% relevant parameters
Fs = 8000;
t_4 =   0:(1/Fs):(2 - 1/Fs); % 4 - 2
t_3 =   0:(1/Fs):(1 - 1/Fs); % 3 - 1
t_2 =   0:(1/Fs):(0.5 - 1/Fs); % 2 - 0.5
t_1 =   0:(1/Fs):(0.25 - 1/Fs); % 1 - 0.25
t_0 =   0:(1/Fs):(0.125 - 1/Fs); % 0 - 0.125


pause = 0 .* t_0;
lenSeg = length(t_0);
note_text = 'song.xlsx';
output_name = [note_text, '_result.wav'];

% implementing two octaves
if ~exist('oct_220', 'var') || ~exist('oct_440', 'var') || ~exist('oct_880', 'var')
    makeOctave;
end

% read from text

[durations, notes] = xlsread(note_text);

% notes2index = ['A', 'a', 'B', 'C', 'c', 'D', 'd', 'E', 'F', 'f', 'G', 'g'];

% calculate the length of result music signal
% the length is determined by every 3rd tag
reslen = 0;
for k = 1:length(durations)
    reslen = reslen + lenSeg * power(2, durations(k) - 1);
end
result = zeros(1, reslen);

% implement the result signal
overlap = 700;
curr = 1;
for i = 1:size(notes, 1)
    curr = 1;
    for j = 1:size(notes, 2)
        note_order = char(notes(i, j));
        note = note_order(1);

        curr_len = lenSeg * power(2, durations(j) - 1);
        if (strcmp(note, 'P'))
            curr = curr + curr_len - overlap;
            continue;
        end
        fld = ['l', num2str(durations(j))];
        order = note_order(2);
        if strcmp(order, '*')
            result(curr:curr + curr_len - 1) = result(curr:curr + curr_len - 1) + oct_880.(fld).(note);
        elseif strcmp(order, '+') % 440
            result(curr:curr + curr_len - 1) = result(curr:curr + curr_len - 1) + oct_440.(fld).(note);
        else
            result(curr:curr + curr_len - 1) = result(curr:curr + curr_len - 1) + oct_220.(fld).(note);
        end
        curr = curr + curr_len - overlap;
    end
end
% write result to file

h_equal = equalizer(10, 5, 1, 1);
result_equal = conv(result, h_equal, 'same');
result_norm = result / max(abs(result));
audiowrite(output_name, result_norm, Fs);
