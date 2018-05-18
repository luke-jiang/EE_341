% fid = fopen('example.txt');
% line1 = fgets(fid)
% line1 = fgets(fid)

oct_220 = Octave(8000, 220);
oct_440 = Octave(8000, 440);
oct_880 = Octave(8000, 880);

function s = Octave(Fs, order)
    fields = string({'l1', 'l2', 'l3', 'l4', 'l5'});
    for i = 1:5
        s.(fields(i)) = makeOctave1(2 ^ (i - 1) * 0.125, Fs, order);
    end
    
    function octave = makeOctave1(length_, Fs, order)
        t = 0:(1/Fs):(length_ - 1/Fs);
        fields1 = ['A', 'a', 'B', 'C', 'c', 'D', 'd', 'E', 'F', 'f', 'G', 'g'];    
        for j = 1:12
            octave.(fields1(j)) = 2 * sin(order * 2^((j - 1)/12) * 2*pi*t) .* exp(length_/-0.5);
        end
    end
end

