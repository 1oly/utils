function read_pulse(fname)
    fi = open(fname, "r")
    a = readlines(fi);

    # Find first occurrence of the number 1 in column 1
    index = 0;
    mystop = false;
    while !mystop 
        index += 1
        mystop = bool(searchindex(string(a[index][1]),"1"))
    end
    
    data = zeros(1,length(split(chomp(a[index])))) # Allocate data array
    
    mystop = false;
    while !mystop
        line = split(chomp(a[index]))';
        data = [data; float(line)];
        index += 1
        mystop = bool(searchindex(string(a[index][1]),"T"))
    end

    close(fi)
    f = data[:,2];
    realH = data[:,3];
    if size(data,2) == 4
        imgH = data[:,4];
        H = realH + im*imgH;
    else
        H = realH;
    end
    return f,H
end