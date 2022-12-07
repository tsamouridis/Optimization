function positive_definite = is_positive_definite(A)
    if A(1,1) > 0 && det(A) > 0
        positive_definite = true;
    else
        positive_definite = false;
    end
end
    