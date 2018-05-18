
% given dur (duration of the window in seconds), Fs, lenA_, lenD_, lenS_
% (all ratios of each region over the duration), max_ (the peak value) and
% sus_ (value of sustain region), returns the corresponding ADSR windowing
% function with time vector t.
% subregions defined lenA_, lenD_ and lenS_ must have valid length, and the 
% corresponding number of sampling points must be integer. max_ must also be 
% greater than sus_ for a valid windowing function. If the input fails any 
% of these requirements, exception(s) would be thrown.

function [t, ADSR] = ADSR(dur, Fs, lenA_, lenD_, lenS_, max_, sus_)
    % initialization and overloading
    lenA = 0; lenD = 0; lenS = 0; max = 0; sus = 0;
    switch nargin
        case 2 
            lenA = 1/8;
            lenD = 1/8;
            lenS = 1/2;
            max = 1.5;
            sus = 1;
        case 7
            lenA = lenA_;
            lenD = lenD_;
            lenS = lenS_;
            max = max_;
            sus = sus_;
        otherwise
            msgID1 = 'ASDR:BadArgument';
            msg1 = 'wrong number of input arguments';
            throw (MException(msgID1, msg1));
    end
    
    % define lenR and check validity of inputs 
    function check_valid_input(input)
        if (input <= 0 || input >= 1)
            msgID2 = 'ASDR:BadArgument';
            msg2 = ['invalid ratio input ', num2str(input)];
            throw (MException(msgID2, msg2));
        elseif (rem(input * dur * Fs, 1) ~= 0)
            msgID4 = 'ASDR:BadArgument';
            msg4 = 'input combination does not generate rational sampling number';
            throw (MException(msgID4, msg4));
        end
    end
    lenR = 1 - lenA - lenD - lenS;
    args = [lenA, lenD, lenS, lenR];
    for i = 1:length(args)
        check_valid_input(args(i));
    end
    if (max <= sus) 
        msgID3 = 'ASDR:BadArgument';
        msg3 = 'invalid max ans sus: max must be smaller than sus';
        throw (MException(msgID3, msg3));
    end
    
    % create the time vector for each part in the ADSR function.
    function t_vector = T_part(len_part)
        t_vector = 0:(1/Fs):len_part * dur - 1/Fs;
    end

    % define time vectors
    t_A = T_part(lenA);
    t_D = T_part(lenD);
    t_S = T_part(lenS);
    t_R = T_part(lenR); 
    t   = T_part(1);

    % calculate slopes
    slope_A = max / (lenA * dur);
    slope_D = (sus - max) / (lenD * dur);
    slope_R = - sus / (lenR * dur);
    
    % define each part of an ASDR window
    A = slope_A * t_A;
    D = slope_D * t_D + max; 
    S = 0 * t_S + sus;
    R = slope_R * t_R + sus;
    
    % concatenation
    ADSR = [A, D, S, R];
end