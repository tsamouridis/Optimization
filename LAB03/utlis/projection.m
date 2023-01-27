% Performs the projection of coordinate x based on the vector limits
function projected_point = projection(x, limits)
    if x <= limits(1)
        projected_point = limits(1);
    elseif x >= limits(2)
        projected_point = limits(2);
    else % x inside the limits spectrum
        projected_point = x;
    end
end
