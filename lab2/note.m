% pre:  takes exp (frequency adjust), length(whole/half/quarter node)
%       , Fs(sampling frequency) as parameters
% post: return a synthesized sinusoid note concatenated with a pause
%       of constant length
function ret = note(exp, length, Fs)
    t = 0:(1/Fs):(length-1/Fs);
    pause = 0 * 0:(1/Fs):(0.5-1/Fs);
    ret = [cos(220*2^(exp/12)*2*pi*t), pause];
end