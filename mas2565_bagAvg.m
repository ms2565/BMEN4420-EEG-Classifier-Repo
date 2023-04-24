function y_bagged = mas2565_bagAvg(y_set)
    y_set_avg = mean(y_set,2);
    y_bagged = round(y_set_avg);
end