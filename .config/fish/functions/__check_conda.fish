function __check_conda
    if type -q "conda"
        conda > /dev/null
        if test $status -eq 0
            return 0
        else
            return 1
        end
    else 
        return 1
    end
end
